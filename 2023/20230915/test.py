import torch
import torch.nn as nn

"""定义神经网络类，继承自nn.Module"""
class MyNetwork(nn.Module):
    def __init__(self):
        super(MyNetwork, self).__init__()
        # 在这里定义神经网络的层和结构

    def forward(self, x):
        # 在这里定义神经网络的前向传播过程
        return x
"""
在初始化方法__init__中定义神经网络的层和结构。
可以使用nn.Module中提供的各种层，例如全连接层（nn.Linear）、卷积层（nn.Conv2d）等。
还可以根据需要使用激活函数（nn.ReLU、nn.Sigmoid等）

线性层（Linear）：也称为全连接层或仿射层，将输入与权重矩阵相乘并加上偏置项
nn.Linear(in_features, out_features)
    in_features：输入特征的数量，也就是输入张量的最后一维大小。
    out_features：输出特征的数量，也就是输出张量的最后一维大小

卷积层（Conv2d）：用于图像处理任务，通过应用卷积核对输入进行卷积运算
nn.Conv2d(in_channels, out_channels, kernel_size, stride=1, padding=0)
    in_channels：输入特征图的通道数，也就是输入张量的第二维大小。    RGB彩色图像的in_channels为3   灰度图像只有一个通道 
    out_channels：输出特征图的通道数，也就是输出张量的第二维大小。
    kernel_size：卷积核的尺寸，可以是一个整数，表示正方形的卷积核，或者是一个元组(kernel_height, kernel_width)，表示矩形的卷积核。
    stride：卷积的步长，默认为1。
    padding：边界填充的大小，默认为0。

池化层（MaxPool2d、AvgPool2d）：用于减小特征图的空间尺寸，提取主要特征
nn.MaxPool2d(kernel_size, stride=None, padding=0)   在输入特征图的每个局部区域内选择最大值来进行下采样
    ernel_size：池化核的尺寸，可以是一个整数，表示正方形的池化核，或者是一个元组(kernel_height, kernel_width)，表示矩形的池化核。
    stride：池化的步长，默认为None，表示与池化核大小相同。
    padding：边界填充的大小，默认为0。
nn.AvgPool2d(kernel_size, stride=None, padding=0)   在输入特征图的每个局部区域内计算平均值来进行下采样

批归一化层（BatchNorm2d）：用于加速收敛和提高模型稳定性，对输入数据进行归一化处理
nn.BatchNorm2d(num_features)    批标准化操作

激活函数层（ReLU、Sigmoid、Tanh）：引入非线性，增加模型的表达能力    激活层对输入特征图的每个元素都应用了ReLU函数
nn.ReLU()       ReLU(x) = max(0, x)     当输入大于0时，输出为输入值本身；当输入小于等于0时，输出为0 
nn.Sigmoid()    Sigmoid(x) = 1 / (1 + exp(-x))
nn.Tanh()       Tanh(x) = (exp(x) - exp(-x)) / (exp(x) + exp(-x))   将输入变换到介于-1和1之间的范围

Dropout层：随机丢弃部分神经元，用于防止过拟合
nn.Dropout(p=0.5)   50%     在每个训练批次中随机地将一部分神经元的输出置为零 

Softmax层：将输出转化为概率分布，常用于多类别分类问题
nn.Softmax(dim=None)    设置不同的dim值，可以在不同的维度上进行Softmax操作
    在多类别分类问题中，Softmax函数经常被用来对输出进行归一化，以便表示各个类别的概率。
    
损失函数（CrossEntropyLoss、MSELoss）：用于评估模型预测结果与真实标签之间的差异
nn.CrossEntropyLoss()  交叉熵损失 用于分类问题 直接传递整数形式的类别标签即可 在计算损失时，该函数会自动将标签转换为one-hot形式并应用Softmax函数
nn.MSELoss()    均方误差  用于回归任务
nn.NLLLoss()   负对数似然损失（Negative Log Likelihood Loss）
nn.KLDivLoss()   KL散度损失（Kullback-Leibler Divergence Loss）  用于度量两个概率分布之间的差异
nn.HingeEmbeddingLoss()  感知损失（Hinge Loss）   用于支持向量机（SVM）中，用于最大化正确分类的间隔 
nn.BCELoss()    二元交叉熵损失（Binary Cross-Entropy Loss）：用于二分类问题
"""
class MyNetwork(nn.Module):
    def __init__(self):
        super(MyNetwork, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(hidden_size, output_size)

"""
在前向传播方法forward中定义神经网络的前向传播过程。
根据定义的层和结构，将输入数据x逐层进行处理
"""
class MyNetwork(nn.Module):
    def __init__(self):
        super(MyNetwork, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu(x)
        x = self.fc2(x)
        return x
"""
创建网络实例，并将其移至所选硬件上（如GPU）
"""
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

model = MyNetwork().to(device)

"""
定义损失函数和优化器
torch.optim.SGD：随机梯度下降法（Stochastic Gradient Descent），通过计算每个样本的梯度来更新参数。
torch.optim.Adam：自适应矩估计优化器（Adaptive Moment Estimation），结合了动量方法和学习率调整策略，适用于大多数深度学习任务。
torch.optim.RMSprop：均方根传播（Root Mean Square Propagation），基于梯度的均方根进行模型参数的更新。
torch.optim.Adagrad：自适应梯度算法（Adaptive Gradient Algorithm），根据参数的历史梯度进行调整，适用于稀疏数据。
"""
criterion = nn.CrossEntropyLoss()  # 分类问题常用的损失函数
optimizer = torch.optim.SGD(model.parameters(), lr=0.1)  # 使用随机梯度下降优化器


"""
进行训练过程，包括前向传播、计算损失、反向传播和参数更新
"""
for epoch in range(num_epochs):
    # 前向传播
    outputs = model(inputs)
    loss = criterion(outputs, labels)

    # 反向传播和优化
    optimizer.zero_grad() #梯度清零
    loss.backward()     #自动求导和反向传播计算梯度
    optimizer.step()    #执行参数更新

    # 打印训练信息
    if (epoch + 1) % log_interval == 0:
        print(f"Epoch [{epoch + 1}/{num_epochs}], Loss: {loss.item():.4f}")