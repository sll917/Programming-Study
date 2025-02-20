#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-02 10:24
# Email: sll917@outlook.com
# Version: V1.0
# File Name: demofile2.py
#######################################################
#Python 文件处理
#文件处理是任何 Web 应用程序的重要组成部分。
#Python 有几个用于创建、读取、更新和删除文件的函数。
#文件处理
#在 Python 中使用文件的关键函数是 open() 函数。
"""
open() 函数有两个参数：文件名和模式。
有四种打开文件的不同方法（模式）：
    "r" - 读取 - 默认值。打开文件进行读取，如果文件不存在则报错。
    "a" - 追加 - 打开供追加的文件，如果不存在则创建该文件。
    "w" - 写入 - 打开文件进行写入，如果文件不存在则创建该文件。
    "x" - 创建 - 创建指定的文件，如果文件存在则返回错误。
此外，您可以指定文件是应该作为二进制还是文本模式进行处理。
    "t" - 文本 - 默认值。文本模式。
    "b" - 二进制 - 二进制模式（例如图像）。
"""
#语法
#此外，您可以指定文件是应该作为二进制还是文本模式进行处理：
f = open("demofile.txt")
#以上代码等同于：
f = open("demofile.txt", "rt")
#因为 "r" (读取)和 "t" (文本)是默认值，所以不需要指定它们。
#注释：请确保文件存在，否则您将收到错误消息。
#假设我们有以下文件，位于与 Python 相同的文件夹中：
#demofile.txt
#Hello! Welcome to demofile.txt
#This file is for testing purposes.
#Good Luck!
#如需打开文件，请使用内建的 open() 函数。
#open() 函数返回文件对象，此对象有一个 read() 方法用于读取文件的内容：
f = open("demofile.txt", "r")
print(f.read())

#只读取文件的一部分
#默认情况下，read() 方法返回整个文本，但您也可以指定要返回的字符数：
#返回文件中的前五个字符：
f = open("demofile.txt", "r")
print(f.read(5))

'''
Python 文件写入
    Python 文件读取
    Python 文件删除
写入已有文件
如需写入已有的文件，必须向 open() 函数添加参数：

    "a" - 追加 - 会追加到文件的末尾
    "w" - 写入 - 会覆盖任何已有的内容
'''

#打开文件 "demofile2.txt" 并将内容追加到文件中：
f = open("demofile2.txt", "a")
f.write("Now the file has more content!")
f.close()

# 追加后，打开并读取该文件：
f = open("demofile2.txt", "r")
print(f.read())

#打开文件 "demofile3.txt" 并覆盖内容：
f = open("demofile3.txt", "w")
f.write("Woops! I have deleted the content!")
f.close()

# 写入后，打开并读取该文件：
f = open("demofile3.txt", "r")
print(f.read())

#Python 删除文件
#    Python 文件写入/创建
#    NumPy 简介
#删除文件

#如需删除文件，必须导入 OS 模块，并运行其 os.remove() 函数：
#删除文件 "demofile.txt"：
import os
os.remove("demofile.txt")

#检查文件是否存在
#为避免出现错误，您可能需要在尝试删除文件之前检查该文件是否存在：
#检查文件是否存在，然后删除它：

import os
if os.path.exists("demofile.txt"):
  os.remove("demofile.txt")
else:
  print("The file does not exist")

#打开文件 "demofile.txt" 并覆盖内容：
f = open("demofile.txt", "w")
f.write("Woops! I have deleted the content!")
f.close()

#删除文件
#如需删除整个文件夹，请使用 os.rmdir() 方法：
#删除文件夹 "myfolder"：

import os
os.mkdir("myfolder")
os.rmdir("myfolder")
#提示：您只能删除空文件夹。

