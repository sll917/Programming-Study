#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-19 21:19
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 02Series的属性和方法.py
#######################################################
'''一,  Series常用属性 '''
'''
下面我们介绍 Series 的常用属性和方法。在下表列出了 Series 对象的常用属性。
名称	属性
axes	以列表的形式返回所有行索引标签。
dtype	返回对象的数据类型。
empty	返回一个空的 Series 对象。
ndim	返回输入数据的维数。
size	返回输入数据的元素数量。
values	以 ndarray 的形式返回 Series 对象。
index	返回一个RangeIndex对象，用来描述索引的取值范围。
'''

#现在创建一个 Series 对象，并演示如何使用上述表格中的属性。如下所示：
print('(1-0)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(5))
print(s)
#输出结果：
#0    0.898097
#1    0.730210
#2    2.307401
#3   -1.723065
#4    0.346728
#dtype: float64

#上述示例的行索引标签是 [0,1,2,3,4]。
''' 1) axes ---> 以列表的形式返回所有行索引标签。 '''
print('(1-1)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(5))
print ("The axes are:")
print(s.axes)
#输出结果
#The axes are:
#[RangeIndex(start=0, stop=5, step=1)]

''' 2) dtype ---> 返回对象的数据类型。'''
print('(1-2)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(5))
print ("The dtype is:")
print(s.dtype)
#输出结果：
#The dtype is:
#float64

''' 3) empty --->返回一个空的 Series 对象。'''
#返回一个布尔值，用于判断数据对象是否为空。示例如下：
print('(1-3)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(5))
print("是否为空对象?")
print (s.empty)
#输出结果：
#是否为空对象?
#False

''' 4) ndim ---> 返回输入数据的维数。 '''
#查看序列的维数。根据定义，Series 是一维数据结构，因此它始终返回 1。
print('(1-4)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(5))
print (s)
print (s.ndim)
#输出结果：
#0    0.311485
#1    1.748860
#2   -0.022721
#3   -0.129223
#4   -0.489824
#dtype: float64

''' 5) size ---> 返回 Series 对象的大小(长度)。 '''
#返回 Series 对象的大小(长度)。
print('(1-5)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(3))
print (s)
#series的长度大小
print(s.size)
#输出结果：
#0   -1.866261
#1   -0.636726
#2    0.586037
#dtype: float64
#3

''' 6) values ---> 以 ndarray 的形式返回 Series 对象。 '''
#以数组的形式返回 Series 对象中的数据。
print('(1-6)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(6))
print(s)
print("输出series中数据")
print(s.values)
#输出结果：
#0   -0.502100
#1    0.696194
#2   -0.982063
#3    0.416430
#4   -1.384514
#5    0.444303
#dtype: float64
#输出series中数据
#[-0.50210028  0.69619407 -0.98206327  0.41642976 -1.38451433  0.44430257]

''' 7) index ---> 该属性用来查看 Series 中索引的取值范围 '''
#该属性用来查看 Series 中索引的取值范围。示例如下：
#显示索引
print('(1-7)*** ***')
import pandas as pd
s=pd.Series([1,2,5,8],index=['a','b','c','d'])
print(s.index)
#隐式索引
s1=pd.Series([1,2,5,8])
print(s1.index)
#输出结果：
#隐式索引：
#Index(['a', 'b', 'c', 'd'], dtype='object')
#显示索引：
#RangeIndex(start=0, stop=4, step=1)

''' 2, Series常用方法 '''
''' 1) head()&tail()查看数据 '''
#如果想要查看 Series 的某一部分数据，可以使用 head() 或者 tail() 方法。其中 head() 返回前 n 行数据，默认显示前 5 行数据。示例如下：
print('(2-1)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(5))
print ("The original series is:")
print (s)
#返回前三行数据
print (s.head(3))
#输出结果：
#原系列输出结果:
#0    1.249679
#1    0.636487
#2   -0.987621
#3    0.999613
#4    1.607751
#head(3)输出：
#dtype: float64
#0    1.249679
#1    0.636487
#2   -0.987621
#dtype: float64

#tail() 返回的是后 n 行数据，默认为后 5 行。示例如下：
print('(2-2)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(np.random.randn(4))
#原series
print(s)
#输出后两行数据
print (s.tail(2))
#输出结果：
#原Series输出：
#0    0.053340
#1    2.165836
#2   -0.719175
#3   -0.035178
#输出后两行数据：
#dtype: float64
#2   -0.719175
#3   -0.035178
#dtype: float64

''' 2) isnull()&nonull()检测缺失值 '''
#isnull() 和 nonull() 用于检测 Series 中的缺失值。所谓缺失值，顾名思义就是值不存在、丢失、缺少。
#    isnull()：如果为值不存在或者缺失，则返回 True。
#    notnull()：如果值不存在或者缺失，则返回 False。
#其实不难理解，在实际的数据分析任物中，数据的收集往往要经历一个繁琐的过程。在这个过程中难免会因为一些不可抗力，或者人为因素导致数据丢失的现象。这时，我们可以使用相应的方法对缺失值进行处理，比如均值插值、数据补齐等方法。上述两个方法就是帮助我们检测是否存在缺失值。示例如下：
import pandas as pd
#None代表缺失数据
print('(3-1)*** ***')
s=pd.Series([1,2,5,None])
print(pd.isnull(s))  #是空值返回True
print(pd.notnull(s)) #空值返回False
#输出结果：
#0    False
#1    False
#2    False
#3     True
#dtype: bool
#notnull():
#0     True
#1     True
#2     True
#3    False
#dtype: bool
