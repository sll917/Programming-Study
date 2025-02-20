#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-18 22:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 05Panel三维数据结构.py
#######################################################
#Pandas Panel三维数据结构
#Panel 结构也称“面板结构”，它源自于 Panel Data 一词，翻译为“面板数据”。如果您使用的是 Pandas 0.25 以前的版本，那么您需要掌握本节内容，否则，作为了解内容即可。
#自 Pandas 0.25 版本后， Panel 结构已经被废弃。
#Panel 是一个用来承载数据的三维数据结构，它有三个轴，分别是 items（0 轴），major_axis（1 轴），而 minor_axis（2 轴）。这三个轴为描述、操作 Panel 提供了支持，其作用介绍如下：
#    items：axis =0，Panel 中的每个 items 都对应一个 DataFrame。
#    major_axis：axis=1，用来描述每个 DataFrame 的行索引。
#    minor_axis：axis=2，用来描述每个 DataFrame 的列索引。
#pandas.Panel()
#您可以使用下列构造函数创建一个 Panel，如下所示：
#pandas.Panel(data, items, major_axis, minor_axis, dtype, copy)
#参数说明如下：
#参数名称	描述说明
#data	输入数据，可以是 ndarray，Series，列表，字典，或者 DataFrame。
#items	axis=0
#major_axis	axis=1
#minor_axis	axis=2
#dtype	每一列的数据类型。
#copy	默认为 False，表示是否复制数据。
#创建Panel 对象
#下面介绍创建 Panel 对象的两种方式：一种是使用 nadarry 数组创建，另一种使用 DataFrame 对象创建。首先，我们学习如何创建一个空的 Panel 对象。
#1) 创建一个空Panel
#使用 Panel 的构造函数创建，如下所示：
#import pandas as pd
#p = pd.Panel()
#print(p)
#    1
#    2
#    3
#输出结果：
#<class 'pandas.core.panel.Panel'>
#Dimensions: 0 (items) x 0 (major_axis) x 0 (minor_axis)
#Items axis: None
#Major_axis axis: None
#Minor_axis axis: None
#    1
#    2
#    3
#    4
#    5
#2) ndarray三维数组创建
#import pandas as pd
#import numpy as np
##返回均匀分布的随机样本值位于[0,1）之间
#data = np.random.rand(2,4,5)
#p = pd.Panel(data)
#print (p)
#    1
#    2
#    3
#    4
#    5
#    6
#输出结果：
#<class 'pandas.core.panel.Panel'>
#Dimensions: 2 (items) x 4 (major_axis) x 5 (minor_axis)
#Items axis: 0 to 1
#Major_axis axis: 0 to 3
#Minor_axis axis: 0 to 4
#    1
#    2
#    3
#    4
#    5
#请注意与上述示例的空 Panel 进行对比。
#3) DataFrame创建
#下面使用 DataFrame 创建一个 Panel，示例如下：
#import pandas as pd
#import numpy as np
#data = {'Item1' : pd.DataFrame(np.random.randn(4, 3)),
#   'Item2' : pd.DataFrame(np.random.randn(4, 2))}
#p = pd.Panel(data)
#print(p)
#    1
#    2
#    3
#    4
#    5
#    6
#输出结果：
#Dimensions: 2 (items) x 4 (major_axis) x 3 (minor_axis)
#Items axis: Item1 to Item2
#Major_axis axis: 0 to 3
#Minor_axis axis: 0 to 2
#    1
#    2
#    3
#    4
#Panel中选取数据
#如果想要从 Panel 对象中选取数据，可以使用 Panel 的三个轴来实现，也就是items，major_axis，minor_axis。下面介绍其中一种，大家体验一下即可。
#1) 使用 items选取数据
#示例如下：
#import pandas as pd
#import numpy as np
#data = {'Item1':pd.DataFrame(np.random.randn(4, 3)),
#   'Item2':pd.DataFrame(np.random.randn(4, 2))}
#p = pd.Panel(data)
#print(p['Item1'])
#    1
#    2
#    3
#    4
#    5
#    6
#输出结果：
#            0          1          2
#0    0.488224  -0.128637   0.930817
#1    0.417497   0.896681   0.576657
#2   -2.775266   0.571668   0.290082
#3   -0.400538  -0.144234   1.110535
#    1
#    2
#    3
#    4
#    5
#上述示例中 data，包含了两个数据项，我们选择了 item1，输出结果是 4 行 3 列的 DataFrame，其行、列索引分别对应 major_axis 和 minor_axis。
