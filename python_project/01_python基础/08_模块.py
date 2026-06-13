#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-03 21:45
# Email: sll917@outlook.com
# Version: V1.0
# File Name: demo8_模块.py
#######################################################
print('(1)------------------完美分割线---------------------')
#Python 模块
#Python 作用域
#Python 日期
#什么是模块？
#请思考与代码库类似的模块。
#模块是包含一组函数的文件，希望在应用程序中引用。

# 1-创建模块
#如需创建模块，只需将所需代码保存在文件扩展名为 .py 的文件中：
#实例
#在名为 mymodule.py 的文件中保存代码：

def greeting(name):
  print("Hello, " + name)

# 2-使用模块
#现在，我们就可以用 import 语句来使用我们刚刚创建的模块：

#实例
#导入名为 mymodule 的模块，并调用 greeting 函数：

import mymodule
mymodule.greeting("Bill")

#注释：如果使用模块中的函数时，请使用以下语法：

#module_name.function_name

# 3-模块中的变量
#模块可以包含已经描述的函数，但也可以包含各种类型的变量（数组、字典、对象等）：

#实例
#在文件 mymodule.py 中保存代码：

person1 = {
  "name": "Bill",
  "age": 63,
  "country": "USA"
}
#实例
#导入名为 mymodule 的模块，并访问 person1 字典：

import mymodule
a = mymodule.person1["age"]
print(a)

# 4-为模块命名
#您可以随意对模块文件命名，但是文件扩展名必须是 .py。

# 5-重命名模块
#您可以在导入模块时使用 as 关键字创建别名：

#实例
#为 mymodule 创建别名 mx：

print('(2)------------------完美分割线---------------------')
import mymodule as mx

a = mx.person1["age"]
print(a)

# 6-内建模块
#Python 中有几个内建模块，您可以随时导入。

#实例
#导入并使用 platform 模块：

print('(3)------------------完美分割线---------------------')
import platform

x = platform.system()
print(x)

#使用 dir() 函数
#有一个内置函数可以列出模块中的所有函数名（或变量名）。dir() 函数：

#实例
#列出属于 platform 模块的所有已定义名称：

print('(4)------------------完美分割线---------------------')
import platform

x = dir(platform)
print(x)

#注释：dir() 函数可用于所有模块，也可用于您自己创建的模块。

#从模块导入
#您可以使用 from 关键字选择仅从模块导入部件。

#实例
#名为 mymodule 的模块拥有一个函数和一个字典：

print('(5)------------------完美分割线---------------------')
def greeting(name):
  print("Hello, " + name)

person1 = {
  "name": "Bill",
  "age": 63,
  "country": "USA"
}
#实例
#仅从模块导入 person1 字典：

print('(6)------------------完美分割线---------------------')
from mymodule import person1

print (person1["age"])

#提示：在使用 from 关键字导入时，请勿在引用模块中的元素时使用模块名称。示例：person1["age"]，而不是 mymodule.person1["age"]。
