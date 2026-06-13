#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-18 16:19
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 01Series入门教程.py
#######################################################
'''
文章目录
        教程特点
        阅读条件
    Pandas是什么
        Pandas主要特点
        Pandas主要优势
        Pandas内置数据结构
    Pandas库下载和安装
        Windows系统安装
        Linux系统安装
                1) Ubuntu用户
                2) Fedora用户
        MacOSX系统安装
    Pandas Series入门教程
        创建Series对象
                1) 创建一个空Series对象
                2) ndarray创建Series对象
                3) dict创建Series对象
                4) 标量创建Series对象
        访问Series数据
                1) 位置索引访问
                2) 索引标签访问
        Series常用属性
                1) axes
                2) dtype
                3) empty
                4) ndim
                5) size
                6) values
                7) index
        Series常用方法
                1) head()&tail()查看数据
                2) isnull()&nonull()检测缺失值
    Pandas DataFrame入门教程（图解版）
        认识DataFrame结构
        创建DataFrame对象
                1) 创建空的DataFrame对象
                2) 列表创建DataFame对象
                3) 字典嵌套列表创建
                4) 列表嵌套字典创建DataFrame对象
                5) Series创建DataFrame对象
        列索引操作DataFrame
                1) 列索引选取数据列
                2) 列索引添加数据列
                3) 列索引删除数据列
        行索引操作DataFrame
                1) 标签索引选取
                2) 整数索引选取
                3) 切片操作多行选取
                4) 添加数据行
                5) 删除数据行
        常用属性和方法汇总
                1) T（Transpose）转置
                2) axes
                3) dtypes
                4) empty
                5) ndim
                6) shape
                7) size
                8) values
                9) head()&tail()查看数据
                10) shift()移动行或列
    Pandas Panel三维数据结构
        pandas.Panel()
        创建Panel 对象
                1) 创建一个空Panel
                2) ndarray三维数组创建
                3) DataFrame创建
        Panel中选取数据
                1) 使用 items选取数据
    Python Pandas描述性统计
        sum()求和
        mean()求均值
        std()求标准差
        数据汇总描述
    Python Pandas绘图教程（详解版）
        柱状图
        直方图
        箱型图
        区域图
        散点图
        饼状图
    Pandas csv读写文件
        read_csv()
                1) 自定义索引
                2) 查看每一列的dtype
                3) 更改文件标头名
                4) 跳过指定的行数
        to_csv()
    Pandas Excel读写操作详解
        to_excel()
        read_excel()
    Pandas和NumPy的比较
        创建数组
        布尔索引
        重塑数组形状
        Pdans与NumPy区别
        转换ndarray数组
'''
#Pandas 库是一个免费、开源的第三方 Python 库，是 Python 数据分析必不可少的工具之一，它为 Python 数据分析提供了高性能，且易于使用的数据结构，即 Series 和 DataFrame。Pandas 自诞生后被应用于众多的领域，比如金融、统计学、社会科学、建筑工程等。
#Pandas 库基于 Python NumPy 库开发而来，因此，它可以与 Python 的科学计算库配合使用。Pandas 提供了两种数据结构，分别是 Series（一维数组结构）与 DataFrame（二维数组结构），这两种数据结构极大地增强的了 Pandas 的数据分析能力。在本套教程中，我们将学习 Python Pandas 的各种方法、特性以及如何在实践中运用它们。
#教程特点
#本套教程是为 Pandas 初学者打造的，学习完本套教程，您将在一定程度上掌握 Pandas 的基础知识，以及各种功能。如果您是从事数据分析的工作人员，那么这套教程会对您有所帮助。
#本套教程对 Python Pandas 库进行详细地讲解，包括文件读写、统计学函数、缺失值处理、以及数据可视化等重点知识。为了降低初学者的学习门槛，我们的教程尽量采用通俗易懂、深入浅出的语言风格，相信通过对本套教程的学习，您一定会收获颇丰。
#阅读条件
#在开始学习本套教程前，首先您应该对于数据分析、数据可视化的概念有一定程度的了解，并且您已经熟练掌握 Python 语言的基础知识。其次，由于 Pandas 库是在 NumPy 库的基础上构建而来，所以建议您提前学习《Python NumPy教程》。

