#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-06 21:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 05NumPy_数组副本vs视图.py
#######################################################
#副本和视图之间的区别
#副本和数组视图之间的主要区别在于副本是一个新数组，而这个视图只是原始数组的视图。
#副本拥有数据，对副本所做的任何更改都不会影响原始数组，对原始数组所做的任何更改也不会影响副本。
#视图不拥有数据，对视图所做的任何更改都会影响原始数组，而对原始数组所做的任何更改都会影响视图。

#副本：
#进行复制，更改原始数组并显示两个数组：
print('(1)*** 进行复制，更改原始数组并显示两个数组：***')
import numpy as np
arr = np.array([1, 2, 3, 4, 5])
x = arr.copy()
arr[0] = 61
print(arr) 
print(x)

#该副本不应受到对原始数组所做更改的影响。
#视图：
#创建视图，更改原始数组，然后显示两个数组：
print('(2)*** 创建视图，更改原始数组，然后显示两个数组：***')
import numpy as np
arr = np.array([1, 2, 3, 4, 5])
x = arr.view()
arr[0] = 61
print(arr) 
print(x)
#视图应该受到对原始数组所做更改的影响。

#在视图中进行更改：
#创建视图，更改视图，并显示两个数组：
print('(3)*** 创建视图，更改视图，并显示两个数组：***')
import numpy as np
arr = np.array([1, 2, 3, 4, 5])
x = arr.view()
x[0] = 31
print(arr) 
print(x)
#原始数组应该受到对视图所做更改的影响。

#检查数组是否拥有数据
#如上所述，副本拥有数据，而视图不拥有数据，但是我们如何检查呢？
#每个 NumPy 数组都有一个属性 base，如果该数组拥有数据，则这个 base 属性返回 None。
#否则，base 属性将引用原始对象。
#打印 base 属性的值以检查数组是否拥有自己的数据：
print('(4)*** ***')
import numpy as np
arr = np.array([1, 2, 3, 4, 5])
x = arr.copy()
y = arr.view()
print(x.base)
print(y.base)

#副本返回 None。
#视图返回原始数组。
