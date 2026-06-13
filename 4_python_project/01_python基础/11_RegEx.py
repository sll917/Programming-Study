#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-08-04 00:02
# Email: sll917@outlook.com
# Version: V1.0
# File Name: demo11_RegEx.py
#######################################################
#RegEx 或正则表达式是形成搜索模式的字符序列。
#RegEx 可用于检查字符串是否包含指定的搜索模式。

#RegEx 模块
#Python 提供名为 re 的内置包，可用于处理正则表达式。

#导入 re 模块：
#import re
#Python 中的 RegEx
#导入 re 模块后，就可以开始使用正则表达式了：

#实例
print('(1)检索字符串以查看它是否以 "China" 开头并以 "country" 结尾：')
import re
txt = "China is a great country"
x = re.search("^China.*country$", txt)
print(x)
if (x):
  print("YES! We have a match!")
else:
  print("No match")

"""
1, RegEx 函数
re模块提供了一组函数，允许我们检索字符串以进行匹配：

函数	    描述
findall	    返回包含所有匹配项的列表
search	    如果字符串中的任意位置存在匹配，则返回 Match 对象
split	    返回在每次匹配时拆分字符串的列表
sub	        用字符串替换一个或多个匹配项

2, 元字符
元字符是具有特殊含义的字符：

字符	描述	                                示例	   
[]	    一组字符	                            "[a-m]"	  
\	    示意特殊序列（也可用于转义特殊字符）    "\d"
.	    任何字符（换行符除外）	                "he..o"
^	    起始于	                                "^hello"
$	    结束于	                                "world$"	
*	    零次或多次出现	                        "aix*"	
+	    一次或多次出现	                        "aix+"	
{}	    确切地指定的出现次数	                "al{2}"	
|	    两者任一	                            "falls|stays"	
()	    捕获和分组

3, 特殊序列
特殊序列指的是 \ 后跟下表中的某个字符，拥有特殊含义：

字符	描述	                                                示例	
\A	    如果指定的字符位于字符串的开头，则返回匹配项	        "\AThe"	
\b  	返回指定字符位于单词的开头或末尾的匹配项	            r"\bain" r"ain\b"	
\B	    返回指定字符存在的匹配项，但不在单词的开头（或结尾处）	r"\Bain" r"ain\B"	
\d	    返回字符串包含数字的匹配项（数字 0-9）	                "\d"	
\D	    返回字符串不包含数字的匹配项	                        "\D"	
\s	    返回字符串包含空白字符的匹配项	"\s"	试一试
\S	    返回字符串不包含空白字符的匹配项	"\S"	试一试
\w	    返回一个匹配项，其中字符串包含任何单词字符
（从 a 到 Z 的字符，从 0 到 9 的数字和下划线 _ 字符）	        "\w"
\W	    返回一个匹配项，其中字符串不包含任何单词字符	        "\W"
\Z	    如果指定的字符位于字符串的末尾，则返回匹配项        	"Spain\Z"	

4, 集合（Set）
集合（Set）是一对方括号 [] 内的一组字符，具有特殊含义：

集合	    描述	                                            
[arn]	    返回一个匹配项，其中存在指定字符（a，r 或 n）之一	
[a-n]	    返回字母顺序 a 和 n 之间的任意小写字符匹配项	
[^arn]	    返回除 a、r 和 n 之外的任意字符的匹配项	
[0123]	    返回存在任何指定数字（0、1、2 或 3）的匹配项	
[0-9]	    返回 0 与 9 之间任意数字的匹配	
[0-5][0-9]	返回介于 0 到 9 之间的任何数字的匹配项	
[a-zA-Z]	返回字母顺序 a 和 z 之间的任何字符的匹配，小写或大写	
[+]	        在集合中，+、*、.、|、()、$、{} 没有特殊含义，因此 [+] 表示：返回字符串中任何 + 字符的匹配项
"""

#findall() 函数
#findall() 函数返回包含所有匹配项的列表。
#实例
print('(2)***打印所有匹配的列表***')
import re
str = "China is a great country"
x = re.findall("a", str)
print(x)

#这个列表以被找到的顺序包含匹配项。
#如果未找到匹配项，则返回空列表：
#实例
print('(3)*** 如果未找到匹配，则返回空列表：***')
import re
str = "China is a great country"
x = re.findall("USA", str)
print(x)

