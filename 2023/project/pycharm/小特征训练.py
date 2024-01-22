import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import re
import copy
from catboost import CatBoostClassifier, Pool
from sklearn.metrics import accuracy_score,f1_score,recall_score,precision_score,confusion_matrix,classification_report
import warnings
warnings.filterwarnings('ignore')
from sklearn.metrics import roc_auc_score
import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"

# pd.set_option('display.max_columns',None)
# pd.set_option('display.max_rows', None)
# 打开文件
# 'r' 表示以只读模式打开
file = open('result/aG/fu.txt', 'r')
# 读取文件内容
content_str_fu = file.read()
# 关闭文件
file.close()
# 输出文件内容
result = content_str_fu.split(',')
# 去除每个元素中的特定字符
cleaned_array = [re.sub(r'[, \[\]\'\'\n]', '', item) for item in result]

print(len(cleaned_array), "\ncleaned_array\n", cleaned_array)

def traEvaTes(data_handle):
    keep_list = []
    cleaned_array.append('type')
    column_names = data_handle.columns.to_list()
    for col in column_names:
        for drop_name in cleaned_array:
            if drop_name == col.split('_')[0]:
                keep_list.append(col)
                # print(drop_name, 'in', col)
                break

    # print("keep_list", keep_list)
    # 保留需要的列
    filtered_df = data_handle[keep_list]
    print("只保留条件列：  ", filtered_df.shape)

    # 剔除空数据
    filtered_df = filtered_df.dropna(axis=0)
    # 筛选时去掉30M
    filtered_df = filtered_df[[coll for coll in filtered_df.columns if "_30M" not in coll]]
    print("当前筛选最终文件数据：  ", filtered_df.shape)

    # 数据统计
    print('filtered_df.describe()\n', filtered_df.describe())
    # 特征和标签
    Y = filtered_df['type']
    X = filtered_df.drop(columns=['type'])
    del filtered_df  # 删除列表,释放内存
    print("返回的X：  ", X.shape)
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
            # 创建特征数组
            arr = np.array(res_X.columns)
            # 将数组写入文本文件
            np.savetxt('result/fu_list_mt5.txt', arr, fmt='%s')

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
for i in [0.01, 0.02, 0.03]:
    for j in [10, 15, 18, 20, 22]:
        for k in [0.5, 0.66, 0.78, 0.8, 0.82]:
            for p in [0.08, 0.1, 0.12, 0.2, 0.5]:
                for q in [0.02, 0.03, 0.05, 0.07, 0.2, 0.3]:
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
                        (url_file + "smallModel.onnx"),
                        format="onnx",
                        export_parameters={
                            'onnx_domain': 'ai.catboost',
                            'onnx_model_version': 1,
                            'onnx_doc_string': 'ai.catboost 1 smallModel',
                            'onnx_graph_name': 'CatBoostModel_for_Filter'
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
    print(list_excellent, file=f)
