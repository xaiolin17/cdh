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

# pd.set_option('display.max_columns',None)
# pd.set_option('display.max_rows', None)
def get_folder_names(path):
    folder_names = []
    for root, dirs, files in os.walk(path):
        for dir_name in dirs:
            folder_names.append(dir_name)
    return folder_names

folder_path = "result/aG"
folder_names = get_folder_names(folder_path)
print("文件夹名称的列表", folder_names)

list_fu = []
for file in folder_names[::-1]:
    file_path = folder_path + '/' + file + '/feature_dic.txt'  # 构建完整的文件路径
    fu_data = pd.read_csv(file_path)
    # print(fu_data.shape)
    # print(fu_data)
    # 获取第二列的值非零的第一列数据
    fu_data['name-value'] = fu_data.apply(lambda x: x.str.split(' '))
    fu_data['name'] = fu_data['name-value'].apply(lambda x: str(x[0]))
    fu_data['value'] = fu_data['name-value'].apply(lambda x: float(x[1]))

    # 根据条件过滤行
    df_filtered = fu_data[fu_data['value'] != 0]
    result = df_filtered[['name', 'value']]

    # 将列'name'转换为列表
    column_b_list = result['name'].tolist()
    list_fu.extend(column_b_list)
    list_fu = list(set(list_fu))

new_list = [item.split('_')[0] for item in list_fu]
result_list = list(set(new_list))
print(result_list)
with open((folder_path + '/' + 'fu.txt'), 'w') as f:
    print(result_list, file=f)


