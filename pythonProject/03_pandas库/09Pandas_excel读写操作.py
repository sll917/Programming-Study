#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-18 22:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 09Pandas_excel读写操作.py
#######################################################
''' pandas Excel读写操作详解 '''
#Excel 是由微软公司开发的办公软件之一，它在日常工作中得到了广泛的应用。在数据量较少的情况下，Excel 对于数据的处理、分析、可视化有其独特的优势，因此可以显著提升您的工作效率。但是，当数据量非常大时，Excel 的劣势就暴露出来了，比如，操作重复、数据分析难等问题。Pandas 提供了操作 Excel 文件的函数，可以很方便地处理 Excel 表格。
''' to_excel() '''
#通过 to_excel() 函数可以将 Dataframe 中的数据写入到 Excel 文件。
#如果想要把单个对象写入 Excel 文件，那么必须指定目标文件名；如果想要写入到多张工作表中，则需要创建一个带有目标文件名的ExcelWriter对象，并通过sheet_name参数依次指定工作表的名称。
'''
to_ecxel() 语法格式如下：
DataFrame.to_excel(excel_writer, sheet_name='Sheet1', na_rep='', float_format=None, columns=None, header=True, index=True, index_label=None, startrow=0, startcol=0, engine=None, merge_cells=True, encoding=None, inf_rep='inf', verbose=True, freeze_panes=None)

下表列出函数的常用参数项，如下表所示：
参数名称	描述说明
excel_wirter	文件路径或者 ExcelWrite 对象。
sheet_name	指定要写入数据的工作表名称。
na_rep	缺失值的表示形式。
float_format	它是一个可选参数，用于格式化浮点数字符串。
columns	指要写入的列。
header	写出每一列的名称，如果给出的是字符串列表，则表示列的别名。
index	表示要写入的索引。
index_label	引用索引列的列标签。如果未指定，并且 hearder 和 index 均为为 True，则使用索引名称。如果 DataFrame 使用 MultiIndex，则需要给出一个序列。
startrow	初始写入的行位置，默认值0。表示引用左上角的行单元格来储存 DataFrame。
startcol	初始写入的列位置，默认值0。表示引用左上角的列单元格来储存 DataFrame。
engine	它是一个可选参数，用于指定要使用的引擎，可以是 openpyxl 或 xlsxwriter。
'''

#下面看一组简单的示例：
print('(1)*** ***')
import pandas as pd
#创建DataFrame数据
#info_website = pd.DataFrame({'name': ['编程帮', 'c语言中文网', '微学苑', '92python'],
#     'rank': [1, 2, 3, 4],
#     'language': ['PHP', 'C', 'PHP','Python' ],
#     'url': ['www.bianchneg.com', 'c.bianchneg.net', 'www.weixueyuan.com','www.92python.com' ]})
#创建ExcelWrite对象
#writer = pd.ExcelWriter('website.xlsx')
#info_website.to_excel(writer)
#writer.save()
#print('输出成功')
#上述代码执行后会自动生成 website.xlsx 文件，文件内容如下：

''' read_excel() '''
#如果您想读取 Excel 表格中的数据，可以使用 read_excel() 方法，其语法格式如下：
'''
pd.read_excel(io, sheet_name=0, header=0, names=None, index_col=None,
              usecols=None, squeeze=False,dtype=None, engine=None,
              converters=None, true_values=None, false_values=None,
              skiprows=None, nrows=None, na_values=None, parse_dates=False,
              date_parser=None, thousands=None, comment=None, skipfooter=0,
              convert_float=True, **kwds)
'''

