#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-14 17:25
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 11_NumPy_数组搜索.py
#######################################################
print('(1)### ###')
#搜索数组
#您可以在数组中搜索（检索）某个值，然后返回获得匹配的索引。
#要搜索数组，请使用 where() 方法。
#查找值为 4 的索引：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 4, 4])
x = np.where(arr == 4)
print(x)

#上例会返回一个元组：(array([3, 5, 6],)
#意思就是值 4 出现在索引 3、5 和 6。
#查找值为偶数的索引：
print('(2)### ###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7, 8])
x = np.where(arr%2 == 0)
print(x)
    
#查找值为奇数的索引：
print('(3)### ###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7, 8])
x = np.where(arr%2 == 1)
print(x)

#搜索排序
#有一个名为 searchsorted() 的方法，该方法在数组中执行二进制搜索，并返回将在其中插入指定值以维持搜索顺序的索引。
#假定 searchsorted() 方法用于排序数组。
#查找应在其中插入值 7 的索引：
print('(4)### ###')
import numpy as np
arr = np.array([6, 7, 8, 9])
x = np.searchsorted(arr, 7)
print(x)

#例子解释：应该在索引 1 上插入数字 7，以保持排序顺序。
#该方法从左侧开始搜索，并返回第一个索引，其中数字 7 不再大于下一个值。
#从右侧搜索
#默认情况下，返回最左边的索引，但是我们可以给定 side='right'，以返回最右边的索引。
#从右边开始查找应该插入值 7 的索引：
print('(5)### ###')
import numpy as np
arr = np.array([6, 7, 8, 9])
x = np.searchsorted(arr, 7, side='right')
print(x)

#例子解释：应该在索引 2 上插入数字 7，以保持排序顺序。
#该方法从右边开始搜索，并返回第一个索引，其中数字 7 不再小于下一个值。
#多个值
#要搜索多个值，请使用拥有指定值的数组。
#查找应在其中插入值 2、4 和 6 的索引：
print('(6)### ###')
import numpy as np
arr = np.array([1, 3, 5, 7])
x = np.searchsorted(arr, [2, 4, 6])
print(x)

#返回值是一个数组：[1 2 3] 包含三个索引，其中将在原始数组中插入 2、4、6 以维持顺序。
