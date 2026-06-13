#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-03 19:09
# Email: sll917@outlook.com
# Version: V1.0
# File Name: demo6_迭代器.py
#######################################################
print('(1)------------------完美分割线---------------------')
#Python 迭代器
#迭代器是一种对象，该对象包含值的可计数数字。
#迭代器是可迭代的对象，这意味着您可以遍历所有值。
#从技术上讲，在 Python 中，迭代器是实现迭代器协议的对象，它包含方法 __iter__() 和 __next__()。

# 1-迭代器 VS 可迭代对象（Iterable）
#列表、元组、字典和集合都是可迭代的对象。它们是可迭代的容器，您可以从中获取迭代器（Iterator）。
#所有这些对象都有用于获取迭代器的 iter() 方法：

#实例
#从元组返回一个迭代器，并打印每个值：

mytuple = ("apple", "banana", "cherry")
myit = iter(mytuple)
print(type(myit))

print(next(myit))
print(next(myit))
print(next(myit))

#甚至连字符串都是可迭代的对象，并且可以返回迭代器：

print('(2)------------------完美分割线---------------------')
#实例
#字符串也是可迭代的对象，包含一系列字符：

mystr = "banana"
myit = iter(mystr)
print(type(myit))

print(next(myit))
print(next(myit))
print(next(myit))
print(next(myit))
print(next(myit))
print(next(myit))

# 2-遍历迭代器
#我们也可以使用 for 循环遍历可迭代对象：

#实例
#迭代元组的值：

print('(3)------------------完美分割线---------------------')
mytuple = ("apple", "banana", "cherry")

for x in mytuple:
  print(x)

#实例
#迭代字符串中的字符：

mystr = "banana"

for x in mystr:
  print(x)

#提示：for 循环实际上创建了一个迭代器对象，并为每个循环执行 next() 方法。

# 3-创建迭代器
#要把对象/类创建为迭代器，必须为对象实现 __iter__() 和 __next__() 方法。
#正如您在 Python 类/对象 一章中学到的，所有类都有名为 __init__() 的函数，它允许您在创建对象时进行一些初始化。
#__iter__() 方法的作用相似，您可以执行操作（初始化等），但必须始终返回迭代器对象本身。
#__next__() 方法也允许您执行操作，并且必须返回序列中的下一个项目。

#实例
#创建一个返回数字的迭代器，从 1 开始，每个序列将增加 1（返回 1、2、3、4、5 等）：

print('(4)------------------完美分割线---------------------')
class MyNumbers:
  def __iter__(self):
    self.a = 1
    return self

  def __next__(self):
    x = self.a
    self.a += 1
    return x

myclass = MyNumbers()
myiter = iter(myclass)

print(next(myiter))
print(next(myiter))
print(next(myiter))
print(next(myiter))
print(next(myiter))

#StopIteration
#如果你有足够的 next() 语句，或者在 for 循环中使用，则上面的例子将永远进行下去。
#为了防止迭代永远进行，我们可以使用 StopIteration 语句。
#在 __next__() 方法中，如果迭代完成指定的次数，我们可以添加一个终止条件来引发错误：

#实例
#在 20 个迭代之后停止：

print('(5)------------------完美分割线---------------------')
class MyNumbers:
  def __iter__(self):
    self.a = 1
    return self

  def __next__(self):
    if self.a <= 20:
      x = self.a
      self.a += 1
      return x
    else:
      raise StopIteration

myclass = MyNumbers()
myiter = iter(myclass)

for x in myiter:
  print(x)