#search() 函数
#search() 函数搜索字符串中的匹配项，如果存在匹配则返回 Match 对象。
#如果有多个匹配，则仅返回首个匹配项：
#实例
#在字符串中搜索第一个空白字符：

print('(4)*** 如果存在匹配则返回 Match 对象 ***')
import re
str = "China is a great country"
x = re.search("\s", str)
print("The first white-space character is located in position:", x.start())
print(x)
#如果未找到匹配，则返回值 None：
#实例
#进行不返回匹配的检索：

print('(5)***如果未找到匹配，则返回值 None：***')
import re
str = "China is a great country"
x = re.search("USA", str)
print(x)

#split() 函数
#split() 函数返回一个列表，其中字符串在每次匹配时被拆分：
#实例

print('(6)*** 每个空白字符处进行拆分：***')
import re
str = "China is a great country"
x = re.split("\s", str)
print(x)

#您可以通过指定 maxsplit 参数来控制出现次数：
#实例
#仅在首次出现时拆分字符串：
print('(6)***仅在首次出现时拆分字符串：***')
import re
str = "China is a great country"
x = re.split("\s", str, 1)
print(x)

#sub() 函数
#sub() 函数把匹配替换为您选择的文本：
#实例
#用数字 9 替换每个空白字符：

print('(7)*** ***')
import re
str = "China is a great country"
x = re.sub("\s", "_", str)
print(x)

#您可以通过指定 count 参数来控制替换次数：
#实例
#替换前两次出现：
print('(8)***替换前两次出现：***')
import re
str = "China is a great country"
x = re.sub("\s", "_", str, 2)
print(x)

#Match 对象
#Match 对象是包含有关搜索和结果信息的对象。
#注释：如果没有匹配，则返回值 None，而不是 Match 对象。

#实例
#执行会返回 Match 对象的搜索：
print('(9)***执行会返回 Match 对象的搜索：***')
import re
str = "China is a great country"
x = re.search("a", str)
print(x) # 将打印一个对象
print('(10)***执行会返回 Match 对象的搜索：***')
y = re.search("z", str)
print(y) # 将打印一个对象

"""
Match 对象提供了用于取回有关搜索及结果信息的属性和方法：
span() 返回的元组包含了匹配的开始和结束位置
.string 返回传入函数的字符串
group() 返回匹配的字符串部分
"""

#实例
#打印首个匹配出现的位置（开始和结束位置）。
#正则表达式查找以大写 "C" 开头的任何单词：

print('(11-1)***正则表达式查找以大写 "C" 开头的任何单词：***')
import re
str = "China is a great country"
x = re.search(r"\bC\w+", str)
print(x.span())
print(x)
print('(11-2)***正则表达式查找以大写 "C" 开头的任何单词：***')
import re
str = "China is a great country Call me"
x = re.search(r"\bC\w+", str)
print(x.span())
print(x)

#实例
#打印传入函数的字符串：
print('(12-1)***打印传入函数的字符串：***')
import re
str = "China is a great country"
x = re.search(r"\bC\w+", str)
print(x.string)

#实例
#打印匹配的字符串部分。
print('(13)***打印匹配的字符串部分***')
import re
str = "China is a great country"
x = re.search(r"\bC\w+", str)
print(x.group())
print('(14)***打印匹配的字符串部分***')
str = "China is a great country Call me"
x = re.search(r"\bC\w+", str)
print(x.group())
#注释：如果没有匹配项，则返回值 None，而不是 Match 对象。

#元字符
#元字符是具有特殊含义的字符：以下是元字符举例:
print('(15)*** 一组字符***')
import re
str = "The rain in Spain"
#Find all lower case characters alphabetically between "a" and "m":
x = re.findall("[a-m]", str)
print(x)

print('(16)*** 示意特殊序列（也可用于转义特殊字符）***')
str = "That will be 59 dollars"
#Find all digit characters:
x = re.findall("\d", str)
print(x)

print('(17)*** 任何字符（换行符除外）***')
str = "hello world"
#Search for a sequence that starts with "he", followed by two (any) characters, and an "o":
x = re.findall("he..o", str)
print(x)