#Pandas是什么
#Pandas 是一个开源的第三方 Python 库，从 Numpy 和 Matplotlib 的基础上构建而来，享有数据分析“三剑客之一”的盛名（NumPy、Matplotlib、Pandas）。Pandas 已经成为 Python 数据分析的必备高级工具，它的目标是成为强大、灵活、可以支持任何编程语言的数据分析工具。
#Pandas 这个名字来源于面板数据（Panel Data）与数据分析（data analysis）这两个名词的组合。在经济学中，Panel Data 是一个关于多维数据集的术语。Pandas 最初被应用于金融量化交易领域，现在它的应用领域更加广泛，涵盖了农业、工业、交通等许多行业。
#Pandas 最初由 Wes McKinney（韦斯·麦金尼）于 2008 年开发，并于 2009 年实现开源。目前，Pandas 由 PyData 团队进行日常的开发和维护工作。在 2020 年 12 月，PyData 团队公布了最新的 Pandas 1.20 版本 。
#在 Pandas 没有出现之前，Python 在数据分析任务中主要承担着数据采集和数据预处理的工作，但是这对数据分析的支持十分有限，并不能突出 Python 简单、易上手的特点。Pandas 的出现使得 Python 做数据分析的能力得到了大幅度提升，它主要实现了数据分析的五个重要环节：
#    加载数据
#    整理数据
#    操作数据
#    构建数据模型
#    分析数据

'''
1, Pandas主要特点
Pandas 主要包括以下几个特点：
    它提供了一个简单、高效、带有默认标签（也可以自定义标签）的 DataFrame 对象。
    能够快速得从不同格式的文件中加载数据（比如 Excel、CSV 、SQL文件），然后将其转换为可处理的对象；
    能够按数据的行、列标签进行分组，并对分组后的对象执行聚合和转换操作；
    能够很方便地实现数据归一化操作和缺失值处理；
    能够很方便地对 DataFrame 的数据列进行增加、修改或者删除的操作；
    能够处理不同格式的数据集，比如矩阵数据、异构数据表、时间序列等；
    提供了多种处理数据集的方式，比如构建子集、切片、过滤、分组以及重新排序等。
上述知识点将在后续学习中为大家一一讲解。

2, Pandas主要优势
与其它语言的数据分析包相比，Pandas 具有以下优势：
    Pandas 的 DataFrame 和 Series 构建了适用于数据分析的存储结构；
    Pandas 简洁的 API 能够让你专注于代码的核心层面；
    Pandas 实现了与其他库的集成，比如 Scipy、scikit-learn 和 Matplotlib；
    Pandas 官方网站（点击访问）提供了完善资料支持，及其良好的社区环境。

3, Pandas内置数据结构
我们知道，构建和处理二维、多维数组是一项繁琐的任务。Pandas 为解决这一问题， 在 ndarray 数组（NumPy 中的数组）的基础上构建出了两种不同的数据结构，分别是 Series（一维数据结构）DataFrame（二维数据结构）：
    Series 是带标签的一维数组，这里的标签可以理解为索引，但这个索引并不局限于整数，它也可以是字符类型，比如 a、b、c 等；
    DataFrame 是一种表格型数据结构，它既有行标签，又有列标签。
下面对上述数据结构做简单地的说明：
数据结构	维度	说明
Series	1	该结构能够存储各种数据类型，比如字符数、整数、浮点数、Python 对象等，Series 用 name 和 index 属性来描述 数据值。Series 是一维数据结构，因此其维数不可以改变。
DataFrame	2	DataFrame 是一种二维表格型数据的结构，既有行索引，也有列索引。行索引是 index，列索引是 columns。 在创建该结构时，可以指定相应的索引值。
'''

