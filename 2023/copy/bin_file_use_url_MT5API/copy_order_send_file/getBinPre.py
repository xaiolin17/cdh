import os
import hashlib
import time
from datetime import datetime, timedelta
import numpy as np
import pandas as pd
import onnxruntime as rt
import MetaTrader5 as mt5
import pytz
import talib


login = 76467402
password = "76467402Qq@"
server = "Exness-MT5Trial5"
initialize_path = "F:/mt5D/MetaTrader 5/terminal64.exe"
onnx_path = 'D:/propycharm2023/mq5/result/autoLitModel/163/smallModel.onnx'
file_path = "C:/Program Files/MetaTrader 5/MQL5/Files/DataBin.bin"

# 建立与MetaTrader 5程序端的连接
if not mt5.initialize(path=initialize_path, login=login, password=password, server=server):
    print("initialize() failed, error code =", mt5.last_error())
    quit()

# 准备买入请求结构
symbol = "XAUUSDm"
symbol_info = mt5.symbol_info(symbol)
if symbol_info is None:
    print(symbol, "not found, can not call order_check()")
    mt5.shutdown()
    quit()

# 如果市场报价中没有此交易品种，请添加
if not symbol_info.visible:
    print(symbol, "is not visible, trying to switch on")
    if not mt5.symbol_select(symbol, True):
        print("symbol_select({}}) failed, exit", symbol)
        mt5.shutdown()
        quit()

def getdata(symblo, start_pos, count):
    # # 将时区设置为UTC MetaTrader 5以UTC时区保存报价和柱形图开盘时间
    # timezone = pytz.timezone(zone)
    # # 以UTC时区创建'datetime'对象，以避免实现本地时区偏移
    # current_time = datetime.now()
    # # 计算30天前的时间
    # previous_time = current_time - timedelta(days=30)
    # # print('当前时间', current_time)
    # utc_from = datetime(previous_time.year, previous_time.month, previous_time.day, tzinfo=timezone)
    # utc_to = datetime(current_time.year, current_time.month, current_time.day, tzinfo=timezone)
    # # 获取数据
    # rates = mt5.copy_rates_from(symblo, mt5.TIMEFRAME_D1, utc_from, utc_to)
    rates = mt5.copy_rates_from_pos(symblo, mt5.TIMEFRAME_D1, start_pos, count)

    return rates

def Buy():
    try:
        # 获取数据
        # rates = getdata("Etc/UTC", symbol)
        rates = getdata(symbol, 0, 30)
        # 从所获得的数据创建DataFrame
        rates_frame = pd.DataFrame(rates)
        # 将时间（以秒为单位）转换为日期时间格式
        # rates_frame['time'] = pd.to_datetime(rates_frame['time'], unit='s')
        # ATR 用于衡量价格波动性的指标
        rates_frame['ATR5'] = talib.ATR(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=5)

        lot = 0.1                                  # 交易量
        point = mt5.symbol_info(symbol).point       # 小数位数
        price = mt5.symbol_info_tick(symbol).ask    # 价格
        deviation = 300                             # 允许价格偏差
        # print("point", point, "price", price)
        request = {
            "action": mt5.TRADE_ACTION_DEAL,
            "symbol": symbol,
            "volume": lot,
            "type": mt5.ORDER_TYPE_BUY,
            "price": price,
            "sl": price - rates_frame['ATR5'].iloc[-2] * 0.2,
            "tp": price + rates_frame['ATR5'].iloc[-2] * 0.1,
            "deviation": deviation,
            "magic": 240102,
            "comment": "python script open",
            "type_time": mt5.ORDER_TIME_GTC,
            "type_filling": mt5.ORDER_FILLING_IOC,
        }
        # 显示有关程序端设置和状态的信息
        terminal_info_dict = mt5.terminal_info()._asdict()
        # 将词典转换为DataFrame和print
        df_terminal_info = pd.DataFrame(list(terminal_info_dict.items()), columns=['property', 'value'])
        print("***程序端状态:")
        print(df_terminal_info)
        # 发送交易请求
        result = mt5.order_send(request)
        # 检查执行结果
        print("---1. order_send(): by {} {} lots at {} with deviation={} points".format(symbol, lot, price, deviation));
        if result.retcode != mt5.TRADE_RETCODE_DONE:
            print("！！！！2. order_send failed, retcode={}".format(result.retcode))
            # 请求词典结果并逐个元素显示
            result_dict = result._asdict()
            for field in result_dict.keys():
                print("   {}={}".format(field, result_dict[field]))
                # if this is a trading request structure, display it element by element as well
                if field == "request":
                    traderequest_dict = result_dict[field]._asdict()
                    for tradereq_filed in traderequest_dict:
                        print("       traderequest: {}={}".format(tradereq_filed, traderequest_dict[tradereq_filed]))
        else:
            print("---2. order_send done, ", result)
            print("   opened position with POSITION_TICKET={}".format(result.order))

    except Exception as e:
        print(e)


