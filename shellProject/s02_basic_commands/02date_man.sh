#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-04 09:28
# * Filename : print_time.sh
# **********************************************************
: <<!
用法：date [选项]... [+格式]
　或：date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
以给定<格式>字符串的形式显示当前时间，或者设置系统日期。

必选参数对长短选项同时适用。
  -d, --date=字符串          显示给定<字符串>描述的时间，而非“当前时间”
      --debug                对解析的日期添加注释，
                              对不规范的使用方式进行警告，并输出警告信息到
                              标准错误
  -f, --file=日期文件        类似 --date；使用给定<日期文件>，一次处理一行
  -I[FMT], --iso-8601[=FMT]  以 ISO 8601 格式输出日期/时间。
                               FMT='date' 时只输出日期（默认行为），
                               当其为 'hours'、'minutes'、'seconds' 或 'ns' 时
                               则按照所指示的精确度显示日期和时间。
                               示例：2006-08-14T02:34:56-06:00
  -R, --rfc-email            以 RFC 5322 格式输出日期和时间。
                               例如：Mon, 14 Aug 2006 02:34:56 -0600
      --rfc-3339=格式        以 RFC 3339 格式输出日期/时间。
                               <格式>字符串可以是'date'、'seconds' 或 'ns'，
                               用于指定日期和时间显示的精确度。
                               例如：2006-08-14 02:34:56-06:00
  -r, --reference=文件       显示指定<文件>的最后修改时间
  -s, --set=字符串           按照给定<字符串>描述的时间来设置时间
  -u, --utc, --universal     按照协调世界时（UTC）显示或设置时间
      --help		显示此帮助信息并退出
      --version		显示版本信息并退出

给定的格式FORMAT 控制着输出，解释序列如下：

  %%	一个文字的 %
  %a	当前locale 的星期名缩写(例如： 日，代表星期日)
  %A	当前locale 的星期名全称 (如：星期日)
  %b	当前locale 的月名缩写 (如：一，代表一月)
  %B	当前locale 的月名全称 (如：一月)
  %c	当前locale 的日期和时间 (如：2005年3月3日 星期四 23:05:25)
  %C	世纪；比如 %Y，通常为省略当前年份的后两位数字(例如：20)
  %d	按月计的日期(例如：01)
  %D	按月计的日期；等于%m/%d/%y
  %e	按月计的日期，添加空格，等于%_d
  %F   完整日期格式，等价于 %+4Y-%m-%d
  %g   ISO-8601 格式年份的最后两位（参见 %G）
  %G   ISO-8601 格式年份（参见 %V），一般只和 %V 结合使用
  %h	等于%b
  %H	小时(00-23)
  %I	小时(00-12)
  %j	按年计的日期(001-366)
  %k   小时，空格补充空白位（ 0..23）；与 %_H 相同
  %l   小时，空格补充空白位（ 1..12）；与 %_I 相同
  %m   月份（01..12）
  %M   分钟（00..59）
  %n   换行
  %N   纳秒（000000000..999999999）
  %p   当前地区时间设置中 AM 或 PM 的等效值（“上午”或“下午”），未知则为空
  %P   类似 %p，但使用小写
  %q   一年中的季度（1..4）
  %r   当前地区时间中十二小时制钟表时间（例如，下午 11时11分04秒）
  %R   24 小时制的时间和分钟；和 %H:%M 相同
  %s   1970-01-01 00:00:00 UTC 以来的秒数
  %S	秒(00-60)
  %t	输出制表符 Tab
  %T	时间，等于%H:%M:%S
  %u	星期，1 代表星期一
  %U	一年中的第几周，以周日为每星期第一天(00-53)
  %V	ISO-8601 格式规范下的一年中第几周，以周一为每星期第一天(01-53)
  %w	一星期中的第几日(0-6)，0 代表周一
  %W	一年中的第几周，以周一为每星期第一天(00-53)
  %x	当前locale 下的日期描述 (如：12/31/99)
  %X	当前locale 下的时间描述 (如：23:13:48)
  %y	年份最后两位数位 (00-99)
  %Y	年份
  %z +hhmm		数字时区(例如，-0400)
  %:z +hh:mm		数字时区(例如，-04:00)
  %::z +hh:mm:ss	数字时区(例如，-04:00:00)
  %:::z			数字时区带有必要的精度 (例如，-04，+05:30)
  %Z			按字母表排序的时区缩写 (例如，EDT)

默认情况下，日期的数字区域以0 填充。
以下可选标记可以跟在"%"后：

  -  （连字符）不填充该域
  _  （下划线）以空格填充
  0  （数字0）以 0 填充
  +  以零填充，并且在大于四个数位的未来年份之前放置 '+' 符号
  ^  如果可能，使用大写字母
  #  如果可能，使用相反的大小写

在任何标记之后还允许一个可选的域宽度指定，它是一个十进制数字。
作为一个可选的修饰声明，它可以是E，在可能的情况下使用本地环境关联的
表示方式；或者是O，在可能的情况下使用本地环境关联的数字符号。

示例：
将 epoch（1970-01-01 UTC）以来的秒数转换为日期
  $ date --date='@2147483647'

显示美国东海岸的当前时间（请使用 tzselect(1) 来查询 TZ 的具体数值）
  $ TZ='America/Los_Angeles' date

显示美国东海岸下一个星期五当地时间早上九点
  $ date --date='TZ="America/Los_Angeles" 09:00 next Fri'
!

# 打印各种时间格式 
echo "显示星期简称(如:Sun)"
date +%a
echo "显示星期全称(如:Sunday)"
date +%A
echo "显示月份简称(如:Jan)"
date +%b
echo "显示月份全称(如:January)"
date +%B
echo "显示数字月份(如:12)"
date +%m
echo "显示数字日期(如:01 号)"
date +%d
echo "显示数字年(如:01 号)"
date +%Y 
echo "显示年‐月‐日"
date +%F
echo "显示小时(24 小时制)"
date +%H
echo "显示分钟(00..59)"
date +%M
echo "显示秒"
date +%S
echo "显示纳秒"
date +%N
echo "组合显示"
date +"%Y%m%d %H:%M:%S"

year=`date +%Y`
month=`date +%m`
day=`date +%d`
hour=`date +%H`
minute=`date +%M`
second=`date +%S`
echo `date`
echo "Current Date is: $year-$month-$day"
echo "Current Time is: $hour:$minute:$second"