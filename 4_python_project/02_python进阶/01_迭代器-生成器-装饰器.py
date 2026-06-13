#!/usr/bin/python3
# -*- coding:utf-8 -*-
#######################################################
# Author: liangliangSu
# Created Time: 2024-09-08 14:10
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 13_迭代器-生成器-装饰器.py
#######################################################
print('(1)------------------完美分割线------------------')
#一、深入理解迭代器和生成器
#1、什么是迭代？（Iteration）
#刚听到这个名词可能很多小伙伴会问，什么是迭代呢？在编程中，迭代指的是通过重复执行某个操作，不断获取被迭代对象中的数据。这样的每一次操作就是就是一次迭代。
'''简而言之，迭代是遍历的一种形式。例如我们之前所学习的 for 循环，它能不断从地从列表、元组、字符串、集合、字典等容器中取出新元素，每次一个元素直至所有元素被取完。这种 for 循环操作就是迭代。'''
for item in [1, 2, 3, 4, 5]:
    print(item)
# 1
# 2
# 3
# 4
# 5

#2、迭代器（Iterator）
#迭代器是具有迭代功能的对象。我们使用迭代器来进行迭代操作。
#列表、元组、字符串、集合、字典这些容器之所以能被迭代，是因为对它们调用内置函数 iter() 将返回一个迭代器，这个迭代器可被用于迭代操作。
'''iter() 的使用方法：'''
'''迭代器 = iter(容器)'''
numbers = [1, 2, 3, 4, 5]
iterator = iter(numbers)
iterator
#t_iterator object at 0x1074f34a8>
#上面的「list_iterator」便是列表的迭代器。这个迭代器可用于迭代列表中的所有元素。
#要使用迭代器，只需对迭代器调用内置函数 next()，便可逐一获取其中所有的值。
#next() 的使用方法：
'''值 = next(迭代器)'''
#对于上面的列表迭代器，可以像这样使用它：
print('(2)------------------完美分割线------------------')
print('next(iterator)')
# 1
print('next(iterator)')
# 2
print('next(iterator)')
# 3
print('next(iterator)')
# 4
print('next(iterator)')
# 5
#next(iterator)
# Traceback (most recent call last):
#      File “”, line 1, in
# StopIteration
#可以看到，每次调用 next() 将依次返回列表中的一个值。直至所有的值被遍历一遍，此时将抛出 StopIteration 异常以表示迭代终止。

'''（1）for 循环的迭代过程'''
#for 循环的迭代就是通过使用迭代器来完成的。它在背后所做的事情是：
'''1, 对一个容器调用 iter() 函数，获取到该容器的迭代器'''
'''2, 每次循环时对迭代器调用 next() 函数，以获取一个值'''
'''3, 若捕获到 StopIteration 异常则结束循环'''

'''（2）可迭代（Iterable）对象'''
#并不是所有的对象都可以被 iter() 函数使用。比如整数：
#iter(123)
# Traceback (most recent call last):
#      File “”, line 1, in
# TypeError: 'int' object is not iterable
#这里抛出 TypeError 异常，提示 int 对象不是可迭代的。
'''什么是可迭代(的)？'''
#    从表面来看，所有可用于 for 循环的对象是可迭代的，如列表、元组、字符串、集合、字典等容器
#    从深层来看，定义了 __iter__() 方法的类对象就是可迭代的。当这个类对象被 iter() 函数使用时，将返回一个迭代器对象。如果对象具有__iter__() 方法，则可以说它支持迭代协议。
#判断一个已有的对象是否是可迭代的，有两个方法：

'''（3）自定义迭代器'''
#我们可以自己来定义迭代器类，只要在类中定义 __next__() 和 __iter__() 方法即可。如：
class MyIterator:
    def __next__(self):
        代码块
    def __iter__(self):
        return self

#我们来写一个迭代器，这个迭代器从 2^0 开始返回 2 的指数幂，至 2^10 终止。
print('(3)------------------完美分割线------------------')
class PowerOfTwo:
    def __init__(self):
        self.exponent = 0  					# 将每次的指数记录下来
    def __next__(self):
        if self.exponent > 10:
            raise StopIteration
        else:
            result = 2 ** self.exponent		# 以 2 为底数求指数幂
            self.exponent += 1
            return result
    def __iter__(self):
        return self
