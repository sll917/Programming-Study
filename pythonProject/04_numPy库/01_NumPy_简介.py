#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-04 23:04
# Email: sll917@outlook.com
# Version: V1.0
# File Name: demo13_NumPy简介.py
#######################################################
print('(1)*** 使用列表创建 NumPy 数组***')
#创建 NumPy ndarray 对象
#NumPy 用于处理数组。 NumPy 中的数组对象称为 ndarray。
#我们可以使用 array() 函数创建一个 NumPy ndarray 对象。
#实例
import numpy as np
print(np.__version__)
arr = np.array([1, 2, 3, 4, 5])
print(arr)
print(type(arr))
#输出结果是:
#2.0.1
#[1 2 3 4 5]
#<class 'numpy.ndarray'>

#type(): 这个内置的 Python 函数告诉我们传递给它的对象的类型。像上面的代码一样，它表明 arr 是 numpy.ndarray 类型。
#要创建 ndarray，我们可以将列表、元组或任何类似数组的对象传递给 array() 方法，然后它将被转换为 ndarray：
#实例
print('(2)*** 使用元组创建 NumPy 数组***')
import numpy as np
arr = np.array((1, 2, 3, 4, 5))
print(arr)
#输出结果是:
#[1 2 3 4 5]

#数组中的维
#数组中的维是数组深度（嵌套数组）的一个级别。
""" 嵌套数组：指的是将数组作为元素的数组。"""
print('(3)***0-D 数组***')
#0-D 数组，或标量（Scalars），是数组中的元素。数组中的每个值都是一个 0-D 数组。
#用值 61 创建 0-D 数组：
import numpy as np
arr = np.array(61)
print(arr)
#输出结果是:
#61

print('(3)***1-D 数组***')
#其元素为 0-D 数组的数组，称为一维或 1-D 数组。
#这是最常见和基础的数组。
#创建包含值 1、2、3、4、5、6 的 1-D 数组：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6])
print(arr)
#输出结果是:
#[1 2 3 4 5 6]

print('(4)***2-D 数组***')
#其元素为 1-D 数组的数组，称为 2-D 数组。
#它们通常用于表示矩阵或二阶张量。
#NumPy 有一个专门用于矩阵运算的完整子模块 numpy.mat。
#创建包含值 1、2、3 和 4、5、6 两个数组的 2-D 数组：
import numpy as np
arr = np.array([[1, 2, 3], [4, 5, 6]])
print(arr)
#输出结果是:
#[[1 2 3]
# [4 5 6]]

print('(5)***3-D 数组***')
#其元素为 2-D 数组的数组，称为 3-D 数组。
#用两个2-D 数组创建一个 3-D 数组，这两个数组均包含值 1、2、3 和 4、5、6 的两个数组：
import numpy as np
arr = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])
print(arr)
#输出结果是:
#[[[1 2 3]
#  [4 5 6]]

#检查维数？
print('(6)***检查维数***')
#NumPy 数组提供了 ndim 属性，该属性返回一个整数，该整数会告诉我们数组有多少维。
#检查数组有多少维：
import numpy as np
a = np.array(42)
b = np.array([1, 2, 3, 4, 5])
c = np.array([[1, 2, 3], [4, 5, 6]])
d = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])
print(a.ndim)
print(b.ndim)
print(c.ndim)
print(d.ndim)
#输出结果是:
#0
#1
#2
#3

print('(7)***更高维的数组***')
#数组可以拥有任意数量的维。
#在创建数组时，可以使用 ndmin 参数定义维数。
#创建一个有 5 个维度的数组，并验证它拥有 5 个维度：
import numpy as np
arr = np.array([1, 2, 3, 4], ndmin=5)
print(arr)
print('number of dimensions :', arr.ndim)
#输出结果是:
#[[[[[1 2 3 4]]]]]
#number of dimensions : 5

#在此数组中，最里面的维度（第 5 个 dim）有 4 个元素，第 4 个 dim 有 1 个元素作为向量，第 3 个 dim 具有 1 个元素是与向量的矩阵，第 2 个 dim 有 1 个元素是 3D 数组，而第 1 个 dim 有 1 个元素，该元素是 4D 数组。