#由于上述数据结构的存在，使得处理多维数组数任务变的简单。在《Pandas Series入门教程》和《Pandas DataFrame入门教程（图解）》两节中，我们会对上述数据结构做详细讲解。
#注意，在 Pandas 0.25 版本后，Pamdas 废弃了 Panel 数据结构，如果感兴趣可阅读《Pandas Panel三维数据结构》一节。
#Pandas库下载和安装
#Python 官方标准发行版并没有自带 Pandas 库，因此需要另行安装。除了标准发行版外，还有一些第三方机构发布的 Python 免费发行版， 它们在官方版本的基础上开发而来，并有针对性的提前安装了一些 Python 模块，从而满足某些特定领域的需求，比如专门适应于科学计算领域的 Anaconda，它就提前安装了多款适用于科学计算的软件包。
#对于第三方发行版而言，它们已经自带 Pandas 库，所以无须另行安装。下面介绍了常用的免费发行版：
#    Anaconda（官网下载：https://www.anaconda.com/）是一个开源的 Python 发行版，包含了 180 多个科学包及其依赖项。除了支持 Windows 系统外，也支持 Linux 和 Mac 系统。
#    Python(x,y)（下载地址：https://python-xy.github.io/）是一款基于 Python、Qt （图形用户界面）和 Spyder （交互式开发环境）开发的软件，主要用于数值计算、数据分析和数据可视化等工程项目，目前只支持 Python 2 版本。
#    WinPython（下载地址：https://sourceforge.net/projects/winpython/files/）一个免费的 Python 发行版，包含了常用的科学计算包与 Spyder IDE，但仅支持 Windows 系统。
#下面介绍在不同操作系统环境下，标准发行版安装 Pandas 的方法。
#Windows系统安装
#使用 pip 包管理器安装 Pandas，是最简单的一种安装方式。在 CMD 命令提示符界面行执行以下命令：
#pip install pandas
#Linux系统安装
#对于不同的版本的 Linux 系统，您可以采用它们各自的包管理器来安装 Pandas。
#1) Ubuntu用户
#Pandas 通常需要与其他软件包一起使用，因此可采用以下命令，一次性安装所有包：
#sudo pip install numpy scipy matplotlib pandas
#    1
#2) Fedora用户
#对于 Fedora 用户而言，可采用以下命令安装：
#sudo pip numpy scipy matplotlib pandas

#Pandas Series入门教程
#Series 结构，也称 Series 序列，是 Pandas 常用的数据结构之一，它是一种类似于一维数组的结构，由一组数据值（value）和一组标签组成，其中标签与数据值之间是一一对应的关系。
#Series 可以保存任何数据类型，比如整数、字符串、浮点数、Python 对象等，它的标签默认为整数，从 0 开始依次递增。Series 的结构图，如下所示：
#pandas series
#通过标签我们可以更加直观地查看数据所在的索引位置。

#创建Series对象
#Pandas 使用 Series() 函数来创建 Series 对象，通过这个对象可以调用相应的方法和属性，从而达到处理数据的目的：
'''
import pandas as pd
s=pd.Series( data, index, dtype, copy)

参数说明如下所示：
参数名称	描述
data	输入的数据，可以是列表、常量、ndarray 数组等。
index	索引值必须是惟一的，如果没有传递索引，则默认为 np.arrange(n)。
dtype	dtype表示数据类型，如果没有提供，则会自动判断得出。
copy	表示对 data 进行拷贝，默认为 False。
'''
#我们也可以使用数组、字典、标量值或者 Python 对象来创建 Series 对象。下面展示了创建 Series 对象的不同方法：

''' 1) 创建一个空Series对象 '''
#使用以下方法可以创建一个空的 Series 对象，如下所示：
print('(1)*** ***')
import pandas as pd
#输出数据为空
s = pd.Series()
print(s)
#输出结果如下：
#Series([], dtype: float64)

''' 2) ndarray创建Series对象 '''
#ndarray 是 NumPy 中的数组类型，当 data 是 ndarry 时，传递的索引必须具有与数组相同的长度。假如没有给 index 参数传参，在默认情况下，索引值将使用是 range(n) 生成，其中 n 代表数组长度，如下所示：
#[0,1,2,3…. range(len(array))-1]

#使用默认索引，创建 Series 序列对象：
print('(2-1)*** ***')
import numpy as np
import pandas as pd
data = np.array(['a','b','c','d'])
s = pd.Series(data)
print (s)
#输出结果如下：
#0   a
#1   b
#2   c
#3   d
#dtype: object

#上述示例中没有传递任何索引，所以索引默认从 0 开始分配 ，其索引范围为 0 到len(data)-1，即 0 到 3。这种设置方式被称为“隐式索引”。

