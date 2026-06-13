#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-14 17:15
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 10_NumPy_数组拆分.py
#######################################################
print('(1)### ###')
#拆分 NumPy 数组
#拆分是连接的反向操作。
#连接（Joining）是将多个数组合并为一个，拆分（Spliting）将一个数组拆分为多个。
#我们使用 array_split() 分割数组，将要分割的数组和分割数传递给它。

#将数组分为 3 部分：
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6])
newarr = np.array_split(arr, 3)
print(newarr)

#注释：返回值是一个包含三个数组的数组。
#如果数组中的元素少于要求的数量，它将从末尾进行相应调整。
#将数组分为 4 部分：
print('(2)### ###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6])
newarr = np.array_split(arr, 4)
print(newarr)

#提示：我们也有 split() 方法可用，但是当源数组中的元素较少用于拆分时，它将不会调整元素，如上例那样，array_split() 正常工作，但 split() 会失败。
#拆分为数组
#array_split() 方法的返回值是一个包含每个分割的数组。
#如果将一个数组拆分为 3 个数组，则可以像使用任何数组元素一样从结果中访问它们：
#访问拆分的数组：
print('(3)### ###')
import numpy as np
arr = np.array([1, 2, 3, 4, 5, 6])
newarr = np.array_split(arr, 3)
print(newarr[0])
print(newarr[1])
print(newarr[2])

#分割二维数组
#拆分二维数组时，请使用相同的语法。
#使用 array_split() 方法，传入要分割的数组和想要分割的数目。
#把这个 2-D 拆分为三个 2-D 数组。
print('(4)### ###')
import numpy as np
arr = np.array([[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]])
newarr = np.array_split(arr, 3)
print(newarr)

#上例返回三个 2-D 数组。
#让我们看另一个例子，这次 2-D 数组中的每个元素包含 3 个元素。
#把这个 2-D 拆分为三个 2-D 数组。
print('(5)### ###')
import numpy as np
arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15], [16, 17, 18]])
newarr = np.array_split(arr, 3)
print(newarr)

#上例返回三个 2-D 数组。
#此外，您可以指定要进行拆分的轴。
#下面的例子还返回三个 2-D 数组，但它们沿行 (axis=1) 分割。
#实例
#沿行把这个 2-D 拆分为三个 2-D 数组。
print('(6)### ###')
import numpy as np
arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15], [16, 17, 18]])
newarr = np.array_split(arr, 3, axis=1)
print(newarr)

#另一种解决方案是使用与 hstack() 相反的 hsplit()。
#使用 hsplit() 方法将 2-D 数组沿着行分成三个 2-D 数组。
print('(7)### ###')
import numpy as np
arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15], [16, 17, 18]])
newarr = np.hsplit(arr, 3)
print(newarr)
#提示：vsplit() 和 dsplit() 可以使用与 vstack() 和 dstack() 类似的替代方法。
