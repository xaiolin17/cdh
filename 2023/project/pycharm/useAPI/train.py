import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import copy
from catboost import CatBoostClassifier, Pool
from sklearn.metrics import accuracy_score, f1_score, recall_score, precision_score, confusion_matrix, classification_report
import warnings
warnings.filterwarnings('ignore')
from sklearn.metrics import roc_auc_score
import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"
from getXAUUSD import getDataXAUUSD


# 定义全局变量
count = 246810
iteration = 0
data_num = 0
file_path = 'HistoryDealsDataTable_ATR5X02_1_1_sell.csv'
"""
获取数据
"""
dataXAUUSD = getDataXAUUSD(count)
"""
获取交割单
"""
historyDataBuy = pd.read_csv(file_path)
data_y = historyDataBuy[['时间', 'profit']]
data_y['type'] = data_y['profit'].apply(lambda x: 1 if x > 0 else 0)
print('\ndata_y', data_y[:3])
# 交割单计算盈亏type
useDATA = pd.merge(dataXAUUSD, data_y[['时间', 'type']], left_on="time", right_on='时间', how="left")
useDATA = useDATA.drop('时间', axis=1)
# 剔除因为计算而造成的NULL
useDATA = useDATA.dropna(axis=0)
# 重置索引
useDATA = useDATA.reset_index(drop=True)
print('\nuseDATA', useDATA[:3], '\nuseDATA.shape ', useDATA.shape)
# K线数据和交割单连接
useDATA_Y = useDATA['type']
useDATA_X = useDATA.drop(['time','type'], axis=1)
# 数据集划分
X_train, Y_train, X_test, Y_test = useDATA_X[:-40000], useDATA_Y[:-40000], useDATA_X[-40000:], useDATA_Y[-40000:]
# data_pool = Pool(data=X, label=y, cat_features=cat_features)
print("\nY_train.describe()", Y_train.describe())
print("\nY_test.describe()", Y_test.describe())
# train_pool
train_pool = Pool(X_train, label=Y_train)
# eval_pool
eval_pool = Pool(X_test[:-20000], label=Y_test[:-20000])
# test_pool
test_pool = Pool(X_test[-20000:])

del historyDataBuy, dataXAUUSD, data_y, useDATA, useDATA_Y, useDATA_X, X_train, Y_train

# 文件名称
urlFileName = 0
# 记录最优
dict_excellent = {'auc': 0, 'urlFileName': 0}
list_excellent = []
# for i in [0.005, 0.01, 0.02]:
#     for j in [2, 5, 10, 15, 20]:
#         for k in [0.2, 0.3, 0.5, 0.7, 0.8, 0.9]:
#             for p in [0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.8]:
#                 for q in [0.02, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.8]:
for i in [0.005, 0.01, 0.02]:
    for j in [2, 5, 10, 20]:
        for k in [0.2, 0.5]:
            for p in [0.2, 0.3, 0.5]:
                for q in [0.2, 0.3, 0.5]:
                    # 1:(1-mean)*(1/mean)   0.483065 1.934479189840115
                    for z in [[1, 0.93], [1, 1], [1, 1.05], [1, 1.11]]:
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
                            'od_wait': 12,
                            'class_weights': z,
                            'eval_metric': 'AUC',
                            'one_hot_max_size': 5
                        }
                        model = CatBoostClassifier(**params)

                        # 模型训练
                        model.fit(train_pool, eval_set=eval_pool)

                        # 处理完所有CSV文件，模型已经训练完成
                        # 保存模型
                        print("保存模型")
                        url_file = 'result/auto/' + str(urlFileName) + '/'
                        # 确保目录存在，如果不存在则创建
                        os.makedirs(url_file, exist_ok=True)

                        # Save model
                        model.save_model(url_file + 'catboost_model.bin')

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