#除了上述方法外，你也可以使用“显式索引”的方法定义索引标签，示例如下：
print('(2-2)*** ***')
import pandas as pd
import numpy as np
data = np.array(['a','b','c','d'])
#自定义索引标签（即显示索引）
s = pd.Series(data,index=[100,101,102,103])
print(s)
#输出结果：
#100  a
#101  b
#102  c
#103  d
#dtype: object

''' 3) dict创建Series对象 '''
#您可以把 dict 作为输入数据。如果没有传入索引时会按照字典的键来构造索引；反之，当传递了索引时需要将索引标签与字典中的值一一对应。
#下面两组示例分别对上述两种情况做了演示。

#示例1，没有传递索引时：
print('(3-1)*** ***')
import pandas as pd
import numpy as np
data = {'a' : 0., 'b' : 1., 'c' : 2.}
s = pd.Series(data)
print(s)
#输出结果：
#a 0.0
#b 1.0
#c 2.0
#dtype: float64

#示例 2，为index参数传递索引时：
print('(3-2)*** ***')
import pandas as pd
import numpy as np
data = {'a' : 0., 'b' : 1., 'c' : 2.}
s = pd.Series(data,index=['b','c','d','a'])
print(s)
#输出结果：
#b 1.0
#c 2.0
#d NaN
#a 0.0
#dtype: float64
#当传递的索引值无法找到与其对应的值时，使用 NaN（非数字）填充。

''' 4) 标量创建Series对象 '''
#如果 data 是标量值，则必须提供索引，示例如下：

print('(4-1)*** ***')
import pandas as pd
import numpy as np
s = pd.Series(5, index=[0, 1, 2, 3])
print(s)
#输出如下：
#0  5
#1  5
#2  5
#3  5
#dtype: int64
#标量值按照 index 的数量进行重复，并与其一一对应。


#访问Series数据
#上述讲解了创建 Series 对象的多种方式，那么我们应该如何访问 Series 序列中元素呢？分为两种方式，一种是位置索引访问；另一种是索引标签访问。
''' 1) 位置索引访问 '''
#这种访问方式与 ndarray 和 list 相同，使用元素自身的下标进行访问。我们知道数组的索引计数从 0 开始，这表示第一个元素存储在第 0 个索引位置上，以此类推，就可以获得 Series 序列中的每个元素。下面看一组简单的示例：

print('(5-1)*** ***')
import pandas as pd
s = pd.Series([1,2,3,4,5],index = ['a','b','c','d','e'])
print(s)  
print(s[0])  #位置下标
print(s['a']) #标签下标
#输出结果：
#1
#1

#通过切片的方式访问 Series 序列中的数据，示例如下：
print('(5-2)*** ***')
import pandas as pd
s = pd.Series([1,2,3,4,5],index = ['a','b','c','d','e'])
print(s[:3])
#输出结果：
#a  1
#b  2
#c  3
#dtype: int64

#如果想要获取最后三个元素，也可以使用下面的方式：
print('(5-3)*** ***')
import pandas as pd
s = pd.Series([1,2,3,4,5],index = ['a','b','c','d','e'])
print(s[-3:])
#输出结果：
#c  3
#d  4
#e  5
#dtype: int64

''' 2) 索引标签访问 '''
#Series 类似于固定大小的 dict，把 index 中的索引标签当做 key，而把 Series 序列中的元素值当做 value，然后通过 index 索引标签来访问或者修改元素值。
#示例1，使用索标签访问单个元素值：
print('(6-1)*** ***')
import pandas as pd
s = pd.Series([6,7,8,9,10],index = ['a','b','c','d','e'])
print(s['a'])
#输出结果：
#6

#示例 2，使用索引标签访问多个元素值
print('(6-2)*** ***')
import pandas as pd
s = pd.Series([6,7,8,9,10],index = ['a','b','c','d','e'])
print(s[['a','c','d']])
#输出结果：
#a    6
#c    8
#d    9
#dtype: int64

#示例3，如果使用了 index 中不包含的标签，则会触发异常：
print('(6-3)*** ***')
import pandas as pd
s = pd.Series([6,7,8,9,10],index = ['a','b','c','d','e'])
#不包含f值
#print(s['f'])
#输出结果：
#......
#KeyError: 'f'

