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
def historyDataBuy(history_file):

    history_data = pd.read_csv(history_file, header=0, encoding='utf-16', sep='\t')
    print(history_data[:10], '\n', history_data.shape)
    # "时间", "交易品种", "类型", "订单规定价格", "订单交易量", "斩仓值", "盈利值", "订单ID", "执行或取消时间"
    history_data = history_data[['时间', '类型', '订单规定价格', '订单ID', '当前价格']]
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
                        history_data.loc[i, 'profit'] = round(history_data.loc[j, '当前价格'] - history_data.loc[i, '当前价格'], 2)
                        break;
                    # 买入单无法再买
        # 平仓操作忽略
        else:
            history_data.loc[i, 'profit'] = np.NAN

    res = history_data.dropna(axis=0)

    # 转换时间格式 Y.m.d 8:00:00--> Y-m-d
    type_res = res.copy()
    type_res['时间'] = type_res['时间'].str.replace(".", "-").apply(lambda x: datetime.datetime.strptime(x, "%Y-%m-%d %H:%M:%S"))
    print(type_res[:10])

    return type_res

# 二进制文件路径
file_in = 'F:/mt5D/MT5/Tester/Agent-127.0.0.1-3000/MQL5/Files'

# 历史交易csv
history_file = file_in + '/HistoryDealsDataTable_ATR5X02.csv'
# 保存file  CSV文件路径
csv_file_change = 'HistoryDealsDataTable_ATR5X02.csv'

# KDATA关联历史交易数据 并写入csv
type_his = historyDataBuy(history_file)

type_his.dropna(axis=0).to_csv(csv_file_change)