#每次对迭代器使用内置函数 next() 时， next() 将在背后调用迭代器的 __next__() 方法。所以迭代器的重点便是 __next__() 方法的实现。在这个 __next__() 方法中，我们将求值时的指数记录在对象属性 self.exponent 中，求值结束时指数加 1，为下次求值做准备。
#对于方法 __iter__() 的实现，我们直接返回迭代器对象自身即可。有了这个方法，迭代器对象便是可迭代的，可直接用于 for 循环。
#     扩展：如果对象具有 __iter__() 和 __next__() 方法，则可以说它支持迭代器协议。
#迭代器 PowerOfTwo 使用示例：
#代码语言：javascript
#复制
p = PowerOfTwo()
print(next(p))
#' 1
print(next(p))
# 2
print(next(p))
# 4
print(next(p))
# 8
print(next(p))
# 16
print(next(p))
# 32
print(next(p))
# 64
print(next(p))
# 128
print(next(p))
# 256
print(next(p))
# 512
print(next(p))
# 1024
# >>> next(p)
# Traceback (most recent call last):
#      File “”, line 1, in
#      File “”, line 6, in next
# StopIteration
#这个迭代器当然也可用于 for 循环：
print('(4)------------------完美分割线------------------')
p = PowerOfTwo()
for item in p:
    print(item)
# 1
# 2
# 4
# 8
# 16
# 32
# 64
# 128
# 256
# 512
# 1024

'''（4）迭代器的使用场景(用途)'''
'''1, 一方面，迭代器可以提供迭代功能，当我们需要逐一获取数据集合中的数据时，使用迭代器可以达成这个目的'''
'''2, 另一方面，数据的存储是需要占用内存的，数据量越大所占用的内存就越多。如果我们使用列表这样的结构来保存大批量的数据，并且数据使用频率不高的话，就十分浪费资源了。而迭代器可以不保存数据，它的数据可以在需要时被计算出来（这一特性也叫做惰性计算）。在合适的些场景下使用迭代器可以节省内存资源。'''

'''3、生成器（Generator）'''
#刚才我们自定义了迭代器，其实创建迭代器还有另一种方式，就是使用生成器。
#生成器是一个函数，这个函数的特殊之处在于它的 return 语句被 yield 语句替代。
#如刚才用于生成 2 的指数幂的迭代器，可以通过生成器来实现：
print('(5)------------------完美分割线------------------')
def power_of_two():
	for exponent in range(11):	# range(11) 表示左闭右开区间 [0, 11)，不包含 11
		yield 2 ** exponent		# 以 2 为底数求指数幂
#生成器使用方法：
p = power_of_two()				# 以函数调用的方式创建生成器对象
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
print(next(p))							# 同样使用 next() 来取值)
#生成器的关键在于 yield 语句。yield 语句的作用和 return 语句有几分相似，都可以将结果返回。不同在于，生成器函数执行至 yield 语句，返回结果的同时记录下函数内的状态，下次执行这个生成器函数，将从上次退出的位置（yield 的下一句代码）继续执行。当生成器函数中的所有代码被执行完毕时，自动抛出 StopIteration 异常。
#我们可以看到，生成器的用法和迭代器相似，都使用 next() 来进行迭代。
'''这是因为生成器其实就是创建迭代器的便捷方法，生成器会在背后自动定义 __iter__() 和 __next__() 方法。'''

'''（1）生成器表达式（Generator Expression）'''
#可以用一种非常简便的方式来创建生成器，就是通过生成器表达式。生成器的写法非常简单，但是灵活性也有限，所能表达的内容相对简单。
#生成器表达式的写法如下：
'''生成器 = (针对项的操作 for 项 in 可迭代对象)'''
#如：
print('(6)------------------完美分割线------------------')
letters = (item for item in 'abc')
print(letters)
# <generator object at 0x1074a8228>
print(next(letters))
# 'a'
print(next(letters))
# 'b'
print(next(letters))
# 'c'
letters = (i.upper() * 2 for i in 'abc')
print(next(letters))
# 'AA'
print(next(letters))
# 'BB'
print(next(letters))
# 'CC'

