#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-04-07 15:47
# * Filename : 16玩转shell三剑客.sh
# **********************************************************
: '
								前 言
shell三剑客是grep、sed和awk三个工具的简称,因功能强大，使用方便且使用频率高，因此被戏称为三剑客，熟练使用这三个工具可以极大地提升运维效率。

三剑客的特点:
命令	特点				使用场景
grep	擅长查找过滤		快速查找过滤
sed		擅长取行和替换		需要快速进行替换/修改文件内容
awk		擅长取列、统计计算	文件取列、数据切片、对比/比较和统计

							三剑客之—grep
grep是文本查找或搜索工具,用于查找内容包含指定的范本样式的文本。它会一行一行循环匹配，匹配到相应的值时会先输出，然后换行继续匹配再换行直到所有的内容都匹配完。
1. 常用参数

    -n：显示行号；
    -i：忽略大小写；
    -o：精准匹配；
    -f：从文件每一行获取匹配模式；
    - c：统计匹配的行数；
    -E：使用扩展正则表达式，相当于egrep；
    -v：反转查找，即输出与查找条件不相符合的行；
    -A：后面可加数字，为 after 的意思，除了列出该行外，后续的 n 行也列出来；
    -B：后面可加数字，为 before 的意思，除了列出该行外，前面的 n 行也列出来；
    -C：后面可加数字，为context 的意思，除了列出该行外，前后的n行也列出来。
'
#2. 示例
#1）查找多个文件中相同的内容
echo '(1)-----------------------完美分割线--------------------------------'
grep "day" test1 test2

#2）输出在test2文件中和在test1文件相同的行
echo '(2)-----------------------完美分割线--------------------------------'
grep -n -f test1 test2

#:3）输出test2文件中和在test1文件不同的行
echo '(3)-----------------------完美分割线--------------------------------'
grep -v -f test1 test2

#4）输出正则匹配到的内容
echo '(4)-----------------------完美分割线--------------------------------'
echo 'this is a test shell!' |grep -oE "[a-z]+"

#5）只显示匹配的字符串
echo '(5)-----------------------完美分割线--------------------------------'
echo 'this is a test' |grep -o 'is'

#6）匹配显示所有IP
echo '(6)-----------------------完美分割线--------------------------------'
ifconfig |grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
echo '(7)-----------------------完美分割线--------------------------------'
ifconfig |grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}"

: '
							三剑客之—sed
sed是一种流编辑器，是非常好用的文本处理工具，配合正则使用更加强大。处理时，把当前处理的行存储在临时的缓冲区中，称为“模式空间”，接着sed命令处理缓冲区的内容，完成后输出到屏幕，接着处理下一行。文件内容没有改变，除非使用-i选项。
sed主要用来编辑一个或多个文件，简化对文件的反复操作或者用来编写转换程序等。
还有一个空间叫保持空间，又称暂存空间，可以暂时存放一些处理的数据，但不能直接输出，只能放到模式空间输出。
1. 语法—sed [选项] [地址] [命令] file

1）选项描述

    -n：不打印模式空间；
     -e：执行脚本、表达式来处理；
     -f：执行动作从文件读取执行；
     -i：修改原文件；
     -r：使用扩展正则表达式。

2）地址描述

    first~step：步长，每step行，从第first开始；

    $：匹配最后一行；

    /regexp/：正则表达式匹配行；

    number：只匹配指定行；

    addr1,addr2：开始匹配addr1行开始，直接addr2行结束；

    addr1,+N：从addr1行开始，向后的N行；

    addr1,~N：从addr1行开始，到N行结束。

3）地址描述

    s/regexp/replacement/：替换字符串；

    p：打印当前模式空间；

    P：打印模式空间的第一行；

    d：删除模式空间，开始下一个循环；

    D：删除模式空间的第一行，开始下一个循环；

    =：打印当前行号；

    a：当前行下面追加文本；

    i：当前行上面插入文本；

    c：所选行替换新文本；

    q：立即退出sed脚本；

    r：追加文本来自文件；

    : label：label为b和t命令；

    b label：分支到脚本中带有标签的位置，如果分支不存在则分支到脚本的末尾；

    t label：如果s///是一个成功的替换，才跳转到标签；

    h H：复制/追加模式空间到保持空间；

    g G：复制/追加保持空间到模式空间；

    x：交换模式空间和保持空间内容；

    y：把一个字符翻译为另外的字符；

    l：打印模式空间的行，并显示控制字符$；

    n N：读取/追加下一行输入到模式空间；

    w filename：写入当前模式空间到文件；

    !：取反、否定；

    &：引用已匹配字符串。
'
#2. 示例
#1）从第一个空格开始全局替换成-
echo "hello world" | sed 's/ /-/g'

