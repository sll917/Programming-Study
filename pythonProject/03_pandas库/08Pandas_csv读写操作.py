#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-18 22:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 08Pandas_csv读写文件.py
#######################################################
#Pandas csv读写文件
#在《Python Pandas读取文件》中，我们讲解了多种用 Pandas 读写文件的方法。本节我们讲解如何应用这些方法 。
#我们知道，文件的读写操作属于计算机的 IO 操作，Pandas IO 操作提供了一些读取器函数，比如 pd.read_csv()、pd.read_json 等，它们都返回一个 Pandas 对象。
#在 Pandas 中用于读取文本的函数有两个，分别是： read_csv() 和 read_table() ，它们能够自动地将表格数据转换为 DataFrame 对象。
'''
其中 read_csv 的语法格式，如下：
pandas.read_csv(filepath_or_buffer, sep=',', delimiter=None, header='infer',names=None, index_col=None, usecols=None)
'''

#下面，新建一个 txt 文件，并添加以下数据：
#ID,Name,Age,City,Salary
#1,Jack,28,Beijing,22000
#2,Lida,32,Shanghai,19000
#3,John,43,Shenzhen,12000
#4,Helen,38,Hengshui,3500
#将 txt 文件另存为 person.csv 文件格式，直接修改文件扩展名即可。接下来，对此文件进行操作。
#read_csv()
#read_csv() 表示从 CSV 文件中读取数据，并创建 DataFrame 对象。
print('(1)*** ***')
import pandas as pd
import numpy as np
#需要注意文件的路径
df=pd.read_csv("/home/sll/gitee/pythonProject/03_pandas库/person.csv")
print (df)
#输出结果：
#   ID   Name  Age      City  Salary
#0   1   Jack   28   Beijing   22000
#1   2   Lida   32  Shanghai   19000
#2   3   John   43  Shenzhen   12000
#3   4  Helen   38  Hengshui    3500
    
''' 1) 自定义索引 '''
#在 CSV 文件中指定了一个列，然后使用index_col可以实现自定义索引。
print('(2)*** ***')
import pandas as pd
df=pd.read_csv("/home/sll/gitee/pythonProject/03_pandas库/person.csv",index_col=['ID'])
print(df)
#输出结果：
#     Name  Age      City  Salary
#ID
#1    Jack   28   Beijing   22000
#2    Lida   32  Shanghai   19000
#3    John   43  Shenzhen   12000
#4   Helen   38  Hengshui    3500

''' 2) 查看每一列的dtype '''
import pandas as pd
#转换salary为float类型
print('(3)*** ***')
df=pd.read_csv("/home/sll/gitee/pythonProject/03_pandas库/person.csv",dtype={'Salary':np.float64})
print(df.dtypes)
#输出结果：
#ID          int64
#Name       object
#Age         int64
#City       object
#Salary    float64
#dtype: object
#注意：默认情况下，Salary 列的 dtype 是 int 类型，但结果显示其为 float 类型，因为我们已经在上述代码中做了类型转换。

''' 3) 更改文件标头名 '''
#使用 names 参数可以指定头文件的名称。
print('(4)*** ***')
import pandas as pd
df=pd.read_csv("/home/sll/gitee/pythonProject/03_pandas库/person.csv",names=['a','b','c','d','e'])
print(df)
#输出结果：
#    a      b    c         d       e
#0  ID   Name  Age      City  Salary
#1   1   Jack   28   Beijing   22000
#2   2   Lida   32  Shanghai   19000
#3   3   John   43  Shenzhen   12000
#4   4  Helen   38  Hengshui    3500
#注意：文件标头名是附加的自定义名称，但是您会发现，原来的标头名（列标签名）并没有被删除，此时您可以使用header参数来删除它。

#通过传递标头所在行号实现删除，如下所示：
print('(5)*** ***')
import pandas as pd
df=pd.read_csv("/home/sll/gitee/pythonProject/03_pandas库/person.csv",names=['a','b','c','d','e'],header=0)
print(df)
#输出结果：
#   a      b   c         d      e
#0  1   Jack  28   Beijing  22000
#1  2   Lida  32  Shanghai  19000
#2  3   John  43  Shenzhen  12000
#3  4  Helen  38  Hengshui   3500
#假如原标头名并没有定义在第一行，您也可以传递相应的行号来删除它。

''' 4) 跳过指定的行数 '''
#skiprows参数表示跳过指定的行数。
print('(6)*** ***')
import pandas as pd
df=pd.read_csv("/home/sll/gitee/pythonProject/03_pandas库/person.csv",skiprows=2)
print(df)
#输出结果：
#   2   Lida  32  Shanghai  19000
#0  3   John  43  Shenzhen  12000
#1  4  Helen  38  Hengshui   3500
#注意：包含标头所在行。

''' to_csv() '''
#Pandas 提供的 to_csv() 函数用于将 DataFrame 转换为 CSV 数据。如果想要把 CSV 数据写入文件，只需向函数传递一个文件对象即可。否则，CSV 数据将以字符串格式返回。
#下面看一组简单的示例：
print('(7)*** ***')
import pandas as pd
data = {'Name': ['Smith', 'Parker'], 'ID': [101, 102], 'Language': ['Python', 'JavaScript']}
info = pd.DataFrame(data)
print('DataFrame Values:\n', info)
print('\n转换为csv数据')
csv_data = info.to_csv()
print('CSV String Values:\n', csv_data)
#输出结果：
#DataFrame:
#      Name   ID    Language
#0   Smith  101      Python
#1  Parker  102  JavaScript
#csv数据:
#,Name,ID,Language
#0,Smith,101,Python
#1,Parker,102,JavaScript

#指定 CSV 文件输出时的分隔符，并将其保存在 pandas.csv 文件中，代码如下：
print('(8)*** ***')
import pandas as pd
#注意：pd.NaT表示null缺失数据
data = {'Name': ['Smith', 'Parker'], 'ID': [101, pd.NaT], 'Language': ['Python', 'JavaScript']}
info = pd.DataFrame(data)
csv_data = info.to_csv("/home/sll/gitee/pythonProject/03_pandas库/pandas.csv",sep='|')