def monitor_file(file_path):

    # 如果文件存在，则记录文件的初始哈希值；否则，设置文件的初始哈希值为一个默认值
    initial_hash = "default_hash_value"
    while True:
        # 当前账户信息
        account_info_dict = mt5.account_info()._asdict()
        # 获取交易品种的订单列表
        # gbp_orders_action = mt5.orders_get()
        # gbp_orders_action = pd.DataFrame(list(gbp_orders_action), columns=gbp_orders_action[0]._asdict().keys())
        # gbp_orders_action.drop(['time_done', 'time_done_msc', 'position_id', 'position_by_id', 'reason',
        #                     'volume_initial', 'price_stoplimit'], axis=1, inplace=True)
        # gbp_orders_action['time_setup'] = pd.to_datetime(gbp_orders_action['time_setup'], unit='s')
        # print('当前订单列表')
        # print(gbp_orders_action)
        if not os.path.exists(file_path):
            # 如果文件不存在
            print("文件不存在    default_hash_value")
        else:
            try:
                with open(file_path, 'rb') as file:
                    content = file.read()
                # 计算一个字符串或字节串的 SHA-256 哈希值
                hash_object = hashlib.sha256(content)
                # 十六进制表示
                after_hash = hash_object.hexdigest()
                # 如果当前哈希值与初始哈希值不同，则表示文件发生了变化
                if after_hash != initial_hash:
                    print('\n数据文件发生变化   ', after_hash)
                    """执行操作"""
                    # 读取二进制文件
                    binary_data = np.fromfile(file_path, dtype=np.float64).astype(np.float32)
                    # print(binary_data, len(binary_data), type(binary_data))
                    sess = rt.InferenceSession(onnx_path)
                    # inputs = sess.get_inputs()
                    # for input in inputs:
                    #   print(input.name,input.shape,input.type)
                    # or both label <class 'numpy.ndarray'>  probabilities <class 'list'>
                    label, probabilities = sess.run(['label', 'probabilities'],
                                                    {'features': binary_data.reshape((1, -1))})
                    # label[0] <class 'numpy.int64'> probabilities[0] <class 'dict'>
                    if label[0] == 1 and initial_hash != "default_hash_value":
                        # 活动订单数
                        orders_total = mt5.orders_total()
                        # 买操作
                        Buy()
                        """比对操作后的订单数是否变化"""
                        # 查看订单数
                        orders_total_current = mt5.orders_total()
                        while orders_total == orders_total_current:
                            # 买操作
                            Buy()
                            orders_total_current = mt5.orders_total()

                        # 获取交易品种的订单列表
                        df_orders_get = mt5.orders_get()
                        df_orders_get = pd.DataFrame(list(df_orders_get), columns=df_orders_get[0]._asdict().keys())
                        df_orders_get.drop(
                            ['time_done', 'time_done_msc', 'position_id', 'position_by_id', 'reason',
                             'volume_initial', 'price_stoplimit'], axis=1, inplace=True)
                        df_orders_get['time_setup'] = pd.to_datetime(df_orders_get['time_setup'], unit='s')
                        print('******当前订单列表******')
                        print(df_orders_get)
                        # 执行操作后暂停一段时间后再次轮询
                    else:
                        print('未达buy条件！！！')

                    print(datetime.now(), label, probabilities)
                    # 重新赋值哈希值
                    initial_hash = after_hash
                #     # Buy()
                #     pass
                #     # time.sleep(1)

            except PermissionError:
                print('\n---> ---> 该文件正在被其他程序锁定，正在等待重试 ...')
                time.sleep(0.02)  # 等待 1 秒钟，然后再次尝试访问文件

monitor_file(file_path)

# 断开与MetaTrader 5程序端的连接
mt5.shutdown()