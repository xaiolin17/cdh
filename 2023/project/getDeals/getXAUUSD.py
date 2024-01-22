import numpy as np
import pandas as pd
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()
import MetaTrader5 as mt5

from dataFeature import creatFeature
# 显示有关MetaTrader 5程序包的数据
print("MetaTrader5 package author: ", mt5.__author__)
print("MetaTrader5 package version: ", mt5.__version__)

pd.set_option('display.max_columns', 500)  # number of columns to be displayed
pd.set_option('display.width', 1500)  # max table width to display


login = 59605540
password = "59605540Qq@"
server = "Exness-MT5Real5"
initialize_path = "F:/mt5D/MT5/terminal64.exe"
symbol = "XAUUSDm"

def connetmt5(initialize_path, login, password, server):
    # 建立与MetaTrader 5程序端的连接
    if not mt5.initialize(path=initialize_path, login=login, password=password, server=server):
        print("初始化失败 代码 ", mt5.last_error())
        quit()
    # 请求连接状态和参数
    print('1', mt5.terminal_info())
    # 获取有关MetaTrader 5版本的数据
    print('2', mt5.version())

    return mt5

def getdata(symblo, period, start_pos, count):
    # 将时区设置为UTC MetaTrader 5以UTC时区保存报价和柱形图开盘时间
    # timezone = pytz.timezone(zone)
    # 以UTC时区创建'datetime'对象，以避免实现本地时区偏移
    # utc_from = datetime(int(timestr.split('.')[0]), int(timestr.split('.')[1]), int(timestr.split('.')[2]), tzinfo=timezone)
    # 当前时间
    # current_time = datetime.now()
    # print('当前时间', current_time)
    # utc_to = datetime(current_time.year, current_time.month, current_time.day, tzinfo=timezone)
    # 在UTC时区，获取数据
    rates = mt5.copy_rates_from_pos(symblo, period, start_pos, count)

    return rates

def getDataXAUUSD(count):
    # 请求连接
    mt5 = connetmt5(initialize_path, login, password, server)
    # 获取数据 getdata(zone,timestr,symblo)
    # rates = getdata("Etc/UTC","2020.1.1",symbol)
    # count = 112233
    # 5分钟数据
    ratesM5 = getdata(symbol, mt5.TIMEFRAME_M5, 0, count)
    # 15分钟数据
    ratesM15 = getdata(symbol, mt5.TIMEFRAME_M15, 0, int(count/1.5))
    # 1小时数据
    ratesH1 = getdata(symbol, mt5.TIMEFRAME_H1, 0, int(count/6))
    # 4小时数据
    ratesH4 = getdata(symbol, mt5.TIMEFRAME_H4, 0, int(count/24))
    # 1天数据
    ratesD1 = getdata(symbol, mt5.TIMEFRAME_D1, 0, int(count/(12*12)))
    # 断开与MetaTrader 5程序端的连接
    mt5.shutdown()

    # 从所获得的数据创建DataFrame
    ratesM5_frame = pd.DataFrame(ratesM5)
    # 释放内存
    del ratesM5
    # 将时间（以秒为单位）转换为日期时间格式
    ratesM5_frame['time'] = pd.to_datetime(ratesM5_frame['time'], unit='s')
    ratesM5_frame = ratesM5_frame.drop(['spread', 'real_volume'], axis=1, inplace=False)
    print('\nratesM5_frame数据长度', len(ratesM5_frame))

    ratesM15_frame = pd.DataFrame(ratesM15)
    del ratesM15
    ratesM15_frame['time'] = pd.to_datetime(ratesM15_frame['time'], unit='s')
    ratesM15_frame = ratesM15_frame.drop(['spread', 'real_volume'], axis=1, inplace=False)
    print('\nratesM15_frame数据长度', len(ratesM15_frame))

    ratesH1_frame = pd.DataFrame(ratesH1)
    del ratesH1
    ratesH1_frame['time'] = pd.to_datetime(ratesH1_frame['time'], unit='s')
    ratesH1_frame = ratesH1_frame.drop(['spread', 'real_volume'], axis=1, inplace=False)
    print('\nratesH1_frame数据长度', len(ratesH1_frame))

    ratesH4_frame = pd.DataFrame(ratesH4)
    del ratesH4
    ratesH4_frame['time'] = pd.to_datetime(ratesH4_frame['time'], unit='s')
    ratesH4_frame = ratesH4_frame.drop(['spread', 'real_volume'], axis=1, inplace=False)
    print('\nratesH4_frame数据长度', len(ratesH4_frame))

    ratesD1_frame = pd.DataFrame(ratesD1)
    del ratesD1
    ratesD1_frame['time'] = pd.to_datetime(ratesD1_frame['time'], unit='s')
    ratesD1_frame = ratesD1_frame.drop(['spread', 'real_volume'], axis=1, inplace=False)
    print('\nratesD1_frame数据长度', len(ratesD1_frame))
    # rates_frame = rates_frame.reset_index(drop=True)
    # 显示数据

    data_M5 = creatFeature(ratesM5_frame)
    data_M15 = creatFeature(ratesM15_frame)
    data_H1 = creatFeature(ratesH1_frame)
    data_H4 = creatFeature(ratesH4_frame)
    data_D1 = creatFeature(ratesD1_frame)
    # print(data_D1[data_D1['time'] == '2022-06-13'])
    # data_D1 = data_D1.assign(time=pd.to_datetime(data_D1['time']))
    # print(data_D1)

    merged_df1 = pd.merge(data_M5, data_M15, on="time", how="left", suffixes=('_M5', '_M15'))
    del data_M5, data_M15
    merged_df2 = pd.merge(data_H1, data_H4, on="time", how="left", suffixes=('_H1', '_H4'))
    del data_H1, data_H4
    # concat_df = pd.concat([merged_df1, merged_df2], axis=1)
    concat_df = pd.merge(merged_df1, merged_df2, on="time", how="left")

    # 将 concat_df 的时间列转换为只包含日期的格式
    # data_D1['time'] = pd.to_datetime(data_D1['time']).dt.strftime("%Y-%m-%d %H:%M:%S")
    concat_df["time"] = pd.to_datetime(concat_df["time"]).dt.date
    data_D1["time"] = pd.to_datetime(data_D1["time"]).dt.date

    # 使用 pd.merge 进行合并
    data = pd.merge(concat_df, data_D1, on="time", how="left")
    del data_D1
    print("\ndata.shape", data.shape)

    data.replace(to_replace=[None], value=np.nan, inplace=True)
    data.fillna(method="ffill", inplace=True)

    null_count = pd.DataFrame(data.isnull().sum(), columns=['Null_Counts'])

    if data.isnull().values.any():
        print("\n存在空值\n", len(data[data.isnull().any(axis=1)].index))
        # 剔除因为计算而造成的NULL
        data = data.dropna(axis=0)
        # 重置索引
        data = data.reset_index(drop=True)
        print("\ndropna data.shape", data.shape)
    print(data['time'].iloc[[0, -1]])

    """
    入库
    """

