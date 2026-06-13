#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-18 22:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 04DataFrame的属性和方法.py
#######################################################
'''
常用属性和方法汇总
DataFrame 的属性和方法，与 Series 相差无几，如下所示：
名称	属性&方法描述
T   	行和列转置。
axes	返回一个仅以行轴标签和列轴标签为成员的列表。
dtypes	返回每列数据的数据类型。
empty	DataFrame中没有数据或者任意坐标轴的长度为0，则返回True。
ndim	轴的数量，也指数组的维数。
shape	返回一个元组，表示了 DataFrame 维度。
size	DataFrame中的元素数量。
values	使用 numpy 数组表示 DataFrame 中的元素值。
head()	返回前 n 行数据。
tail()	返回后 n 行数据。
shift()	将行或列移动指定的步幅长度
'''


#下面对 DataFrame 常用属性进行演示，首先我们创建一个 DataFrame 对象，示例如下：
print('(1-0)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#输出series
print(df)
#输出结果：
#输出 series 数据:
'''
Name  years  Rating
0  c语言中文网    5    4.23
1     编程帮     6    3.24
2      百度     15    3.98
3   360搜索     28    2.56
4      谷歌     3     3.20
5     微学苑    19    4.60
6  Bing搜索     23    3.80
'''

''' ) T（Transpose）转置 '''
#返回 DataFrame 的转置，也就是把行和列进行交换。
print('(1-1)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#输出DataFrame的转置
print(df.T)
#输出结果：
#Our data series is:
#             0         1      2      3       4    5       6
#Name    c语言中文网   编程帮    百度  360搜索   谷歌  微学苑  Bing搜索
#years        5        6      15      28      3     19      23
#Rating    4.23       3.24    3.98    2.56    3.2   4.6     3.8

''' 2) axes '''
#返回一个行标签、列标签组成的列表。
print('(1-2)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#输出行、列标签
print(df.axes)
#输出结果：
#[RangeIndex(start=0, stop=7, step=1), Index(['Name', 'years', 'Rating'], dtype='object')]

''' 3) dtypes '''
#返回每一列的数据类型。示例如下：
print('(1-3)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#输出行、列标签
print(df.dtypes)
#输出结果：
#Name       object
#years       int64
#Rating     float64
#dtype:     object

''' 4) empty '''
#返回一个布尔值，判断输出的数据对象是否为空，若为 True 表示对象为空。
print('(1-4)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#判断输入数据是否为空
print(df.empty)
#输出结果：
#判断输入对象是否为空：
#False

''' 5) ndim '''
#返回数据对象的维数。DataFrame 是一个二维数据结构。
print('(1-5)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#DataFrame的维度
print(df.ndim)
#输出结果：
#2

''' 6) shape '''
#返回一个代表 DataFrame 维度的元组。返回值元组 (a,b)，其中 a 表示行数，b 表示列数。
print('(1-6)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#DataFrame的形状
print(df.shape)
#输出结果：
#(7, 3)

''' 7) size '''
#返回 DataFrame 中的元素数量。示例如下：
print('(1-7)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#DataFrame的中元素个数
print(df.size)
#输出结果：
#21

''' 8) values '''
#以 ndarray 数组的形式返回 DataFrame 中的数据。
print('(1-8)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#DataFrame的数据
print(df.values)
#输出结果：
#[['c语言中文网' 5 4.23]
#['编程帮' 6 3.24]
#['百度' 15 3.98]
#['360搜索' 28 2.56]
#['谷歌' 3 3.2]
#['微学苑' 19 4.6]
#['Bing搜索' 23 3.8]]

''' 9) head()&tail()查看数据 '''
#如果想要查看 DataFrame 的一部分数据，可以使用 head() 或者 tail() 方法。其中 head() 返回前 n 行数据，默认显示前 5 行数据。示例如下：
print('(1-9)*** ***')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#获取前3行数据
print(df.head(3))
#输出结果：
#     Name       years   Rating
#0   c语言中文网      5     4.23
#1    编程帮         6     3.24
#2    百度          15     3.98

''' tail() 返回后 n 行数据，示例如下： '''
print('****************************')
import pandas as pd
import numpy as np
d = {'Name':pd.Series(['c语言中文网','编程帮',"百度",'360搜索','谷歌','微学苑','Bing搜索']),
   'years':pd.Series([5,6,15,28,3,19,23]),
   'Rating':pd.Series([4.23,3.24,3.98,2.56,3.20,4.6,3.8])}
#构建DataFrame
df = pd.DataFrame(d)
#获取后2行数据
print(df.tail(2))
#输出结果：
#      Name     years   Rating
#5     微学苑      19     4.6
#6    Bing搜索     23     3.8

''' 10) shift()移动行或列 '''
#如果您想要移动 DataFrame 中的某一行/列，可以使用 shift() 函数实现。它提供了一个periods参数，该参数表示在特定的轴上移动指定的步幅。
'''
shift() 函数的语法格式如下：
DataFrame.shift(periods=1, freq=None, axis=0)
参数说明如下：
参数名称	说明
peroids	    类型为int，表示移动的幅度，可以是正数，也可以是负数，默认值为1。
freq	    日期偏移量，默认值为None，适用于时间序。取值为符合时间规则的字符串。
axis	    如果是 0 或者 “index” 表示上下移动，如果是 1 或者 “columns” 则会左右移动。
fill_value	该参数用来填充缺失值。
'''

#该函数的返回值是移动后的 DataFrame 副本。下面看一组简单的实例：
print('(10-1)*** ***')
import pandas as pd
info= pd.DataFrame({'a_data': [40, 28, 39, 32, 18],
'b_data': [20, 37, 41, 35, 45],
'c_data': [22, 17, 11, 25, 15]})
print(info)
print('#移动幅度为3')
print(info.shift(periods=3))
#输出结果：
#   a_data  b_data  c_data
#0     NaN     NaN     NaN
#1     NaN     NaN     NaN
#2     NaN     NaN     NaN
#3    40.0    20.0    22.0
#4    28.0    37.0    17.0

#下面使用 fill_value 参数填充 DataFrame 中的缺失值，如下所示：
print('(10-2)*** ***')
import pandas as pd
info= pd.DataFrame({'a_data': [40, 28, 39, 32, 18],
'b_data': [20, 37, 41, 35, 45],
'c_data': [22, 17, 11, 25, 15]})
#向右边移动幅度为1
#将缺失值和原数值替换为52
print(info.shift(periods=1,axis=1))
print(info.shift(periods=1,axis=1,fill_value= 52))
#输出结果：
#原输出结果：
# a_data  b_data  c_data
#0     NaN      40      20
#1     NaN      28      37
#2     NaN      39      41
#3     NaN      32      35
#4     NaN      18      45
#   a_data  b_data  c_data
#0      52      40      20
#1      52      28      37
#2      52      39      41
#3      52      32      35
#4      52      18      45
#注意：fill_value 参数不仅可以填充缺失值，还也可以对原数据进行替换。

