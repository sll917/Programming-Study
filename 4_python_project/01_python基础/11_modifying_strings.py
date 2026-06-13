#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-09-28 22:45
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 11_modifying_strings.py
#######################################################
print('(1)------------------完美分割线------------------')
#5.2 搜索和替换
#另一个常见任务是找到模式的所有匹配项，并用不同的字符串替换它们。sub() 方法接受一个替换值，可以
#是字符串或函数，也可以是要处理的字符串。
""".sub(replacement, string[, count=0 ])"""
#返回通过替换 replacement 替换 string 中正则的最左边非重叠出现而获得的字符串。如果未找到模式，则
#string 将保持不变。
#可选参数 count 是要替换的模式最大的出现次数；count 必须是非负整数。默认值 0 表示替换所有。
#这是一个使用 sub() 方法的简单示例。它用 colour 这个词取代颜色名称:
p = re.compile('(blue|white|red)')
q = p.sub('colour', 'blue socks and red shoes')
print(q)
#'colour socks and colour shoes'
q = p.sub('colour', 'blue socks and red shoes', count=1)
print(q)
#'colour socks and red shoes'

#subn() 方法完成相同的工作，但返回一个包含新字符串值和已执行的替换次数的 2 元组:
p = re.compile('(blue|white|red)')
q = p.subn('colour', 'blue socks and red shoes')
print(q)
#('colour socks and colour shoes', 2)
q = p.subn('colour', 'no colours at all')
print(q)
#('no colours at all', 0)
#仅当空匹配与前一个空匹配不相邻时，才会替换空匹配。:
p = re.compile('x*')
q = p.sub('-', 'abxd')
print(q)
#'-a-b--d-'
#如果 replacement 是一个字符串，则处理其中的任何反斜杠转义。也就是说，\n 被转换为单个换行符，\r 被
#转换为回车符，依此类推。诸如 \& 之类的未知转义是孤立的。后向引用，例如 \6，被替换为正则中相应组
#匹配的子字符串。这使你可以在生成的替换字符串中合并原始文本的部分内容。
#这个例子匹配单词 section 后跟一个用 {，} 括起来的字符串，并将 section 改为 subsection
p = re.compile('section{ ( [^}]* ) }', re.VERBOSE)
q = p.sub(r'subsection{\1}','section{First} section{second}')
print(q)
#'subsection{First} subsection{second}'
#还有一种语法用于引用由 (?P<name>...) 语法定义的命名组。\g<name> 将使用名为 name 的组匹配的
#子字符串，\g<number> 使用相应的组号。因此 \g<2> 等同于 \2，但在诸如 \g<2>0 之类的替换字符串中
#并不模糊。(\20 将被解释为对组 20 的引用，而不是对组 2 的引用，后跟字面字符 '0'。) 以下替换都是等
#效的，但使用所有三种变体替换字符串。:
p = re.compile('section{ (?P<name> [^}]* ) }', re.VERBOSE)
p.sub(r'subsection{\1}','section{First}')
'subsection{First}'
p.sub(r'subsection{\g<1>}','section{First}')
'subsection{First}'
p.sub(r'subsection{\g<name>}','section{First}')
'subsection{First}'
#replacement 也可以是一个函数，它可以为你提供更多控制。如果 replacement 是一个函数，则为 pattern 的每次
#非重叠出现将调用该函数。在每次调用时，函数都会传递一个匹配的 匹配对象参数，并可以使用此信息计算
#所需的替换字符串并将其返回。
#在以下示例中，替换函数将小数转换为十六进制:
#def hexrepl(match):
#"Return the hex string for a decimal number"
#value = int(match.group())
#return hex(value)
#p = re.compile(r'\d+')
#p.sub(hexrepl, 'Call 65490 for printing, 49152 for user code.')
#'Call 0xffd2 for printing, 0xc000 for user code.'
#使用模块级别 re.sub() 函数时，模式作为第一个参数传递。模式可以是对象或字符串；如果需要指定
#正则表达式标志，则必须使用模式对象作为第一个参数，或者在模式字符串中使用嵌入式修饰符，例如:
#sub("(?i)b+", "x", "bbbb BBBB") 返回 'x x'。