#下表对常用参数做了说明：
'''
参数名称	    说明
io	            表示 Excel 文件的存储路径。
sheet_name	    要读取的工作表名称。
header	        指定作为列名的行，默认0，即取第一行的值为列名；若数据不包含列名，则设定 header = None。若将其设置 为 header=2，则表示将前两行作为多重索引。
names	        一般适用于Excel缺少列名，或者需要重新定义列名的情况；names的长度必须等于Excel表格列的长度，否则会报错。
index_col	    用做行索引的列，可以是工作表的列名称，如 index_col = ‘列名’，也可以是整数或者列表。
usecols	        int或list类型，默认为None，表示需要读取所有列。
squeeze	        boolean，默认为False，如果解析的数据只包含一列，则返回一个Series。
converters	    规定每一列的数据类型。
skiprows	    接受一个列表，表示跳过指定行数的数据，从头部第一行开始。
nrows	        需要读取的行数。
skipfooter	    接受一个列表，省略指定行数的数据，从尾部最后一行开始。
'''

#示例如下所示：
#import pandas as pd
##读取excel数据
#df = pd.read_excel('website.xlsx',index_col='name',skiprows=[2])
##处理未命名列
#df.columns = df.columns.str.replace('Unnamed.*', 'col_label')
#print(df)
#输出结果：
#           col_label     rank    language          agelimit
#name
#编程帮           0         1        PHP       www.bianchneg.com
#微学苑           2         3        PHP       www.weixueyuan.com
#92python        3         4        Python    www.92python.com

#再看一组示例：
#import pandas as pd
##读取excel数据
##index_col选择前两列作为索引列
##选择前三列数据，name列作为行索引
#df = pd.read_excel('website.xlsx',index_col='name',index_col=[0,1],usecols=[1,2,3])
##处理未命名列，固定用法
#df.columns = df.columns.str.replace('Unnamed.*', 'col_label')
#print(df)
#输出结果：
#                   language
#name      rank
#编程帮       1          PHP
#c语言中文网   2           C
#微学苑       3          PHP
#92python    4         Python

#Pandas和NumPy的比较
#我们知道 Pandas 是在 NumPy 的基础构建而来，因此，熟悉 NumPy 可以更加有效的帮助我们使用 Pandas。
#NumPy 主要用 C语言编写，因此，在计算还和处理一维或多维数组方面，它要比 Python 数组快得多。关于 NumPy 的学习，可以参考《Python NumPy教程》。
#创建数组
#数组的主要作用是在一个变量中存储多个值。NumPy 可以轻松地处理多维数组，示例如下:
#import numpy as np
#arr = np.array([2, 4, 6, 8, 10, 12])
#print(type(arr))
#print ("打印新建数组: ",end="")
##使用for循环读取数据
#for l in range (0,5):
#    print (arr[l], end=" ")
#输出结果：
#<class 'numpy.ndarray'>
#打印新建数组: 2 4 6 8 10
#    1
#    2
#虽然 Python 本身没有数组这个说法，不过 Python 提供一个 array 模块，用于创建数字、字符类型的数组，它能够容纳字符型、整型、浮点型等基本类型。示例如下：
#import array
##注意此处的 'l' 表示有符号int类型
#arr = array.array('l', [2, 4, 6, 8, 10, 12])
#print(type(arr))
#print ("新建数组: ",end="")
#for i in range (0,5):
#    print (arr[i], end=" ")
#输出结果：
#<class 'array.array'>
#新建数组: 2 4 6 8 10
#    1
#    2
#布尔索引
#布尔索引是 NumPy 的重要特性之一，通常与 Pandas 一起使用。它的主要作用是过滤 DataFrame 中的数据，比如布尔值的掩码操作。
#下面示例展示了如何使用布尔索引访问 DataFrame 中的数据。
#首先创建一组包含布尔索引的数据，如下所示：
#import pandas as pd
#dict = {'name':["Smith", "William", "Phill", "Parker"],
#        'age': ["28", "39", "34", "36"]}
#info = pd.DataFrame(dict, index = [True, True, False, True])
#print(info)
#输出结果：
#          name age
#True     Smith  28
#True   William  39
#False    Phill  34
#True    Parker  36
#然后使用.loc访问索引为 True 的数据。示例如下：
#import pandas as pd
#dict = {'name':["Smith", "William", "Phill", "Parker"],
#        'age': ["28", "39", "34", "36"]}
#info = pd.DataFrame(dict, index = [True, True, False, True])
##返回所有为 True的数据
#print(info.loc[True])
#输出结果：
#         name age
#True    Smith  28
#True  William  39
#True   Parker  36
#    1
#    2
#    3
#    4
#重塑数组形状
#在不改变数组数据的情况下，对数组进行变形操作，即改变数组的维度，比如 23（两行三列）的二维数组变维 32（三行两列）的二维数组。变形操作可以通过 reshape() 函数实现。
#示例如下：
#import numpy as np
#arr = np.arange(16)
#print("原数组: \n", arr)
#arr = np.arange(16).reshape(2, 8)
#print("\n变形后数组:\n", arr)
#arr = np.arange(16).reshape(8 ,2)
#print("\n变形后数组:\n", arr)
#输出结果：
#原数组:
#[ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15]
#变形后数组:
#[[ 0  1  2  3  4  5  6  7]
#[ 8  9 10 11 12 13 14 15]]
#变形后数组:
#[[ 0  1]
#[ 2  3]
#[ 4  5]
#[ 6  7]
#[ 8  9]
#[10 11]
#[12 13]
#[14 15]]

