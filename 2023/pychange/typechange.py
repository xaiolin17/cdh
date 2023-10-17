"""
MT5平台保存的K线和指标数据---->二进制文件路径
MT5平台获取的交易策略历史明细---->csv文件路径（主要是盈亏情况）
最终得到的数据  ---->最终存放csv文件路径 KDATA_type.csv
**********
bin_to_data(二进制文件路径)  -->  merge_csv(bin_to_data返回的数据，最终存放csv文件路径)
**********
"""
import numpy as np
import pandas as pd
import datetime
from KDataChange import bin_to_data
from cycleDataChange import bin_to_cycleData

# pd.set_option('display.max_columns', None)
# pd.set_option('display.max_rows', None)
"""
1.读取历史交易数据
2.数据格式处理
3.以时间关联
4.保存到文件
"""
def history_data(history_file):

    history_data = pd.read_csv(history_file, header=0, encoding='utf-16', sep='\t')
    # "时间", "交易品种", "类型", "订单规定价格", "订单交易量", "斩仓值", "盈利值", "订单ID", "执行或取消时间"
    history_data = history_data[['时间', '类型', '订单规定价格', '订单ID']]
    # 遍历所有buy交易判断是否盈利
    for i in range(len(history_data)):
        # 判断是否为买入操作
        if history_data.loc[i, '类型'] == 'buy':
            id = history_data.loc[i, '订单ID']
            # 寻找该订单后续操作
            for j in range(i + 1, len(history_data)):
                if history_data.loc[j, '订单ID'] == id:
                    # 买--->卖平仓
                    if history_data.loc[j, '类型'] == 'sell':
                        history_data.loc[i, 'profit'] = round(history_data.loc[j, '订单规定价格'] - history_data.loc[i, '订单规定价格'],2)
                        break;
                    # 买入单无法再买
        # 平仓操作忽略
        else:
            history_data.loc[i, 'profit'] = np.NAN

    res = history_data.dropna(axis=0)

    # 转换时间格式 Y.m.d 8:00:00--> Y-m-d
    type_res = res.copy()
    type_res['时间'] = type_res['时间'].str.replace(".", "-").apply(lambda x: datetime.datetime.strptime(x, "%Y-%m-%d %H:%M:%S"))
    # print(k_data['时间'][:3])
    # print(type_res['时间'][:3])

    return type_res

def merge_csv(k_data, type_his, data_15M, data_30M, data_1H, data_1D, csv_file_change):
    # 转换时间格式
    k_data['时间'] = k_data['时间'].apply(lambda x: datetime.datetime.strptime(x, "%Y-%m-%d %H:%M:%S"))
    k_data = pd.concat([k_data, data_15M, data_30M, data_1H, data_1D], axis=1)
    # 以指标数据为主进行左连接
    merged_df = pd.merge(k_data, type_his, on='时间', how='left')

    # 去掉第一行 缺失数据
    result_type = merged_df.copy()[1:]
    result_type['type'] = result_type['profit'].apply(lambda x: 1 if x > 0 else 0)
    print('merge_csv\n', result_type[:3])

    result_type.dropna(axis=0).to_csv(csv_file_change)

    return print('\n!OVER!')

# 二进制文件路径
bin_file_k = 'C:/Program Files/MetaTrader 5/Tester/Agent-127.0.0.1-3000/MQL5/Files/Kdata_bin'
bin_file_15M = 'C:/Program Files/MetaTrader 5/Tester/Agent-127.0.0.1-3000/MQL5/Files/15M_bin'
bin_file_30M = 'C:/Program Files/MetaTrader 5/Tester/Agent-127.0.0.1-3000/MQL5/Files/30M_bin'
bin_file_1H = 'C:/Program Files/MetaTrader 5/Tester/Agent-127.0.0.1-3000/MQL5/Files/1H_bin'
bin_file_1D = 'C:/Program Files/MetaTrader 5/Tester/Agent-127.0.0.1-3000/MQL5/Files/1D_bin'
# 历史交易csv
history_file = 'C:/Program Files/MetaTrader 5/Tester/Agent-127.0.0.1-3000/MQL5/Files/HistoryDealsDataTable.csv'
# 保存file  CSV文件路径
csv_file_change = 'KDATA_type_5.csv'
# 获得K线data
k_data = bin_to_data(bin_file_k)
# 获得其他周期数据
data_15M = bin_to_cycleData(bin_file_15M)
data_30M = bin_to_cycleData(bin_file_30M)
data_1H = bin_to_cycleData(bin_file_1H)
data_1D = bin_to_cycleData(bin_file_1D)

# KDATA关联历史交易数据 并写入csv
type_his = history_data(history_file)

merge_csv(k_data, type_his, data_15M, data_30M, data_1H, data_1D, csv_file_change)




