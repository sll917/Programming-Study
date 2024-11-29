#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-13 21:57
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 07_NumPy_数组重塑.py
#######################################################
print('(1)*** ***')
#数组重塑
#重塑意味着更改数组的形状。
#数组的形状是每个维中元素的数量。
#通过重塑，我们可以添加或删除维度或更改每个维度中的元素数量。

#从 1-D 重塑为 2-D
#实例
#将以下具有 12 个元素的 1-D 数组转换为 2-D 数组。
#最外面的维度将有 4 个数组，每个数组包含 3 个元素：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
newarr = arr.reshape(4, 3)
print(newarr)

#从 1-D 重塑为 3-D
#实例
#将以下具有 12 个元素的 1-D 数组转换为 3-D 数组。
#最外面的维度将具有 2 个数组，其中包含 3 个数组，每个数组包含 2 个元素：
print('(2)*** ***')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
newarr = arr.reshape(2, 3, 2)
print(newarr)

#我们可以重塑成任何形状吗？
#是的，只要重塑所需的元素在两种形状中均相等。
#我们可以将 8 元素 1D 数组重塑为 2 行 2D 数组中的 4 个元素，但是我们不能将其重塑为 3 元素 3 行 2D 数组，因为这将需要 3x3 = 9 个元素。
#实例
#尝试将具有 8 个元素的 1D 数组转换为每个维度中具有 3 个元素的 2D 数组（将产生错误）：
print('(3)*** ***')
#import numpy as np
#arr = np.array([1, 2, 3, 4, 5, 6, 7, 8])
#newarr = arr.reshape(3, 3)
#print(newarr)

#返回副本还是视图？
#实例
#检查返回的数组是副本还是视图：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7, 8])
print(arr.reshape(2, 4).base)

#上面的例子返回原始数组，因此它是一个视图。
#未知的维
#您可以使用一个“未知”维度。
#这意味着您不必在 reshape 方法中为维度之一指定确切的数字。
#传递 -1 作为值，NumPy 将为您计算该数字。
#实例
#将 8 个元素的 1D 数组转换为 2x2 元素的 3D 数组：
print('(4)*** ***')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6, 7, 8])
newarr = arr.reshape(2, 2, -1)
print(newarr)
#注释：我们不能将 -1 传递给一个以上的维度。

#展平数组
#展平数组（Flattening the arrays）是指将多维数组转换为 1D 数组。
#我们可以使用 reshape(-1) 来做到这一点。
#实例
#把数组转换为 1D 数组：
print('(5)*** ***')
import numpy as np
arr = np.array([[1, 2, 3], [4, 5, 6]])
newarr = arr.reshape(-1)
print(newarr)

#注释：有很多功能可以更改 numpy flatten、ravel 中数组形状，还可以重新排列元素 rot90、flip、fliplr、flipud 等。这些功能属于 numpy 的中级至高级部分。