'''二、生成器表达式和列表生成式'''
#1、列表生成式
#如果我们想要构造一个包含指定元素或者具有某种规则的列表，比如 2 的指数幂序列 [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]， 该怎么做？
#     提示：如果不清楚什么是可迭代对象，可以看一下上一篇文章《深入理解迭代器和生成器》。
'''（1）列表生成式的写法'''
#列表生成式的语法如下：
'''[对项的操作 for 项 in 可迭代对象]'''
#这个写法怎么理解呢？
#首先，这句代码的阅读顺序是：for 项 in 可迭代对象 -> 对项的操作。其次，外围的方括号（[]）表明这是列表生成式，最终的结果是一个列表。
#for 项 in 可迭代对象 这部分和 for 循环很相似，通过迭代可迭代对象，每次取出一个项。对于取出的项，我们可以对它做一些处理，也就是表达式中的 对项的操作 部分。最终，可迭代对象中的所有项都会被迭代和处理，并被收集起来形成一个新的列表。
#这个过程用伪代码来描述的话是这样的：
'''
列表 = []
for 项 in 可迭代对象:
	新项 = 对项的操作(项)
    列表.appent(新项)
'''
#来看一个例子：
#这里有个列表：['a', 'b', 'c', 'd', 'e']，怎样把其中的每个小写字母转换为大写？可以这样：
print('(7)------------------完美分割线------------------')
[char.upper() for char in ['a', 'b', 'c', 'd', 'e']]
# ['A', 'B', 'C', 'D', 'E']
#如果你不能一下子理解，不妨比较一下用 for 循环来实现的版本。它们之间是等价的：
chars = []
for char in ['a', 'b', 'c', 'd', 'e']:
    chars.append(char.upper())
print(chars)
# ['A', 'B', 'C', 'D', 'E']
#再来谈谈 [对项的操作 for 项 in 可迭代对象] 中的 对项的操作，这个操作它可以简单，也可以很复杂。
#简单来看，我们可以直接使用 项 本身而不做任何处理。如：
print('(8)------------------完美分割线------------------')
[char for char in 'ABCDEF']
# ['A', 'B', 'C', 'D', 'E', 'F']
#当然如果是要得到这个结果，我们应该直接使用 list('ABCDEF')：
list('ABCDEF')
print(list)
# ['A', 'B', 'C', 'D', 'E', 'F']
#复杂来看，我们可以对 项 进行一系列的处理。如分别将 'abcde' 中每个字母的大写形式和小写形式放到元组中：
print('(9)------------------完美分割线------------------')
[(char.upper(), char) for char in 'abcde']
# [('A', 'a'), ('B', 'b'), ('C', 'c'), ('D', 'd'), ('E', 'e')]
#这里我们将每个 char 转换为了 (char.upper(), char)，并且其中 char 被多次用到。
#上个例子等价于：
result = []
for char in 'abcde':
    result.append((char.upper(), char))
print(result)
# [('A', 'a'), ('B', 'b'), ('C', 'c'), ('D', 'd'), ('E', 'e')]

'''列表生成式中使用 if'''
#在列表生成式的中，每次迭代的 项 是可以被筛选过滤的，使用 if 关键字。如：
'''[对项的操作 for 项 in 可迭代对象 if 对项的判断]'''
#它的阅读顺序是：for 项 in 可迭代对象 -> if 对项的判断 -> 对项的操作。
#每次迭代时所取出的 项，要先经过 对项的判断，如果结果为 True，才会由 对项的操作 处理。如果 对项的判断 的结果为 False，后续 对项的操作 会被跳过，此时最终列表的长度也会减少。
#举个例子，[2 ** i for i in range(1, 11)] 可以生成出 20～210 间的整数，如果我们只想要其中的奇数次方的值，该怎么做？
#这时就可以在列表中使用 if 关键字：
print('(10)------------------完美分割线------------------')
[2 ** i for i in range(1, 11) if i % 2 == 1 ]
# [2, 8, 32, 128, 512]
#这里的阅读顺序是：
#    for e in range(1, 11)
#    if e % 2 == 1
#    2 ** e
#上述代码等价于：
nums = []
for i in range(1, 11):
    if i % 2 == 1:
        nums.append(2 ** i)
print(nums)
# [2, 8, 32, 128, 512]

'''列表生成式中嵌套 for'''
#列表生成式中的 for 中还可以再嵌套 for。如：
'''[对项1和(或)项2的操作 for 项1 in 可迭代对象1 for 项2 in 可迭代对象2]'''
'''
列表 = []
for 项1 in 可迭代对象1:
    for 项2 in 可迭代对象2:
        新项 = 对项1和(或)项2的操作()
        列表.append(新项)
'''
#看起来有点复杂，我们看个例子：
print('(11)------------------完美分割线------------------')
nums = [1, 2, 3]
chars = ['a', 'b', 'c']
[m * n for n in nums for m in chars]
# ['a', 'b', 'c', 'aa', 'bb', 'cc', 'aaa', 'bbb', 'ccc']
#它等价于：
nums = [1, 2, 3]
chars = ['a', 'b', 'c']
result = []
for n in nums:
    for m in chars:
        result.append(m * n)
