"""
@pcl
数据集太大 注意内存问题

drop_list
该列表是需要剔除的数据列表

col
该列表是类型数据需要进行类型转换
该列数据是数值类型在某些模型上是不需要进行转换的
在catboost模型中该列表的列数据被转换为了str类型

replace_dict
该字典是col列表中列的数值对应的str字典进行类型转换

traEvaTes()
该方法进行数据预处理
如：
数据剔除 空数据删除 类型转换 标准化

fileDataET()
该方法进行数据的获取
文件夹数据获取方式

"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
from catboost import CatBoostClassifier, Pool, cv
from sklearn.metrics import accuracy_score,f1_score,recall_score,precision_score,confusion_matrix,classification_report
from sklearn.preprocessing import StandardScaler
import warnings
warnings.filterwarnings('ignore')
from sklearn.metrics import roc_auc_score
import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"

# 需要删除的列表
drop_list = ['Unnamed: 0', '时间', 'volume', '订单规定价格','当前价格', '订单ID', 'profit', '类型',
                      'fractals_up_arrow_1D_bin', 'fractals_up_arrow', 'fractals_up_arrow_15M_bin',
                      'fractals_up_arrow_30M_bin', 'fractals_up_arrow_1H_bin',
                      'fractals_down_arrow_1D_bin', 'fractals_down_arrow', 'fractals_down_arrow_15M_bin',
                      'fractals_down_arrow_30M_bin', 'fractals_down_arrow_1H_bin', 'open_price', 'high', 'low', 'close',
                      'sma5', 'sma10', 'ema5', 'ema10', 'smma5', 'smma10', 'lwma5', 'lwma10',
                      'boll_upper_band', 'boll_middle_band', 'boll_lower_band', 'jaws', 'teeth', 'lips',
                      'ama', 'dema', 'envelopes_upper_value', 'envelopes_lower_value', 'frAMA', 'gator_ups',
                      'gator_downs',
                      'tenkan_sen', 'kijun_sen', 'senkou_span_A', 'senkou_span_B', 'chinkou_span', 'osMA', 'tema',
                      'vidya',

                      'sma5_1D_bin', 'sma10_1D_bin', 'ema5_1D_bin', 'ema10_1D_bin', 'smma5_1D_bin', 'smma10_1D_bin',
                      'lwma5_1D_bin', 'lwma10_1D_bin',
                      'boll_upper_band_1D_bin', 'boll_middle_band_1D_bin', 'boll_lower_band_1D_bin',
                      'jaws_1D_bin', 'teeth_1D_bin', 'lips_1D_bin', 'ama_1D_bin', 'dema_1D_bin',
                      'envelopes_upper_value_1D_bin', 'envelopes_lower_value_1D_bin', 'frAMA_1D_bin',
                      'gator_ups_1D_bin', 'gator_downs_1D_bin', 'tenkan_sen_1D_bin', 'kijun_sen_1D_bin',
                      'senkou_span_A_1D_bin', 'senkou_span_B_1D_bin', 'chinkou_span_1D_bin',
                      'osMA_1D_bin', 'tema_1D_bin', 'vidya_1D_bin',

                      'sma5_1H_bin', 'sma10_1H_bin', 'ema5_1H_bin', 'ema10_1H_bin', 'smma5_1H_bin', 'smma10_1H_bin',
                      'lwma5_1H_bin', 'lwma10_1H_bin',
                      'boll_upper_band_1H_bin', 'boll_middle_band_1H_bin', 'boll_lower_band_1H_bin',
                      'jaws_1H_bin', 'teeth_1H_bin', 'lips_1H_bin', 'ama_1H_bin', 'dema_1H_bin',
                      'envelopes_upper_value_1H_bin', 'envelopes_lower_value_1H_bin', 'frAMA_1H_bin',
                      'gator_ups_1H_bin', 'gator_downs_1H_bin', 'tenkan_sen_1H_bin', 'kijun_sen_1H_bin',
                      'senkou_span_A_1H_bin', 'senkou_span_B_1H_bin', 'chinkou_span_1H_bin',
                      'osMA_1H_bin', 'tema_1H_bin', 'vidya_1H_bin',

                      'sma5_30M_bin', 'sma10_30M_bin', 'ema5_30M_bin', 'ema10_30M_bin', 'smma5_30M_bin',
                      'smma10_30M_bin',
                      'lwma5_30M_bin', 'lwma10_30M_bin',
                      'boll_upper_band_30M_bin', 'boll_middle_band_30M_bin', 'boll_lower_band_30M_bin', 'jaws_30M_bin',
                      'teeth_30M_bin', 'lips_30M_bin',
                      'ama_30M_bin', 'dema_30M_bin', 'envelopes_upper_value_30M_bin', 'envelopes_lower_value_30M_bin',
                      'frAMA_30M_bin',
                      'gator_ups_30M_bin', 'gator_downs_30M_bin',
                      'tenkan_sen_30M_bin', 'kijun_sen_30M_bin', 'senkou_span_A_30M_bin', 'senkou_span_B_30M_bin',
                      'chinkou_span_30M_bin',
                      'osMA_30M_bin', 'tema_30M_bin', 'vidya_30M_bin',

                      'sma5_15M_bin', 'sma10_15M_bin', 'ema5_15M_bin', 'ema10_15M_bin', 'smma5_15M_bin',
                      'smma10_15M_bin',
                      'lwma5_15M_bin', 'lwma10_15M_bin',
                      'boll_upper_band_15M_bin', 'boll_middle_band_15M_bin', 'boll_lower_band_15M_bin', 'jaws_15M_bin',
                      'teeth_15M_bin', 'lips_15M_bin',
                      'ama_15M_bin', 'dema_15M_bin', 'envelopes_upper_value_15M_bin', 'envelopes_lower_value_15M_bin',
                      'frAMA_15M_bin',
                      'gator_ups_15M_bin', 'gator_downs_15M_bin',
                      'tenkan_sen_15M_bin', 'kijun_sen_15M_bin', 'senkou_span_A_15M_bin', 'senkou_span_B_15M_bin',
                      'chinkou_span_15M_bin',
                      'osMA_15M_bin', 'tema_15M_bin', 'vidya_15M_bin'
                      ]
# 注意 需要保持数据类型一致int
col = ['atr_5_10_type', 'macd_type', 'sma_5_10_type', 'ema_5_10_type', 'smma_5_10_type', 'lwma_5_10_type',
       'rsi_5_14_type', 'sar_type', 'adx_type', 'cci_type', 'stoch_type', 'boll_type', 'ac_type', 'ad_type',
       'adxWilder_type',
       'alligator_type', 'ama_type', 'ao_type', 'bearsPower_type', 'bullsPower_type', 'chaikin_type', 'dema_type',
       'deMarker_type', 'envelopes_type', 'force_type', 'fractals_type', 'frAMA_type', 'gator_type',
       'ichimoku_type',
       'bwmfi_type', 'momentum_type', 'mfi_type', 'osMA_type', 'obv_type', 'rvi_type', 'stdDev_type', 'tema_type',
       'triX_type', 'wpr_type', 'vidya_type',
       'ac_color', 'ao_color', 'gator_up_color', 'gator_downs_color', 'bwmfi_color',

       'atr_5_10_type_15M_bin', 'macd_type_15M_bin', 'sma_5_10_type_15M_bin', 'ema_5_10_type_15M_bin',
       'smma_5_10_type_15M_bin', 'lwma_5_10_type_15M_bin',
       'rsi_5_14_type_15M_bin', 'sar_type_15M_bin', 'adx_type_15M_bin', 'cci_type_15M_bin', 'stoch_type_15M_bin',
       'boll_type_15M_bin', 'ac_type_15M_bin', 'ad_type_15M_bin',
       'adxWilder_type_15M_bin',
       'alligator_type_15M_bin', 'ama_type_15M_bin', 'ao_type_15M_bin', 'bearsPower_type_15M_bin',
       'bullsPower_type_15M_bin',
       'chaikin_type_15M_bin', 'dema_type_15M_bin',
       'deMarker_type_15M_bin', 'envelopes_type_15M_bin', 'force_type_15M_bin', 'fractals_type_15M_bin',
       'frAMA_type_15M_bin',
       'gator_type_15M_bin',
       'ichimoku_type_15M_bin',
       'bwmfi_type_15M_bin', 'momentum_type_15M_bin', 'mfi_type_15M_bin', 'osMA_type_15M_bin', 'obv_type_15M_bin',
       'rvi_type_15M_bin', 'stdDev_type_15M_bin', 'tema_type_15M_bin',
       'triX_type_15M_bin', 'wpr_type_15M_bin', 'vidya_type_15M_bin',
       'ac_color_15M_bin', 'ao_color_15M_bin', 'gator_up_color_15M_bin', 'gator_downs_color_15M_bin',
       'bwmfi_color_15M_bin',

       'atr_5_10_type_30M_bin', 'macd_type_30M_bin', 'sma_5_10_type_30M_bin', 'ema_5_10_type_30M_bin',
       'smma_5_10_type_30M_bin', 'lwma_5_10_type_30M_bin',
       'rsi_5_14_type_30M_bin', 'sar_type_30M_bin', 'adx_type_30M_bin', 'cci_type_30M_bin', 'stoch_type_30M_bin',
       'boll_type_30M_bin', 'ac_type_30M_bin', 'ad_type_30M_bin',
       'adxWilder_type_30M_bin',
       'alligator_type_30M_bin', 'ama_type_30M_bin', 'ao_type_30M_bin', 'bearsPower_type_30M_bin',
       'bullsPower_type_30M_bin',
       'chaikin_type_30M_bin', 'dema_type_30M_bin',
       'deMarker_type_30M_bin', 'envelopes_type_30M_bin', 'force_type_30M_bin', 'fractals_type_30M_bin',
       'frAMA_type_30M_bin',
       'gator_type_30M_bin',
       'ichimoku_type_30M_bin',
       'bwmfi_type_30M_bin', 'momentum_type_30M_bin', 'mfi_type_30M_bin', 'osMA_type_30M_bin', 'obv_type_30M_bin',
       'rvi_type_30M_bin', 'stdDev_type_30M_bin', 'tema_type_30M_bin',
       'triX_type_30M_bin', 'wpr_type_30M_bin', 'vidya_type_30M_bin',
       'ac_color_30M_bin', 'ao_color_30M_bin', 'gator_up_color_30M_bin', 'gator_downs_color_30M_bin',
       'bwmfi_color_30M_bin',

       'atr_5_10_type_1H_bin', 'macd_type_1H_bin', 'sma_5_10_type_1H_bin', 'ema_5_10_type_1H_bin',
       'smma_5_10_type_1H_bin', 'lwma_5_10_type_1H_bin',
       'rsi_5_14_type_1H_bin', 'sar_type_1H_bin', 'adx_type_1H_bin', 'cci_type_1H_bin', 'stoch_type_1H_bin',
       'boll_type_1H_bin', 'ac_type_1H_bin', 'ad_type_1H_bin',
       'adxWilder_type_1H_bin',
       'alligator_type_1H_bin', 'ama_type_1H_bin', 'ao_type_1H_bin', 'bearsPower_type_1H_bin',
       'bullsPower_type_1H_bin',
       'chaikin_type_1H_bin', 'dema_type_1H_bin',
       'deMarker_type_1H_bin', 'envelopes_type_1H_bin', 'force_type_1H_bin', 'fractals_type_1H_bin',
       'frAMA_type_1H_bin',
       'gator_type_1H_bin',
       'ichimoku_type_1H_bin',
       'bwmfi_type_1H_bin', 'momentum_type_1H_bin', 'mfi_type_1H_bin', 'osMA_type_1H_bin', 'obv_type_1H_bin',
       'rvi_type_1H_bin', 'stdDev_type_1H_bin', 'tema_type_1H_bin',
       'triX_type_1H_bin', 'wpr_type_1H_bin', 'vidya_type_1H_bin',
       'ac_color_1H_bin', 'ao_color_1H_bin', 'gator_up_color_1H_bin', 'gator_downs_color_1H_bin',
       'bwmfi_color_1H_bin',

       'atr_5_10_type_1D_bin', 'macd_type_1D_bin', 'sma_5_10_type_1D_bin', 'ema_5_10_type_1D_bin',
       'smma_5_10_type_1D_bin', 'lwma_5_10_type_1D_bin',
       'rsi_5_14_type_1D_bin', 'sar_type_1D_bin', 'adx_type_1D_bin', 'cci_type_1D_bin', 'stoch_type_1D_bin',
       'boll_type_1D_bin', 'ac_type_1D_bin', 'ad_type_1D_bin',
       'adxWilder_type_1D_bin',
       'alligator_type_1D_bin', 'ama_type_1D_bin', 'ao_type_1D_bin', 'bearsPower_type_1D_bin',
       'bullsPower_type_1D_bin',
       'chaikin_type_1D_bin', 'dema_type_1D_bin',
       'deMarker_type_1D_bin', 'envelopes_type_1D_bin', 'force_type_1D_bin', 'fractals_type_1D_bin',
       'frAMA_type_1D_bin',
       'gator_type_1D_bin',
       'ichimoku_type_1D_bin',
       'bwmfi_type_1D_bin', 'momentum_type_1D_bin', 'mfi_type_1D_bin', 'osMA_type_1D_bin', 'obv_type_1D_bin',
       'rvi_type_1D_bin', 'stdDev_type_1D_bin', 'tema_type_1D_bin',
       'triX_type_1D_bin', 'wpr_type_1D_bin', 'vidya_type_1D_bin',
       'ac_color_1D_bin', 'ao_color_1D_bin', 'gator_up_color_1D_bin', 'gator_downs_color_1D_bin',
       'bwmfi_color_1D_bin']
# 类型字典
replace_dict = {'0': 'z', '1': 'A', '2': 'B', '3': 'C', '4': 'D',
                '5': 'E', '6': 'F', '7': 'G', '8': 'H', '9': 'I',
                '10': 'J', '11': 'K', '12': 'L', '13': 'M', '14': 'N'}

def traEvaTes(data_handle):
    # 剔除无效数据
    data_handle = data_handle.drop(drop_list, axis=1, inplace=False)
    # 剔除空数据
    data_handle = data_handle.dropna(axis=0)
    print("当前文件数据：  ", data_handle.shape)
    # 数据统计
    # data_handle.describe()
    # 类型转换
    data_handle[col] = (data_handle[col].astype(str))
    data_handle[col] = data_handle[col].replace(replace_dict)
    # 特征和标签
    X = data_handle.iloc[:, :-1]
    Y = data_handle.iloc[:, -1]
    # #标准化StandardScaler()
    scaler = StandardScaler()
    # 对指定列进行标准化
    X_scaled = scaler.fit_transform((X[X.columns.difference(col)].astype(float)))
    # 将标准化后的数据转换为 DataFrame
    X_scaled_df = pd.DataFrame(X_scaled, columns=X.columns.difference(col))
    # 合并标准化后的数据和其他列
    X_merged = pd.concat([X_scaled_df, X[col]], axis=1)
    del data_handle  # 删除列表,释放内存
    del X_scaled
    del X_scaled_df
    del X

    return X_merged, Y

"""
验证集与测试集数据
"""
def fileDataET(folder_path,str_name):
    # 数据路径'data/train'
    data_path = folder_path + str_name
    # 获取文件夹中的所有文件
    data_path_files = os.listdir(data_path)
    # 获取文件名
    data_file_name = data_path_files[0]
    # 构建完整的文件路径
    data_file_path = os.path.join(data_path, data_file_name)
    # eval_data
    data_return = pd.read_csv(data_file_path)
    return data_return

# 文件数据路径
folder_path = 'data2010-2023'
# folder_path = '测试数据分块testModel'

# 默认的参数字典
params = {
    'iterations': 200,
    'loss_function': 'Logloss',
    # 异常值检测类型
    'od_type': 'Iter',
    'od_wait': 10,
    'eval_metric': 'AUC',
    #     'early_stopping_rounds': 10,
    'one_hot_max_size': 20,
    # 基本模型之间的相似性
    'bagging_temperature': 0.3,
    # 用于训练每个基本模型（树）的样本数量
    'subsample': 0.3,
    'class_weights': [1.66, 1],
}
model = CatBoostClassifier(**params)

# 定义参数网格
params_grid = {
    'learning_rate': [0.01, 0.03],
    'depth': [8, 10],
    # 减轻模型的过拟合程度
    'l2_leaf_reg': [5, 10],
    # 控制每个基本模型（树）在分裂时考虑的特征数量
    'colsample_bylevel': [0.3, 0.5],
    #     'early_stopping_rounds': 30,

}

# 指定trainCSV文件的文件夹路径
# train_path = folder_path + '/train'
train_path = folder_path + '/T_tr'
# 获取文件夹中所有文件的文件名列表
file_list = [f for f in os.listdir(train_path) if f.endswith('.csv')]
print("训练集文件list:   ", file_list, "文件数量", len(file_list))
# 标记
iteration = 0
# 定义全局变量
res_X, res_Y = pd.DataFrame(pd.Series()), pd.DataFrame(pd.Series())
# 逐个读取CSV文件并进行训练
for file in file_list:
    # 标记
    iteration += 1
    # 构建完整的文件路径
    file_path = os.path.join(train_path, file)

    print("\n-------------------------------------\n训练数据", iteration)
    # 按照路径获取数据
    train_data = pd.read_csv(file_path)
    # 数据预处理
    X_train, Y_train =traEvaTes(train_data)
    # 释放内存
    del train_data
    # 数据准备
    if iteration == 1:
        res_X = X_train
        res_Y = Y_train
    else:
        res_X = pd.concat([res_X, X_train])
        res_Y = pd.concat([res_Y, Y_train])
    del X_train, Y_train

    print("res_X", res_X.shape, "\nres_Y", res_Y.shape)

# print("res_X:\n",res_X.describe())
print('\n模型... ...')
# 池化数据
train_pool = Pool(res_X, label=res_Y, cat_features=col)
print('\n池化... ...')
# 释放内存
del res_X, res_Y
print('\ndel res_X, res_Y... ...')
# 执行网格搜索
print('\n网格... ...')
grid_search_result = model.grid_search(params_grid, train_pool)

# 输出最佳参数组合和对应的指标结果
print("grid_search_result: ")
print(grid_search_result)