#2）匹配替换字符串
echo "hello world" | sed 's/world/[&]/'

#3）打印指定行的内容
sed -e '2,5p' test1

#4）读取一个文件的内容到另一个文件的匹配位置显示
sed '/he/r test2' test1

#5）匹配一个文件的内容写入到另一个文件
sed '/we/w test3' test1

#6）在匹配行后追加插入内容
sed '/^to/adyz' test1

#7）读取一个文件的内容写入到另一个文件的匹配位置
sed -i '/he/r test2' test1

#8）用s///直接替换字符串
sed 's/century/CENTURY/' test1

#9）分别用first~step语法和命令n语法打印奇数行
sed -n '1~2p' test1

sed -n 'p;n' test1

#10）分别用first~step语法和命令n语法打印偶数行
sed -n '2~2p' test1

sed -n 'n;p' test1

: '	
三剑客之—awk
awk是一个处理文本的编程语言工具，能用简短的程序处理标准输入或文件、数据排序、计算以及生成报表等等。
在Linux系统下默认awk是gawk，它是awk的GNU版本。可以通过命令查看应用的版本：ls -l /bin/awk
基本的命令语法：awk option 'pattern {action}' file

    其中pattern表示AWK在数据中查找的内容，而action是在找到匹配内容时所执行的一系列命令。花括号用于根据特定的模式对一系列指令进行分组。

awk处理的工作方式与数据库类似，支持对记录和字段处理，这也是grep和sed不能实现的。
在awk中，缺省的情况下将文本文件中的一行视为一个记录，逐行放到内存中处理，而将一行中的某一部分作为记录中的一个字段。用1,2,3...数字的方式顺序的表示行（记录）中的不同字段。用$后跟数字，引用对应的字段，以逗号分隔，0表示整个行。

1. 选项

    -f program-file：从文件中读取awk程序源文件；

    -F fs：指定fs为输入字段分隔符；

    -v var=value：变量赋值；

    --posix：兼容POSIX正则表达式；

    --dump-variables=[file]：把awk命令时的全局变量写入文件，默认文件是awkvars.out；

    --profile=[file]：格式化awk语句到文件，默认是awkprof.out。

2. 常用模式

Pattern
	
Description

BEGIN{ }
	

给程序赋予初始状态，先执行的工作

END{ }
	

程序结束之后执行的一些扫尾工作

/regular expression/
	

为每个输入记录匹配正则表达式

pattern && pattern
	

逻辑and，满足两个模式

pattern || pattern
	

逻辑or，满足其中一个模式

! pattern
	

逻辑not，不满足模式

pattern1, pattern2
	

范围模式，匹配所有模式1的记录，直到匹配到模式2

#示例:
1）从文件读取awk程序处理文件

# vim test.awk
{print $2}
# tail -n3 /etc/services |awk -f test.awk


2）指定分隔符，打印指定字段，默认以空格分隔

# tail -n3 /etc/services |awk '{print $2}'


3）指定冒号为分隔符打印

# tail -n5 /etc/passwd | awk -F ':' '{print $1}'


3. BEGIN和END
3.1 语法结构
awk 'BEGIN{ print "start" } pattern{ commands } END { print "end" }' filename，由BEGIN语句+模式匹配+END语句三个部分组成，这三个部分都是可选项。

3.2 工作原理

    第一步执行BEGIN语句；