print(result)
# ['a', 'b', 'c', 'aa', 'bb', 'cc', 'aaa', 'bbb', 'ccc']

#[对项1和(或)项2的操作 for 项1 in 可迭代对象1 for 项2 in 可迭代对象2] 中的 可迭代对象2 可以是 项1 本身。也就是可以写成：
'''[对项和(或)子项的操作 for 项 in 可迭代对象 for 子项 in 项]'''
#例如：
print('(12)------------------完美分割线------------------')
strings = ['aa', 'bb', 'cc']
[char for string in strings for char in string]
# ['a', 'a', 'b', 'b', 'c', 'c']
#它等价于：
strings = ['aa', 'bb', 'cc']
result = []
for string in strings:
    for char in string:
        result.append(char)
print(result)
# ['a', 'a', 'b', 'b', 'c', 'c']

'''2、字典生成式'''
#便捷地构造列表可以使用列表生成式，同样的，想要通过已有的可迭代对象来便捷地构造字典，可以使用字典生成式。
#字典生成式的写法是：
'''{键: 值 for 项 in 可迭代对象}'''
#和列表生成式非常相似，不同之处在于它使用的是花括号（{}），另外还使用 键: 值 形式。
#举个例子，有字符串 'abcde'，以每个小字母作为键，对应大写字母作为值的来构造个字典：
print('(13)------------------完美分割线------------------')
aa = {char: char.upper() for char in 'abcde'}
print(aa)
# >>> {char: char.upper() for char in 'abcde'}
# {'a': 'A', 'b': 'B', 'c': 'C', 'd': 'D', 'e': 'E'}
#同样的，字典生成式中也可以使用 if 和嵌套 for，使用方法参照列表生成式。

'''3、集合生成式'''
#想要通过已有的可迭代对象来构造集合，可以使用集合生成式。
#你可能已经猜到了，只需要将列表生成式的方括号（[]）替换为花括号（{}）即可：
'''{对项的操作 for 项 in 可迭代对象}'''
#例如：
print('(14)------------------完美分割线------------------')
bb = {char.lower() for char in 'ABCDABCD'}
print(bb)
# >>> {char.lower() for char in 'ABCDABCD'}
# {'c', 'a', 'd', 'b'}
#     提示：通过这个例子也能看到集合的重要特性——无序且无重复。
#同样的，集合生成式中也可以使用 if 和嵌套 for。

'''4、生成器表达式'''
#上面有列表生成式、字典生成式、集合生成式，那么是不是也有「元组生成式」？是不是用圆括号来表示就可以了？
#不是的，Python 中并没有「元组生成式」！虽然 Python 中确实有类似的圆括号的写法：
#(对项的操作 for 项 in 可迭代对象)
#但这可不是什么「元组生成式」，而是我们上一章节学习过的生成器表达式。
#生成器表达式是一种创建生成器的便捷方法。虽然写法上和列表生成式、字典生成式、集合生成式相似，却有着本质的不同，因为它创建出来的是生成器，而不是列表、字典、集合这类容器。
'''(char.lower() for char in 'ABCDEF')'''
print('(14)------------------完美分割线------------------')
g = (char.lower() for char in 'ABCDEF')
print(g)
# <generator object at 0x103da6c78>
print(next(g))
# 'a'
print(next(g))
# 'b'
#     提示：如果你对生成器有些遗忘，不妨看下前一篇文章《深入理解迭代器和生成器》。
#生成器表达式中同样可以使用 if 和嵌套 for，使用方法和列表生成式相同。

'''三、给凡人添加超能力：入手装饰器'''
#在学习装饰器前，我们先来了解两个函数概念。
#1、函数中定义函数
#在 Python 中，函数内部是可以嵌套地定义函数的。如：
print('(15)------------------完美分割线------------------')
def print_twice(word):
    def repeat(times):
        return word * times
    print(repeat(2))
print_twice('go ')
# gogo
'''内层函数只能在包裹它的外层函数中使用，而不能在外层函数外使用。比如上面的 repeat() 可以在 print_twice() 中使用，但是不能在 print_twice() 的外部使用。
另外，内层函数中可以使用外层函数的参数或其它变量。如上面的参数 word。'''

'''2、函数返回函数'''
#之前我们学习过，函数可以作为另一个函数的参数。类似的，函数的返回值也可以是一个函数。
#如：
print('(16)------------------完美分割线------------------')
def print_words(word):
    def repeat(times):
        return word * times
    return repeat
