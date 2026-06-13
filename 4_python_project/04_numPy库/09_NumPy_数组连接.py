#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-14 13:43
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 09_NumPy_数组连接.py
#######################################################
#连接 NumPy 数组
#连接意味着将两个或多个数组的内容放在单个数组中。
#在 SQL 中，我们基于键来连接表，而在 NumPy 中，我们按轴连接数组。
#我们传递了一系列要与轴一起连接到 concatenate() 函数的数组。如果未显式传递轴，则将其视为 0。
print('(1)### ###')
#连接两个数组：
import numpy as np
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
arr = np.concatenate((arr1, arr2))
print(arr)

print('(2)### ###')
#沿着行 (axis=1) 连接两个 2-D 数组：
import numpy as np
arr1 = np.array([[1, 2], [3, 4]])
arr2 = np.array([[5, 6], [7, 8]])
arr = np.concatenate((arr1, arr2), axis=1)
print(arr)

#使用堆栈函数连接数组
#堆栈与级联相同，唯一的不同是堆栈是沿着新轴完成的。
#我们可以沿着第二个轴连接两个一维数组，这将导致它们彼此重叠，即，堆叠（stacking）。
#我们传递了一系列要与轴一起连接到 concatenate() 方法的数组。如果未显式传递轴，则将其视为 0。
print('(3)### ###')
import numpy as np
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
arr = np.stack((arr1, arr2), axis=1)
print(arr)

#沿行堆叠
#NumPy 提供了一个辅助函数：hstack() 沿行堆叠。
print('(4)### ###')
import numpy as np
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
arr = np.hstack((arr1, arr2))
print(arr)

#沿列堆叠
#NumPy 提供了一个辅助函数：vstack() 沿列堆叠。
print('(5)### ###')
import numpy as np
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
arr = np.vstack((arr1, arr2))
print(arr)

#沿高度堆叠（深度）
#NumPy 提供了一个辅助函数：dstack() 沿高度堆叠，该高度与深度相同。
print('(6)### ###')
import numpy as np
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
arr = np.dstack((arr1, arr2))
print(arr)