#    第二步从文件或标准输入读取一行，然后再执行行pattern语句，逐行扫描文件到文件全部被读取；
#    第三步执行END语句。
#
#示例：
#1）通过print参数打印
#
## echo  "hello" | awk 'BEGIN{ print "welcome" } {print} END{ print "this is a test of awk"}'
#
#
#2）初始化标题打印
#
## tail /etc/services |awk 'BEGIN{print "Service\t\tPort\t\t\tDescription\n"}{print $0}'
#
#
#3）使用print逗号分隔时，打印则是以空格分界
#
## echo | awk '{ a="This is"; b="a test"; c="of awk";print a,b,c}'
#
#
#
#4. 内置变量
#
#变量名
#	
#
#描述
#
#$0
#	
#
#当前记录
#
#$1~$n
#	
#
#当前记录的第N个字段
#
#FS
#	
#
#输入字段分隔符（-F作用相同）默认空格
#
#OFS
#	
#
#输出字段分隔符，默认是空格
#
#RS
#	
#
#输入记录分隔符，默认换行符\n
#
#ORS
#	
#
#输出记录分隔符，默认是换行符\n
#
#NF
#	
#
#字段个数/列个数
#
#NR
#	
#
#统计记录编号，每处理一行记录，编号就会+1
#
#FNR
#	
#
#统计记录编号，每处理一行记录，编号也会+1，与NR不同的是，处理第二个文件时，编号会重新计数
#
#OFS
#	
#
#输出字段分隔符，默认空格
#
#IGNORECASE
#	
#
#忽略大小写
#
#
#示例：
#1）FS
#创建带空格的测试文件，查看前赋值FS变量，改变默认分空隔符为冒号。
#
## cat test.awk
#
## awk 'BEGIN{FS=":"}{print $1,$2,$3}'test.awk
#
#
#2）OFS,OFS可以理解为FS的逆向过程，即将输出字段的分隔符改为空格
#创建带：的测试文件，查看前赋值OFS变量，改变默认：隔符为空格。
#
## cat test.awk
#
## awk 'BEGIN{OFS=":"}{print $1,$2,$3}'test.awk
#
#
#3）RS，匹配分隔符号，默认以\n分隔每行
#将/替换为换行（\n）输出：
#
## echo "RS/test/of/awk " | awk 'BEGIN{RS="/"}{print $0}'
#
#
#4）ORS，匹配每个记录的换行符（\n）,替换为指定的符号
#
#将换行（\n）替换为+：
#
## seq 10 | awk 'BEGIN{ORS="+"}{print $0} END{print "\n"}'
#
#
#5）NF，字段个数/列个数
#
#打印字段个数：
#
## echo "a b c d e f" |awk '{print NF}'
#
#
#打印最后一个字段：
#
## echo "a b c d e f" |awk '{print $NF}'
#
#
#
#打印倒数第二个字段：
#
## echo "a b c d e f" |awk '{print $(NF-1)}'
#
#
#排除最后两个字段：
#
## echo "a b c d e f" |awk '{$NF="";$(NF-1)="";print $0}'
#
#
#排除第一个字段：
#
## echo "a b c d e f" |awk '{$1="";print $0}'
#
#
#5. 运算符
#
#运算符
#	
#
#描述
#
#（....）
#	
#
#分组
#
#$
#	
#
#字段引用
#
#++ --
#	
#
#递增和递减
#
#+ - !
#	
#
#加号，减号，和逻辑否定
#
#* / %
#	
#
#乘，除和取余
#
#+ -
#	
#
#加法，减法
#
#| |&
#	
#
#管道，用于getline，print和printf
#
#< > <= >= != ==
#	
#
#关系运算符
#
#~ !~
#	
#
#正则表达式匹配，否定正则表达式匹配
#
#in
#	
#
#数组成员
#
#&& ||
#	
#
#逻辑and，逻辑or
#
#?:
#	
#
#简写条件表达式：
#
#expr1 ? expr2 : expr3
#
#第一个表达式为真，执行expr2，否则执行expr3
#= += -= *= /= %= ^=
#	
#
#变量赋值运算符
#
#示例:
#1）求和
#
## awk 'BEGIN{a=2;b=3; print a+b }'
#
#
#2）感叹号 否定匹配
#
## tail /etc/services |awk '!/blp5/{print $0}'
#
#
#3）求余，打印偶数行
#
## seq 5 |awk '$0%2==0{print $0}'
#
#
#打印奇数行。
#
## seq 5 |awk '$0%2!=0{print $0}'
#
#
#4）正则表达式匹配
#
## seq 5 |awk '$0~/[34]/{print $0}'
#
#
#
## seq 5 |awk '$0!~/[34]/{print $0}'
#
#
#
## seq 5 |awk '$0~/[^34]/{print $0}'
#
#
#5）?: 条件表达式，也叫三目运算
#
## awk 'BEGIN{print 1==1?"yes":"no"}'
#
#
#
## awk 'BEGIN{print 1==2?"yes":"no"}'
#
#
#6）变量赋值
#
## seq 5 |awk '{sum+=$0}END{print sum}'
#
#
#6. 流程控制
#1）if语句  
#格式：if (condition) statement [ else statement ]
#
## seq 5 |awk '{if($0==3)print $0}'
#
#
#
## seq 5 |awk '{if($0==3)print $0;else print "no"}'
#
#
#2）while语句 
#格式：while (condition) statement
#遍历打印所有字段。
#
## awk '{i=1;while(i<=NF){print $i;i++}}' file
#
#
#3）for语句 
#格式：for (expr1; expr2; expr3) statement
#遍历打印所有字段。
#
## awk '{for(i=1;i<=NF;i++)print $i}' file
#
#
#4）break和continue语句
#break跳过所有循环，continue跳过当前循环。
#
## awk 'BEGIN{for(i=1;i<=5;i++){if(i==3){break};print i}}'
#
#
#
## awk 'BEGIN{for(i=1;i<=5;i++){if(i==3){continue};print i}}'
#
#
#
#
#
#
#END
#