print('(18)*** 起始于&结束于***')
str = "hello world"
#Check if the string starts with 'hello':
x = re.findall("^hello", str)
if (x):
  print("Yes, the string starts with 'hello'")
else:
  print("No match")

#Check if the string ends with 'world':
x = re.findall("world$", str)
if (x):
  print("Yes, the string ends with 'world'")
else:
  print("No match")


print('(19)***零次或多次出现 ***')
str = "The rain in Spain falls mainly in the plain!"

#Check if the string contains "ai" followed by 0 or more "x" characters:
x = re.findall("aix*", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(20)***一次或多次出现 ***')
#Check if the string contains "ai" followed by 1 or more "x" characters:
x = re.findall("aix+", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")


print('(21)***确切地指定的出现次数 ***')
#Check if the string contains "a" followed by exactly two "l" characters:
x = re.findall("al{2}", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")
x = re.findall("al{0,2}", str)
print(x)

print('(22)***两者任一 ***')
#Check if the string contains either "falls" or "stays":
x = re.findall("falls|stays", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")


#特殊序列
#特殊序列指的是 \ 后跟下表中的某个字符，拥有特殊含义：
print('(23)*** 如果指定的字符位于字符串的开头，则返回匹配项***')
str = "The rain in Spain"
#Check if the string starts with "The":
x = re.findall("\AThe", str)
print(x)
if (x):
  print("Yes, there is a match!")
else:
  print("No match")

print('(24)*** 如果指定的字符位于字符串的开头，则返回匹配项***')
x = re.findall("\Arain", str)
print(x)
if (x):
  print("Yes, there is a match!")
else:
  print("No match")

print('(25)*** 返回指定字符位于单词的开头或末尾的匹配项***')
  #Check if "ain" is present at the beginning of a WORD:
x = re.findall(r"\bain", str)
print(x)
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(26)*** 返回指定字符位于单词的开头或末尾的匹配项***')
  #Check if "ain" is present at the beginning of a WORD:
x = re.findall(r"ain\b", str)
print(x)
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")


print('(27)*** 返回指定字符存在的匹配项，但不在单词的开头（或结尾处）***')
#Check if "ain" is present, but NOT at the beginning of a word:
x = re.findall(r"\Bain", str)
print(x) #不在单词的开头 pass
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(28)*** 返回指定字符存在的匹配项，但不在单词的开头（或结尾处）***')
#Check if "ain" is present, but NOT at the end of a word:
x = re.findall(r"ain\B", str)
print(x) #在单词的结尾 false
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(29)***返回字符串包含数字的匹配项（数字 0-9）***')
#Check if the string contains any digits (numbers from 0-9):
x = re.findall("\d", str)
print(x)
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(30)***返回字符串包含数字的匹配项（数字 0-9）***')
str = "The rain in 666 Spain"
x = re.findall("\d", str)
print(x)
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(31)***返回字符串不包含数字的匹配项***')
  #Return a match at every no-digit character:
x = re.findall("\D", str)
print(x)
if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(32)***返回字符串包含空白字符的匹配项***')
str = "The rain in Spain"
#Return a match at every white-space character:
x = re.findall("\s", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(32)***返回字符串包不含空白字符的匹配项***')
#Return a match at every NON white-space character:
x = re.findall("\S", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(33)*** 返回一个匹配项，其中字符串包含任何单词字符（从 a 到 Z 的字符，从 0 到 9 的数字和下划线 _ 字符）***')
#Return a match at every word character (characters from a to Z, digits from 0-9, and the underscore _ character):
x = re.findall("\w", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(34)***返回一个匹配项，其中字符串不包含任何单词字符***')
str = "The rain in Spain "
#Return a match at every NON word character (characters NOT between a and Z. Like "!", "?" white-space etc.):
x = re.findall("\W", str)
print(x)

if (x):
  print("Yes, there is at least one match!")
else:
  print("No match")

print('(34)***返如果指定的字符位于字符串的末尾，则返回匹配项***')
str = "The rain in Spain"
#Check if the string ends with "Spain":
x = re.findall("Spain\Z", str)
print(x)

if (x):
  print("Yes, there is a match!")
else:
  print("No match")

