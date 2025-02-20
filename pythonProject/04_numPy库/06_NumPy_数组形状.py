#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-13 21:47
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 06NumPy_数组形状.py
#######################################################
print('(1)*** ***')
#数组的形状
#数组的形状是每个维中元素的数量。

#获取数组的形状
#NumPy 数组有一个名为 shape 的属性，该属性返回一个元组，每个索引具有相应元素的数量。
#实例
#打印 2-D 数组的形状：
import numpy as np
arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
print(arr.shape)
#上面的例子返回 (2, 4)，这意味着该数组有 2 个维，每个维有 4 个元素。

#利用 ndmin 使用值 1,2,3,4 的向量创建有 5 个维度的数组，并验证最后一个维度的值为 4：
print('(2)*** ***')
import numpy as np
arr = np.array([1, 2, 3, 4], ndmin=5)
print(arr)
print('shape of array :', arr.shape)
#元组的形状代表什么？
#每个索引处的整数表明相应维度拥有的元素数量。
#上例中的索引 4，我们的值为 4，因此可以说第 5 个 ( 4 + 1 th) 维度有 4 个元素
