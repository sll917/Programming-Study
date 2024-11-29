#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-05 09:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: NumPy_数组裁切.py
#######################################################
"""
1, 裁切数组
python 中裁切的意思是将元素从一个给定的索引带到另一个给定的索引。
我们像这样传递切片而不是索引：[start：end]。
我们还可以定义步长，如下所示：[start：end：step]。
如果我们不传递 start，则将其视为 0。
如果我们不传递 end，则视为该维度内数组的长度。
如果我们不传递 step，则视为 1。
"""

print('(1)### 从下面的数组中裁切索引 1 到索引 5 的元素：###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[1:5])
#注释：结果包括了开始索引，但不包括结束索引。

print('(2)### 裁切数组中索引 4 到结尾的元素：###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[4:])

#运行实例
#实例
print('(3)### 裁切从开头到索引 4（不包括）的元素 ###')
#裁切从开头到索引 4（不包括）的元素：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[:4])

# 2, 负裁切
#使用减号运算符从末尾开始引用索引：
#实例
print('(4)### 从末尾开始的索引 3 到末尾开始的索引 1，对数组进行裁切: ###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[-3:-1])

#请使用 step 值确定裁切的步长：
#实例
print('(5)### 从索引 1 到索引 5，返回相隔的元素: ###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[1:5:2])

#实例
print('(6)### 从返回数组中相隔的元素: ###')
#返回数组中相隔的元素：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7])
print(arr[::2])

#裁切 2-D 数组
#实例
print('(7)### 从第二个元素开始，对从索引 1 到索引 4（不包括）的元素进行切片： ###')
import numpy as np
arr = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
print(arr[1, 1:4])
#注释：请记得第二个元素的索引为 1。

#实例
print('(8)### 从两个元素中返回索引 2：###')
import numpy as np
arr = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
print(arr[0:2, 2])

#实例
print('(9)### 从两个元素裁切索引 1 到索引 4（不包括），这将返回一个 2-D 数组：###')
#从两个元素裁切索引 1 到索引 4（不包括），这将返回一个 2-D 数组：
import numpy as np
arr = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
print(arr[0:2, 1:4])
