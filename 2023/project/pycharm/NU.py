import pandas as pd
import numpy as np
import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"

list_5M = []
list_15M = []
list_30M = []
list_1H = []
list_1D = []
# 打开文件
with open('result/fu_list_mt5.txt', 'r') as file:
    # # 读取整个文件内容
    # content = file.read()
    # print(content)

    # 或者按行读取文件内容
    num = 0
    lines = file.readlines()
    for line in lines:
        num += 1
        line = line.rstrip('\n')
        if '_15M' in line:
            list_15M.append('Data[num++] =' + line.replace("_15M_bin", "") + ';')
            continue
        if '_30M' in line:
            list_30M.append('Data[num++] =' + line.replace("_30M_bin", "") + ';')
            continue
        if '_1H' in line:
            list_1H.append('Data[num++] =' + line.replace("_1H_bin", "") + ';')
            continue
        if '_1D' in line:
            list_1D.append('Data[num++] =' + line.replace("_1D_bin", "") + ';')
            continue
        else:
            list_5M.append('Data[num++] =' + line.replace("_5M_bin", "") + ';')
    print(num)
    print(list_5M)
    print('list_5M', len(list_5M))
    # 将数组写入文本文件
    np.savetxt('result/fu_list_5M.txt', list_5M, fmt='%s')
    print(list_15M)
    print('list_15M', len(list_15M))
    np.savetxt('result/fu_list_15M.txt', list_15M, fmt='%s')
    print(list_30M)
    print('list_30M', len(list_30M))
    np.savetxt('result/fu_list_30M.txt', list_30M, fmt='%s')
    print(list_1H)
    print('list_1H', len(list_1H))
    np.savetxt('result/fu_list_1H.txt', list_1H, fmt='%s')
    print(list_1D)
    print('list_1D', len(list_1D))
    np.savetxt('result/fu_list_1D.txt', list_1D, fmt='%s')