# #止损价位 stoploss
# rates_LS = rates_frame.copy()
# rates_LS['Stoploss'] = rates_LS['ATR5'].shift(1)
# rates_LS['Stoploss'] = rates_LS.apply(lambda x: x['high'] - x['Stoploss'] * 0.25, axis=1)
# #止盈价位 Stopprofit
# rates_TP = rates_LS.copy()
# rates_TP['Stopprofit'] = rates_TP['ATR5'].shift(1)
# rates_TP['Stopprofit'] = rates_TP.apply(lambda x: x['high'] + x['Stopprofit'] * 0.25, axis=1)
# """
# #止损价位 stoploss
# rates_LS = rates_frame.copy()
#
# rates_LS['Stoploss'] =rates_LS.apply(lambda x: x['high'] - x['ATR20'] * 0.2, axis=1)
# #止盈价位 Stopprofit
# rates_TP = rates_LS.copy()
# rates_TP['Stopprofit'] = rates_TP.apply(lambda x: x['high'] + x['ATR20'] * 0.2, axis=1)
# """
#
# #状态 止盈 1 止损 2
# rates_TP['Type'] = np.NAN
# rates_TP['interval'] = np.NAN
#
# rates_TP = rates_TP.reset_index()
# print(rates_TP.head(2),'\n数据长度',len(rates_TP))
#
# kdata = rates_TP.copy()
# """
# 以往后天数的最大值作为判断
# """
# """ #止盈 1
#         if kdata.loc[j,'close'] >= tp:
#             kdata.loc[i,'Type'] = 1
#             kdata.loc[i, 'Profit'] = kdata.loc[i,'close'] - tp
#             break
#         # 止损 0
#         elif kdata.loc[j,'close'] <= ls:
#             kdata.loc[i,'Type'] = 0
#             kdata.loc[i, 'Profit'] = kdata.loc[i,'close'] - ls
#             break"""
# for i in range(len(kdata)):
#     ls = kdata.loc[i,'Stoploss']
#     tp = kdata.loc[i,'Stopprofit']
#
#     interval_max = kdata['high'][:i].max()
#     interval_min = kdata['low'][:i].min()
#     kdata.loc[i, 'interval'] = (kdata.loc[i, 'close'] - interval_min)/(interval_max - interval_min)
#     #判断盈亏
#     for j in range(i+1, len(kdata)):
#         # 止盈 1
#         if kdata.loc[j, 'close'] >= tp:
#             kdata.loc[i, 'Type'] = 1
#             kdata.loc[i, 'Profit'] = kdata.loc[j,'close'] - tp
#             break
#         # 止损 0
#         elif kdata.loc[j, 'close'] <= ls:
#             kdata.loc[i, 'Type'] = 0
#             kdata.loc[i, 'Profit'] = kdata.loc[j,'close'] - ls
#             break
#
# kdata['interval'].shift(1)
#
# print(kdata.head(),'\n数据长度',len(kdata))
# # print('总的利润点数： ',format(kdata['Profit'].sum(), '.5f'))