#Pdans与NumPy区别
#Pandas 和 NumPy 被认为是科学计算与机器学习中必不可少的库，因为它们具有直观的语法和高性能的矩阵计算能力。下面对 Pandas 与 NumPy 进行简单的总结，如下表所示：
#比较项	Pandas	NumPy
#适应性	Pandas主要用来处理类表格数据。	NumPy 主要用来处理数值数据。
#工具	Pandas提供了Series和DataFrame数据结构。	NumPy 构建了 ndarray array来容纳数据。
#性能	Pandas对于处理50万行以上的数据更具优势。	NumPy 则对于50万以下或者更少的数据，性能更佳。
#内存利用率	与 NumPy相比，Pandas会消耗大量的内存。	NumPy 会消耗较少的内存。
#对象	Pandas 提供了 DataFrame 2D数据表对象。	NumPy 则提供了一个多维数组 ndarray 对象

"""
转换ndarray数组
在某些情况下，需要执行一些 NumPy 数值计算的高级函数，这个时候您可以使用 to_numpy() 函数，将 DataFrame 对象转换为 NumPy ndarray 数组，并将其返回。函数的语法格式如下：
DataFrame.to_numpy(dtype=None, copy=False)
参数说明如下：
    dtype：可选参数，表示数据类型；
    copy：布尔值参数，默认值为 Fales，表示返回值不是其他数组的视图。
"""

#下面使用示例，了解该函数的使用方法。示例 1：
info = pd.DataFrame({"P": [2, 3], "Q": [4.0, 5.8]})
#给info添加R列
info['R'] = pd.date_range('2020-12-23', periods=2)
print(info)
#将其转化为numpy数组
n=info.to_numpy()
print(n)
print(type(n))
#输出结果：
#[[2 4.0 Timestamp('2020-12-23 00:00:00')]
#[3 5.8 Timestamp('2020-12-24 00:00:00')]]
#    1
#    2
#可以通过 type 查看其类型，输出如下：
#numpy.ndarray
#示例2：
#import pandas as pd
##创建DataFrame对象
#info = pd.DataFrame([[17, 62, 35],[25, 36, 54],[42, 20, 15],[48, 62, 76]],
#columns=['x', 'y', 'z'])
#print('DataFrame\n----------\n', info)
##转换DataFrame为数组array
#arr = info.to_numpy()
#print('\nNumpy Array\n----------\n', arr)
#输出结果：
#DataFrame
#----------
#     x   y   z
#0  17  62  35
#1  25  36  54
#2  42  20  15
#3  48  62  76
#Numpy Array
#----------
#[[17 62 35]
#[25 36 54]
#[42 20 15]
#[48 62 76]]