f = print_words('go')
print(f)
# <function print_words..repeat at 0x10befe620>
#我们调用 print_words() 并用变量 f 接收其返回值，f 是个函数，是 print_words 下的 repeat 函数。
#既然 f 是个函数，自然可以被调用，这也就相当于调用 repeat()：
print(f(2))
# 'gogo'
#     扩展：我们直接调用 f（也就是 repeat()）时，repeat() 内部会使用变量 word，而这个变量时定义在外层函数 print_words() 中的，却会一直伴随 repeat() 而存在，这在 Python 中叫作闭包。

'''3、什么是装饰器？'''
#好了，回到正题，来看看什么是装饰器。我们在《类进阶》章节中介绍过类方法和静态方法的定义方式，还记得吗?
'''定义它们时需要用到 @classmethod 和 @staticmethod，它们就是装饰器。写法为 @装饰器名称。'''
#装饰器用来增强一个现有函数的功能，并且不改变这个函数的调用方式。这种增强是非侵入式的，也就是说无需直接修改函数内部的代码，而是在函数的外部做文章。
#举个例子，假设我们有这样一个函数：
print('(17)------------------完美分割线------------------')
def say_hello():
    print('Hello!')
say_hello()
# Hello!
#这个函数非常简单，每次调用会输出「Hello!」，假如我们想在每次输出「Hello!」的同时附带上当前的时间，像这样：
say_hello()
# [ 2019-09-14 16:38:10.942802 ]
# Hello!
#如果想具备上面的功能，但又不想修改 say_hello() 函数的内部实现，该怎么做？
#这就是装饰器的典型使用场景了——非侵入的情况下让函数具备更多的功能。
#假设我们已经有了一个能满足该需求的装饰器 @time ，只要像这样来装饰 say_hello() 即可：
#@time
def say_hello():
    print('Hello!')
#函数的调用方式依然不变：
say_hello()
#当然，虽然 Python 中内置有一些装饰器，如 @classmethod、@staticmethod，但并没 @time，所以我们需要自己来定义它。

'''4、自定义装饰器'''
#我们来自定义之前所说的装饰器 @time，要求是使用它可以在函数调用时输出调用时间。
#这里直接给出 @time 的实现：
print('(17)------------------完美分割线------------------')
import datetime    # 日期时间相关库，用于后续获取当前时间
def time(func):
    def wrapper(*args, **kw):
        print('[', datetime.datetime.now(), ']')
        return func(*args, **kw)
    return wrapper
#我们暂且不关注具体的实现细节，先使用一下看看：
@time
def say_hello():
    print('Hello!')
say_hello()
# [ 2019-09-14 16:42:58.409742 ]
# Hello!
#没有问题，效果和预期相同！那这是什么原理呢？

'''（1）装饰器原理'''
#其实，
@time
def say_hello():
    print('Hello!')
#等效于：
def say_hello():
    print('Hello!')
say_hello = time(say_hello)
#也就是说，我们用 @time 装饰 say_hello() 时，Python 会在背后做了这样一个操作（重点）：
#say_hello = time(say_hello)
'''@time**（包括所有装饰器）本质上是个以函数作为参数，并返回函数的函数**。'''
#不妨回过头来观察下 @time 实现:
import datetime    # 日期时间相关库，用于后续获取当前时间  
def time(func):     
    def wrapper(*args, **kw):         
        print('[', datetime.datetime.now(), ']')         
        return func(*args, **kw)     
    return wrapper
#say_hello = time(say_hello) 这句代码将函数 say_hello 作为参数来调用 time()，time() 将其内部定义的函数返回了出来，并替换了函数 say_hello。结合装饰器实现来看， say_hello() 其实变成了 time() 中的 wrapper()。
print('(18)------------------完美分割线------------------')
print(say_hello)
# <function time..wrapper at 0x10befea60>
#那就来具体看下 wrapper()：
def wrapper(*args, **kw):
    print('[', datetime.datetime.now(), ']')
    return func(*args, **kw)
