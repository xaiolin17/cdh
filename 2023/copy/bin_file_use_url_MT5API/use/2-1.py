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

pd.set_option('display.max_columns', 500)  # number of columns to be displayed
pd.set_option('display.width', 1500)  # max table width to display


login = 76509614
password = "76509614Qq@"
server = "Exness-MT5Trial5"
initialize_path = "F:/mt5D/MetaTrader 5 - 2-1/terminal64.exe"
onnx_path = 'D:/propycharm2023/mq5/result/autoLitModel/163/smallModel.onnx'
file_path = "C:/Program Files/MetaTrader 5/MQL5/Files/DataBin3.bin"

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

        lot = 0.01                                  # 交易量
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
            "sl": price - rates_frame['ATR5'].iloc[-2] * 0.1,
            "tp": price + rates_frame['ATR5'].iloc[-2] * 0.2,
            "deviation": deviation,
            "magic": 240102,
            "comment": "python script open",
            "type_time": mt5.ORDER_TIME_GTC,
            "type_filling": mt5.ORDER_FILLING_IOC,
        }
        # 显示有关程序端设置和状态的信息
        terminal_info_dict = mt5.terminal_info()._asdict()
        # 将词典转换为DataFrame和print
        # df_terminal_info = pd.DataFrame(list(terminal_info_dict.items()), columns=['property', 'value'])
        print("***程序端状态:")
        print(terminal_info_dict)
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
    # 如果文件存在，则记录文件的初始时间；否则，设置一个默认值
    initial__time = 1
    while True:
        # 当前账户信息
        account_info_dict = mt5.account_info()._asdict()
        # 文件是否存在
        if not os.path.exists(file_path):
            # 如果文件不存在
            print("文件不存在    default_hash_value")
        else:
            # 获取文件修改时间
            modification_time = os.path.getmtime(file_path)
            # 判断文件是否修改
            if initial__time != modification_time and initial__time!= 1:
                print('\n文件修改时间发生改变，读取文件数据 ...   ')
                try:
                    with open(file_path, 'rb') as file:
                        content = file.read()
                    """执行操作"""
                    # 读取二进制文件
                    binary_data = np.fromfile(file_path, dtype=np.float64).astype(np.float32)
                    # 读取onnx
                    sess = rt.InferenceSession(onnx_path)
                    # 输入数据运行模型 label <class 'numpy.ndarray'>  probabilities <class 'list'>
                    label, probabilities = sess.run(['label', 'probabilities'],
                                                    {'features': binary_data.reshape((1, -1))})
                    # label[0] <class 'numpy.int64'> probabilities[0] <class 'dict'>
                    if label[0] == 1:
                        # 订单数
                        orders_total = mt5.positions_total()
                        print("--->Buy orders_total", orders_total)
                        # 买操作
                        Buy()
                        """是否请求成功 比对操作后的订单数是否变化"""
                        # 查看buy后的订单数
                        orders_total_current = mt5.positions_total()
                        print("Buy--->orders_total_current", orders_total_current)
                        # 直到买入成功
                        while orders_total == orders_total_current:
                            print("上一次失败，将重新Buy")
                            # 买操作
                            Buy()
                            orders_total_current = mt5.positions_total()
                            print("--->Buy---> orders_total_current", orders_total_current)

                        # 获取交易品种的订单列表
                        positions_get = mt5.positions_get()
                        df_positions_get = pd.DataFrame(list(positions_get), columns=positions_get[0]._asdict().keys())
                        df_positions_get['time'] = pd.to_datetime(df_positions_get['time'], unit='s')
                        df_positions_get.drop(['time_update', 'time_msc', 'time_update_msc', 'external_id'], axis=1, inplace=True)
                        print('******当前订单列表******')
                        print(df_positions_get)
                        # 执行操作后暂停一段时间后再次轮询
                    else:
                        print('未达buy条件！！！')
                    print(datetime.now(), label, probabilities)

                except PermissionError:
                    print('\n---> ---> error ...')
                    time.sleep(0.02)  # 等待再次尝试尝试

            # 重新赋值
            initial__time = modification_time

monitor_file(file_path)

# 断开与MetaTrader 5程序端的连接
mt5.shutdown()