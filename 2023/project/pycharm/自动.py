import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import copy
from catboost import CatBoostClassifier, Pool
from sklearn.metrics import accuracy_score,f1_score,recall_score,precision_score,confusion_matrix,classification_report
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
    # 筛选时去掉30M
    data_handle = data_handle[[coll for coll in data_handle.columns if "_30M" not in coll]]
    print("当前文件数据：  ", data_handle.shape)
    # 数据统计
    print('data_handle.describe()\n', data_handle.describe())
    # 特征和标签
    X = data_handle.iloc[:, :-1]
    Y = data_handle.iloc[:, -1]
    del data_handle  # 删除列表,释放内存

    return X, Y

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

# 测试集数据
print("测试集")
test_data = fileDataET(folder_path, '/test')
X_test, Y_test = traEvaTes(test_data)
# eval_pool
eval_pool = Pool(X_test[:-20000], label=Y_test[:-20000])
# test_pool
test_pool = Pool(X_test[-20000:])

# 指定trainCSV文件的文件夹路径
train_path = folder_path + '/train'
# 获取文件夹中所有文件的文件名列表
file_list = [f for f in os.listdir(train_path) if f.endswith('.csv')]
print("训练集文件list长度: ", len(file_list), "file_list:", file_list)

iteration = 0
data_num = 0
# 定义全局变量

res_X, res_Y = pd.DataFrame(pd.Series()), pd.DataFrame(pd.Series())
train_pool = []
# 逐个读取CSV文件并进行训练
for file in file_list[::-1]:
    iteration += 1
    data_num += 1
    file_path = os.path.join(train_path, file)  # 构建完整的文件路径
    print("\n训练数据", iteration)
    train_data = pd.read_csv(file_path)
    X_train, Y_train = traEvaTes(train_data)
    # 释放内存
    del train_data
    print(file, "   合并文件数   data_num:", data_num)
    # 数据准备
    if data_num == 1:
        res_X = X_train
        res_Y = Y_train
        print("res_X", res_X.shape, "\nres_Y", res_Y.shape)
    else:
        res_X = pd.concat([res_X, X_train])
        res_Y = pd.concat([res_Y, Y_train])
        print("res_X", res_X.shape, "\nres_Y", res_Y.shape)
        if data_num == 4:
            data_num = 0
            del X_train, Y_train
            # 数据准备
            train_pool = Pool(res_X, label=res_Y)

            # 训练数据重新加载
            res_X, res_Y = pd.DataFrame(pd.Series()), pd.DataFrame(pd.Series())

# 文件名称
urlFileName = 0
# 记录最优
dict_excellent = {'auc': 0, 'urlFileName': 0}
list_excellent = []
for i in [0.008, 0.01, 0.012]:
    for j in [19, 20, 21, 22]:
        for k in [0.78, 0.8, 0.82]:
            for p in [0.08, 0.1, 0.12]:
                for q in [0.02, 0.03, 0.05, 0.07]:
                    urlFileName += 1
                    # 参数字典
                    params = {
                        # 'random_seed': 1,
                        # 'task_type' : 'GPU',
                        'iterations': 1000,
                        'learning_rate': i,
                        'depth': 10,
                        # 减轻模型的过拟合程度
                        'l2_leaf_reg': j,
                        # 用于训练每个基本模型（树）的样本数量
                        'subsample': k,
                        # 控制每个基本模型（树）在分裂时考虑的特征数量
                        'colsample_bylevel': p,
                        # 基本模型之间的相似性
                        'bagging_temperature': q,
                        'loss_function': 'Logloss',
                        'od_type': 'Iter',
                        'od_wait': 16,
                        'class_weights': [1.66, 1],
                        'eval_metric': 'AUC',
                        'one_hot_max_size': 22
                    }
                    model = CatBoostClassifier(**params)

                    # 模型训练
                    model.fit(train_pool, eval_set=eval_pool)

                    # 处理完所有CSV文件，模型已经训练完成
                    # 保存模型
                    print("保存模型")
                    url_file = 'result/autoLit/' + str(urlFileName) + '/'
                    # 确保目录存在，如果不存在则创建
                    os.makedirs(url_file, exist_ok=True)

                    # Save model to ONNX-ML format
                    model.save_model(
                        (url_file + "breast_cancer.onnx"),
                        format="onnx",
                        export_parameters={
                            'onnx_domain': 'ai.catboost',
                            'onnx_model_version': 1,
                            'onnx_doc_string': 'test model for BinaryClassification',
                            'onnx_graph_name': 'CatBoostModel_for_BinaryClassification'
                        }
                    )

                    # test
                    print("测试... ...")
                    y_pred = model.predict(test_pool)
                    # 混淆矩阵
                    cmatrix = confusion_matrix(Y_test[-20000:], y_pred)
                    # test
                    roc_auc = roc_auc_score(Y_test[-20000:], y_pred)
                    accuracy = accuracy_score(Y_test[-20000:], y_pred)
                    f1 = f1_score(Y_test[-20000:], y_pred)
                    recall = recall_score(Y_test[-20000:], y_pred)
                    precision = precision_score(Y_test[-20000:], y_pred)
                    # 可视化
                    # plot = sns.heatmap(cmatrix)
                    # plt.show()
                    print("保存测试结果")
                    with open((url_file + 'evaluate_model.txt'), 'w') as f:
                        # 将print的输出重定向到文件
                        print(cmatrix, file=f)
                        print("roc_auc:", roc_auc, "Accuracy:", accuracy, "f1:", f1, "recall:", recall, "precision:",
                              precision, file=f)
                    print(urlFileName,' 当前：\nroc_auc ', roc_auc, '\naccuracy ', accuracy)

                    # 比较是否最优
                    if roc_auc > dict_excellent['auc']:
                        dict_excellent['auc'] = roc_auc
                        dict_excellent['urlFileName'] = urlFileName
                        copy_excellent = copy.deepcopy(dict_excellent)
                        list_excellent.append(copy_excellent)
                        del copy_excellent
                    print('\ndict_excellent\n', dict_excellent)
                    print('\nlist_excellent\n', list_excellent)

                    # 特征权重查看
                    feature_importance = model.get_feature_importance()
                    feature_dic = {}
                    for feature, importance in zip(X_test.columns, feature_importance):
                        feature_dic[feature] = importance
                    sorted_feature_dic = dict(sorted(feature_dic.items(), key=lambda x: x[1], reverse=True))
                    print("保存权重结果")
                    with open((url_file + 'feature_dic.txt'), 'w') as f:
                        # 将print的输出重定向到文件
                        for key, value in sorted_feature_dic.items():
                            print(key, value, file=f)

                    # 保存参数字典
                    print("保存参数字典")
                    with open((url_file + 'params.txt'), 'w') as f:
                        # 将print的输出重定向到文件
                        print(params, file=f)


print('\n****************', list_excellent, '\n****************')
print('\n****************', dict_excellent, '\n****************')
with open(('result/dict_excellent.txt'), 'w') as f:
    print(dict_excellent, file=f)