'''wrapper() 其实也非常简单，其内部的 print('[', datetime.datetime.now(), ']') 以 [ 时间 ] 的格式将当前时间输出出来，达成了「输出函数调用时间」的目的。其中 datetime.datetime.now() 用于获取当前的时间。'''
'''最后一句 return func(*args, **kw) 比较关键，这里调用函数 func() 并将其结果返回出去。func() 是什么？它就是 say_hello()。最初 say_hello 作为参数被传入 time() 中，其参数名便是 func。'''
'''参数 *args 和 **kw 是什么？还记得我们在《函数进阶》中的内容吗，*args 可以接收一切非关键字参数，而 **kw 可以接收一切关键字参数，两个结合起来一起使用就可以接收一切参数了。用在这里的作用是，接收调用 say_hello() 时的所有参数，并悉数传给 func()。'''
#稍作梳理我们就能明白，装饰器之所以能够增强一个函数的功能，其实就是将被装饰函数用新函数替换，虽然还是同一个函数名，但函数内部实现已经变了。而这个新函数的内部在添加了一些功能的后，还会调用之前被装饰的函数。这样就相当于对被装饰的函数做了非侵入的扩展。

'''5、functools.wraps 装饰器'''
#当一个函数不被装饰器装饰时，其函数名称就是自己。如：
def say_hello():
  print('Hello!')
print(say_hello)
# <function say_hello at 0x10efbb1e0>
print(say_hello.__name__)
# 'say_hello'
#在解释器中直接输入 say_hello，显示其为 function say_hello。使用 say_hello.__name__，可以直接获取到其函数名称，此处显示为 say_hello。
#如果我们用装饰器 @time 来修饰这个函数，那结果就不同了：
print('(19)------------------完美分割线------------------')
@time
def say_hello():
  print('Hello!')
say_hello
# <function time..wrapper at 0x10efbb048>
print(say_hello.__name__)
# 'wrapper'
#可以看到其名字信息被装饰器中的函数 wrapper 覆盖了。
#是的，由于装饰器本质上是用一个新的函数来替换被装饰的函数，所以函数的元信息会被覆盖。
#那有没有什么方式保留被装饰函数的元信息呢？有的，可以在定义装饰器时使用 @functools.wraps 装饰器。使用如下：
print('(20)------------------完美分割线------------------')
import datetime
import functools
def time(func):
    @functools.wraps(func)
    def wrapper(*args, **kw):
        print('[', datetime.datetime.now(), ']')
        return func(*args, **kw)
    return wrapper
print(say_hello)
# <function say_hello at 0x10ef5c378>
print(say_hello.__name__)
# 'say_hello'
#可以看到使用 @functools.wraps 后，元信息恢复如初，不留痕迹。

'''6、带参数的装饰器'''
#既然装饰器本质上是个函数，那这个函数能不能有参数呢？答案是可以有。
#举个例子，刚才我们输出的时间格式是 [ 2019-09-14 16:42:58.409742 ]，如果我们想要自行指定这个格式，可以考虑用装饰器参数的形式来设置。
#带时间格式的装饰器如下：
import datetime
import functools
def time(format):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kw):
            print(datetime.datetime.now().strftime(format))
            return func(*args, **kw)
        return wrapper
    return decorator
#可以看到，这回装饰器变成了三层函数嵌套的形式。是的，如果需要指定装饰器的参数，那么就需要在原来装饰器的基础上在再加一层函数。
#wrapper() 中原本的 print('[', datetime.datetime.now(), ']') 被修改为 print(datetime.datetime.now().strftime(format))，其中的 format 便是装饰器的参数，也就是时间格式。
#使用时，在装饰器 @time 后添加括号并写上参数：
print('(21)------------------完美分割线------------------')
@time('%Y/%m/%d %H:%M:%S')
def say_hello():
    print('Hello!')
print(say_hello())
# 2019/09/15 10:00:24
# Hello!
#可以看到时间格式已经根据我们的设置而生效。
#     扩展：
#     '%Y/%m/%d %H:%M' 是 datetime 包中用于指定时间格式的字符串，其中：
#    %Y 表示年
#    %m 表示月
#    %d 表示天
#    %H 表示小时
#    %M 表示分钟
#    %S 表示秒。

'''（1）带参数的装饰器原理'''
#带参数的装饰器的实现为什么要三层函数嵌套？看了下面的等效代码你就明白了！
print('(22)------------------完美分割线------------------')
@time('%Y/%m/%d %H:%M:%S')
def say_hello():
    print('Hello!')
say_hello()
print('------------------------------------')
#等效于：
def say_hello():
    print('Hello!')
say_hello = time('%Y/%m/%d %H:%M:%S')(say_hello)
print(say_hello())
#而不带参数的装饰器的等效代码是 say_hello = time(say_hello)。对比可以看出，带参数的装饰器的等效代码多了一次函数调用，通过这种方式将装饰器参数传递到内部的两层函数中，这之后便回到了不带参数的装饰器的情形。
