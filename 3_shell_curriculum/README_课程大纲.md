# Shell 脚本课程体系分析 —— 从入门到精通

> 分析目录: `shellProject/`  
> 总脚本数量: 约 **200+** 个 shell 脚本  
> 覆盖级别: 入门 → 基础 → 进阶 → 高级 → 实战

---

## 目录

1. [总体结构概览](#1-总体结构概览)
2. [第一层：Shell 入门（零基础→能写简单脚本）](#2-第一层shell-入门零基础能写简单脚本)
3. [第二层：Shell 基础（变量、条件、循环）](#3-第二层shell-基础变量条件循环)
4. [第三层：Shell 进阶（函数、数组、IO、脚本调用）](#4-第三层shell-进阶函数数组io脚本调用)
5. [第四层：文本三剑客（grep、sed、awk）](#5-第四层文本三剑客grepsedawk)
6. [第五层：综合实战（s01_scripts_master 全书体系）](#6-第五层综合实战s01_scripts_master-全书体系)
7. [第六层：生产级实战脚本（s14_practical_script）](#7-第六层生产级实战脚本s14_practical_script)
8. [推荐学习路线图](#8-推荐学习路线图)

---

## 1. 总体结构概览

```
shellProject/
├── s02_basic_commands/       ← 第1步: Shell基础命令
├── s03_regular_expr/         ← 第1步: 正则表达式入门
├── s04_file_permissions/     ← 第1步: 文件权限管理
├── s05_variable/             ← 第2步: 变量与运算
├── s06_io_redirection/       ← 第2步: 输入输出重定向
├── s07_array/                ← 第3步: 数组
├── s08_script_call/          ← 第3步: 脚本间调用
├── s09_function/             ← 第3步: 函数
├── s10_condition/            ← 第2步: 条件判断
├── s11_cycles/               ← 第2步: 循环控制
├── s12_three_musketeers/     ← 第4步: grep/sed/awk 三剑客
├── s13_writing_tools_rules/  ← 进阶: 文件处理工具与编程规范
├── s14_practical_script/     ← 第6步: 生产级实战脚本
└── s01_scripts_master/       ← 第5步: 完整体系课程(7章)
    ├── chaper01/  入门与基础
    ├── chaper02/  智能判断
    ├── chaper03/  循环与中断
    ├── chaper04/  数组/SubShell/函数
    ├── chaper05/  脚本技巧
    ├── chaper06/  sed 高级应用
    └── chaper07/  awk 高级应用
```

---

## 2. 第一层：Shell 入门（零基础 → 能写简单脚本）

### 2.1 基础命令 (`s02_basic_commands/`) — 7个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01find_usage.sh` | find 命令7种用法详解（名称/大小/时间/权限/用户/exec 查找） | ★☆☆ |
| `02date_man.sh` | date 命令与 man 帮助手册使用 | ★☆☆ |
| `03read_usage.sh` | read 命令交互式读取用户输入 | ★☆☆ |
| `04sleep命令.sh` | sleep 延时命令用法 | ★☆☆ |
| `05EOF_usage.sh` | Here Document (EOF) 多行文本输入 | ★☆☆ |
| `06echo_命令详解.sh` | echo 命令详解：转义字符、颜色输出、ANSI控制码 | ★★☆ |
| `07printf格式化输出.sh` | printf 格式化输出详解 | ★★☆ |

**学完目标**: 能写 "Hello World"，能读取输入输出，理解脚本基本结构。

### 2.2 正则表达式 (`s03_regular_expr/`) — 1个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01正则表达式之grep.sh` | grep + 正则表达式基础（字符匹配、次数匹配、锚定） | ★★☆ |

### 2.3 文件权限管理 (`s04_file_permissions/`) — 3个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01改变所属群组_chgrp.sh` | chgrp 改变文件所属组 | ★☆☆ |
| `02改变文件拥有者_chown.sh` | chown 改变文件所有者 | ★☆☆ |
| `03型改变文件权限_chmod.sh` | chmod 改变文件权限（rwx/数字/符号模式） | ★☆☆ |

---

## 3. 第二层：Shell 基础（变量、条件、循环）

### 3.1 变量与运算 (`s05_variable/`) — 10个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01定义变量.sh` | 变量定义、只读变量、删除变量、单引号vs双引号、变量类型 | ★★☆ |
| `02变量替换删除.sh` | `${}` 变量替换、删除、截取操作 | ★★☆ |
| `03关系运算.sh` | -eq/-ne/-gt/-lt/-ge/-le 数值关系运算 | ★★☆ |
| `04布尔运算.sh` | !/-o/-a 布尔/逻辑运算 | ★★☆ |
| `05文件测试运算.sh` | -f/-d/-e/-r/-w/-x 等文件测试操作符 | ★★☆ |
| `06逻辑运算.sh` | && 和 || 逻辑运算符 | ★★☆ |
| `07字符串运算.sh` | =/!=/-z/-n 字符串比较 | ★★☆ |
| `08变量运算.sh` | 变量赋值、拼接、运算综合 | ★★☆ |
| `09算术运算.sh` | $(( ))/$[ ]/let/expr 等算术运算方式 | ★★☆ |
| `10基本运算符详解.sh` | 算数/关系/布尔/字符串/文件测试 运算符大全 | ★★★ |

### 3.2 条件判断 (`s10_condition/`) — 5个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01if_else语句.sh` | if-then / if-else / if-elif-else / 嵌套if | ★★☆ |
| `02if_and_or.sh` | if 结合 && 和 || 逻辑运算符 | ★★☆ |
| `03case语句.sh` | case 多分支选择语句 | ★★☆ |
| `04condition_数值测试.sh` | 数值测试综合案例 | ★★☆ |
| `05nginx_ctrl.sh` | 实战：Nginx 启动/停止/重启/重载控制脚本 | ★★★ |

### 3.3 循环控制 (`s11_cycles/`) — 6个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01for循环.sh` | for-in / C风格for / 数值求和（5种写法） | ★★☆ |
| `02while循环.sh` | while 循环基础 | ★★☆ |
| `03until循环.sh` | until 循环（条件为假时执行） | ★★☆ |
| `04break循环.sh` | break 跳出循环 | ★★☆ |
| `05continue循环.sh` | continue 跳过当次循环 | ★★☆ |
| `06break_continue_diff.sh` | break vs continue vs exit 区别对比 | ★★☆ |

### 3.4 输入输出重定向 (`s06_io_redirection/`) — 1个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01输入输出重定向.sh` | stdin/stdout/stderr, >, >>, <, <<, 2>, &> 详细讲解 | ★★☆ |

---

## 4. 第三层：Shell 进阶（函数、数组、IO、脚本调用）

### 4.1 数组 (`s07_array/`) — 1个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `shell数组详解.sh` | 数组定义、读取、遍历、删除、关联数组 | ★★★ |

### 4.2 脚本调用 (`s08_script_call/`) — 3个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01脚本调用.sh` | source / . / bash / ./ 四种调用方式区别 | ★★★ |
| `02main.sh` | 主脚本调用示例 | ★★★ |
| `03subscript.sh` | 子脚本被调用示例 | ★★★ |

### 4.3 函数 (`s09_function/`) — 6个脚本

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01函数定义及格式.sh` | function 定义、调用、返回值 $?、嵌套调用 | ★★★ |
| `02系统函数.sh` | 使用系统内置函数 | ★★★ |
| `03判断奇偶数.sh` | 函数实战：判断奇偶数 | ★★★ |
| `04递归函数.sh` | 函数递归调用 | ★★★★ |
| `05函数参数.sh` | $1/$2/$n 参数传递 | ★★★ |
| `06函数传递.sh` | 函数间参数传递与返回值 | ★★★ |

### 4.4 编程工具与规范 (`s13_writing_tools_rules/`) — 7个脚本 + 辅助文件

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01文件处理工具.sh` | cut/paste/sort/tr/tee/uniq 等文件处理工具 | ★★★ |
| `02编程语言分类.sh` | 解释型vs编译型语言概念 | ★☆☆ |
| `03bash基本特性.sh` | bash 特性（别名、历史、快捷键） | ★★☆ |
| `04变量的定义.sh` | 变量定义进阶（位置变量、特殊变量、环境变量） | ★★★ |
| `05四则运算.sh` | 四则运算综合 | ★★☆ |
| `06条件判断.sh` | 条件判断进阶 | ★★★ |
| `07script之选择与执行.sh` | 脚本执行方式选择 | ★★★ |

---

## 5. 第四层：文本三剑客（grep、sed、awk）

### 5.1 三剑客 (`s12_three_musketeers/`) — 16个脚本 + 辅助文件

| 脚本 | 学习内容 | 难度 |
|------|----------|------|
| `01shell三剑客之grep.sh` | grep 全面详解（基本/扩展正则、选项） | ★★★ |
| `02shell三剑客之sed.sh` | sed 流编辑器（增删改查、正则替换、多行操作） | ★★★★ |
| `03shell三剑客之awk.sh` | awk 基础（BEGIN/BODY/END、字段分隔、格式化输出、模式匹配） | ★★★★ |
| `07awk_if语句.sh` | awk 中的 if 条件判断 | ★★★★ |
| `08awk_逻辑运算符.sh` | awk 中的 && / || / ! 逻辑运算 | ★★★★ |
| `09awk_数值运算.sh` | awk 中的算术运算 | ★★★★ |
| `10awk_输出分隔符OFS.sh` | awk 输出字段分隔符 OFS 详解 | ★★★★ |
| `11awk_数组.sh` | awk 数组使用详解 | ★★★★★ |
| `12awk_应用.sh` | awk 综合应用案例 | ★★★★★ |
| `13awk_统计文件字符串.sh` | awk 统计分析与字符串处理 | ★★★★★ |
| `14三剑客命令实战案例.sh` | 三剑客综合实战案例(1) | ★★★★★ |
| `15三剑客命令实战案例.sh` | 三剑客综合实战案例(2) | ★★★★★ |
| `16玩转shell三剑客.sh` | 三剑客融会贯通综合案例 | ★★★★★ |

---

## 6. 第五层：综合实战（s01_scripts_master 全书体系）

这是基于《Linux Shell核心编程指南》一书的完整脚本体系，共 **7 章 95+ 个脚本**。

### 6.1 第1章：从这里开始，起飞了（13个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `first.sh` | 第一个脚本，echo "hello the world" | ★☆☆ |
| `calc.sh` | 基本算术运算 | ★☆☆ |
| `echo_menu.sh` | echo 输出菜单 | ★☆☆ |
| `printf_menu.sh` | printf 格式化菜单 | ★★☆ |
| `heredoc_tab.sh` | Here Document 与制表符 | ★★☆ |
| `exit.sh` | 脚本退出状态码 | ★☆☆ |
| `sleep.sh` | sleep 延时 | ★☆☆ |
| `sys_var.sh` | 系统变量与环境变量 | ★★☆ |
| `sys_info.sh` | 系统信息收集脚本 | ★★☆ |
| `autofdisk.sh` | 自动化磁盘分区 | ★★★ |
| `automail.sh` | 自动发送邮件脚本 | ★★★ |
| `user_add.sh` | 批量用户创建脚本 | ★★★ |

### 6.2 第2章：智能判断（23个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `if_demo1.sh` ~ `if_demo3.sh` | if 单/双/多分支判断 | ★★☆ |
| `case-demo1.sh` ~ `case-demo6.sh` | case 语句6个递进案例 | ★★☆ |
| `ping_test.sh` | 测试主机连通性 | ★★☆ |
| `check_service.sh` | 检测服务运行状态 | ★★★ |
| `check_http_curl.sh` | curl 检测 HTTP 服务状态 | ★★★ |
| `check_http_hash.sh` | 哈希验证 HTTP 服务 | ★★★ |
| `check_http_nmap.sh` | nmap 检测 HTTP 服务 | ★★★ |
| `disk_manager.sh` | 磁盘管理监控脚本 | ★★★ |
| `install_nginx.sh` | Nginx 安装脚本 | ★★★ |
| `nginx.sh` | Nginx 启动管理脚本 | ★★★ |
| `menu.sh` | 交互式菜单脚本 | ★★★ |
| `score.sh` | 分数等级判断 | ★★☆ |
| `guess_num.sh` | 猜数字游戏 | ★★☆ |
| `game.sh` | 石头剪刀布游戏 | ★★☆ |
| `sys_info.sh` | 系统性能监控脚本 | ★★★ |
| `vncserver.sh` | VNC 服务管理脚本 | ★★★ |

### 6.3 第3章：循环与中断（31个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `for-demo1.sh` ~ `for-demo4.sh` | for 循环4个递进案例 | ★★☆ |
| `c-style1.sh` ~ `c-style2.sh` | C 语言风格 for 循环 | ★★☆ |
| `while-demo1.sh` ~ `while-demo4.sh` | while 循环4个递进案例 | ★★☆ |
| `while_colons.sh` | 冒号死循环 | ★★☆ |
| `while_true.sh` | while true 无限循环 | ★★☆ |
| `while_read1.sh` ~ `while_read2.sh` | while read 逐行读取文件 | ★★★ |
| `until-demo.sh` | until 循环 | ★★☆ |
| `select-demo.sh` | select 菜单循环 | ★★★ |
| `IFS-demo.sh` | 内部字段分隔符 IFS | ★★★ |
| `break-demo.sh` | break 中断 | ★★☆ |
| `continue-demo1.sh` ~ `continue-demo2.sh` | continue 跳过 | ★★☆ |
| `exit-demo1.sh` ~ `exit-demo4.sh` | exit 退出控制4案例 | ★★☆ |
| `ping_check1.sh` ~ `ping_check2.sh` | 批量 ping 检测 | ★★★ |
| `check_http_curl.sh` | 循环检测 HTTP 状态 | ★★★ |
| `guess_num.sh` | 猜随机数字游戏 | ★★☆ |
| `monkey.sh` | 猴子吃香蕉算法题 | ★★★ |
| `leap_year.sh` | 判断闰年 | ★★☆ |
| `multi_table.sh` | 九九乘法表 | ★★☆ |
| `sum.sh` | 累加求和 | ★★☆ |
| `star.sh` / `shape1.sh`~`shape3.sh` / `matrix-star.sh` | 打印各种形状图形 | ★★★ |
| `chess.sh` | 国际象棋棋盘 | ★★★ |
| `double-color.sh` | 机选双色球 | ★★★ |
| `user.sh` | 用户管理循环脚本 | ★★★ |

### 6.4 第4章：数组、SubShell、函数（25个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `env.sh` | 环境变量 | ★★★ |
| `exec.sh` | exec 命令 | ★★★ |
| `source.sh` | source 命令 | ★★★ |
| `fork.sh` | 进程创建 fork | ★★★★ |
| `subshell_01.sh` ~ `subshell_06.sh` | SubShell 6个递进案例（含 bug 案例） | ★★★★ |
| `function-demo1.sh` ~ `function-demo5.sh` | 函数5个递进案例 | ★★★ |
| `fibo_v1.sh` ~ `fibo_v2.sh` | 斐波那契数列两种实现 | ★★★★ |
| `bubble_sort.sh` | 冒泡排序 | ★★★★ |
| `quick_sort.sh` | 快速排序 | ★★★★★ |
| `insertion_sort_v1.sh` ~ `insertion_sort_v2.sh` | 插入排序两种实现 | ★★★★ |
| `count_sort_v1.sh` ~ `count_sort_v2.sh` | 计数排序两种实现 | ★★★★ |
| `proc_buble_sort.sh` | 多进程冒泡排序（进程控制） | ★★★★★ |
| `multi_ping_v1.sh` ~ `multi_ping_v3.sh` | 多进程 ping 脚本3版演进 | ★★★★★ |
| `multi_procs.sh` | 多进程并发控制 | ★★★★★ |
| `check_service.sh` | 服务检测函数封装 | ★★★ |
| `nginx_log.sh` | Nginx 日志分析 | ★★★★ |
| `lnmp.sh` | 一键源码部署 LNMP | ★★★★★ |
| `puzzle.sh` | 单词拼接 Puzzle 游戏 | ★★★ |
| `usage.sh` | 脚本用法帮助信息 | ★★☆ |

### 6.5 第5章：脚本技巧（24个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `clobber.sh` | 输出重定向覆盖保护 | ★★★ |
| `empty.sh` | 空文件判断 | ★★☆ |
| `errexit.sh` | set -e 错误退出 | ★★★ |
| `nounset.sh` | set -u 未定义变量检测 | ★★★ |
| `parameter.sh` | 参数传递技巧 | ★★★ |
| `randpass.sh` | 生成随机密码（多种方式） | ★★★ |
| `randfile.sh` | 生成随机文件 | ★★★ |
| `rename_v1.sh` ~ `rename_v2.sh` | 批量文件重命名 | ★★★ |
| `filebak.sh` | 文件备份脚本 | ★★★ |
| `trap.sh` | trap 信号捕获 | ★★★★ |
| `clock.sh` | 电子时钟 | ★★★★ |
| `countdown.sh` | 倒计时脚本 | ★★★ |
| `progress_bar1.sh` ~ `progress_bar5.sh` | 进度条5种实现方式 | ★★★★ |
| `demo_error1.sh` ~ `demo_error2.sh` | 脚本排错技巧 | ★★★ |
| `diff.sh` | diff 文件对比 | ★★★ |
| `loop.sh` | 循环技巧综合 | ★★★ |
| `mouse.sh` | 抓住小老鼠游戏 | ★★★ |
| `nginx_logbak.sh` | Nginx 日志切割 | ★★★★ |
| `useradd.sh` | 批量创建用户（shift用法） | ★★★ |
| `test.sh` | 测试命令综合 | ★★★ |

### 6.6 第6章：sed 高级应用（9个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `config_sshd.sh` | sed 自动化配置 SSH 安全策略 | ★★★★★ |
| `dhcp.sh` | sed 自动化配置 DHCP 服务 | ★★★★★ |
| `vsftpd.sh` | sed 自动化配置 vsftpd 服务 | ★★★★★ |
| `clone-vm.sh` | sed/wget 自动化克隆 KVM 虚拟机 | ★★★★★ |
| `guestfish.sh` | libguestfs 管理 KVM 虚拟机 | ★★★★★ |
| `kernel.sh` | sed 修改 GRUB 内核启动参数 | ★★★★★ |
| `movie.sh` | 网络爬虫（电影信息抓取） | ★★★★★ |
| `roll.sh` | 点名抽奖器 | ★★★ |
| `tmooc.sh` | 在线课程抓取 | ★★★★★ |

### 6.7 第7章：awk 高级应用（7个脚本）

| 脚本 | 对应知识点 | 难度 |
|------|-----------|------|
| `nginx_log.sh` | awk 版网站日志分析 | ★★★★★ |
| `location.sh` | 定位脚本 | ★★★★ |
| `netstat.sh` | awk 监控网络连接状态 | ★★★★★ |
| `blockip.sh` | awk 获取 SSH 暴力破解黑名单 IP | ★★★★★ |
| `monitor.sh` | awk 系统性能监控脚本 | ★★★★★ |
| `mysql_monitor.sh` | awk 数据库监控脚本 | ★★★★★ |
| `movie.sh` | awk 版网络爬虫 | ★★★★★ |

---

## 7. 第六层：生产级实战脚本（s14_practical_script）

这是 **57个** 可直接用于生产环境的实用脚本，涵盖系统运维的方方面面。

### 7.1 系统监控类 (1-6)

| 脚本 | 功能 |
|------|------|
| `01占用CPU内存过高的进程.sh` | 查找CPU/内存占用高的进程 |
| `05检测网卡流量.sh` | 检测网卡实时流量 |
| `06检查网段ip状态.sh` | 扫描网段IP在线状态 |
| `12get_system_status.sh` | 获取系统整体状态 |
| `42获取本机MAC地址.sh` | 获取本机MAC地址 |
| `44统计Linux进程相关数量信息.sh` | Linux进程统计 |

### 7.2 脚本调试与开发 (2-4)

| 脚本 | 功能 |
|------|------|
| `02调试脚本.sh` | 脚本调试技巧（set -x/-v） |
| `03check_superuser.sh` | 检查是否为 root 用户 |
| `04welcome_note.sh` | 登录欢迎界面 |

### 7.3 函数与数字操作 (7-8)

| 脚本 | 功能 |
|------|------|
| `07shell函数.sh` | Shell 函数综合应用 |
| `08数字的常用操作.sh` | 数字处理常见操作 |

### 7.4 文件与字符串操作 (9-10, 17-27)

| 脚本 | 功能 |
|------|------|
| `09文件的常用操作.sh` | 文件操作大全 |
| `10计算变量长度.sh` | 变量/字符串长度计算 |
| `14print_各种图形.sh` | 打印各种图形 |
| `15NumberOfCounts.sh` | 统计文件行数/单词数/字符数 |
| `16bacth_rename_files.sh` | 批量重命名文件 |
| `17bacth_create_files.sh` | 批量创建文件 |
| `18judge_file_type.sh` | 判断文件类型 |
| `20insert_row.sh` | 向文件插入行 |
| `21modify_string.sh` | 修改字符串 |
| `22modify_file_name.sh` | 修改文件名 |
| `23merging_files.sh` | 合并文件 |
| `24Check_file_modified.sh` | 检测文件是否被修改 |
| `25compare_dir_diff.sh` | 比较目录差异 |
| `27字符串截取的8种方法.sh` | 字符串截取8种方法大全 |
| `34检测文件是否被修改.sh` | 文件修改检测 |

### 7.5 随机数与密码 (26, 37)

| 脚本 | 功能 |
|------|------|
| `26Generate_random_str_num.sh` | 生成随机字符串和数字 |
| `37生成随机密码.sh` | 生成随机密码 |

### 7.6 进度条与UI (28-30)

| 脚本 | 功能 |
|------|------|
| `28显示进度条.sh` | 显示进度条效果 |
| `29判断输入YesNO.sh` | Yes/No 交互判断 |
| `30点名器.sh` | 随机点名器 |

### 7.7 算法与游戏 (31, 33, 36, 46)

| 脚本 | 功能 |
|------|------|
| `31shell实现插入排序.sh` | 插入排序 Shell 实现 |
| `33guess_number_games.sh` | 猜数字游戏 |
| `36判断该年是否为闰年.sh` | 判断闰年 |
| `46打印斐波那契数列.sh` | 斐波那契数列 |

### 7.8 系统管理 (11, 19, 32, 38-45, 47-57)

| 脚本 | 功能 |
|------|------|
| `11judge_users_exist.sh` | 判断用户是否存在 |
| `19del_user.sh` | 批量删除用户 |
| `32定时清理文件内容.sh` | 定时清理文件（cron） |
| `35访问apache服务器.sh` | 访问 Apache 服务器 |
| `38测试用户名与密码是否正确.sh` | 验证用户名密码 |
| `39批量下载有序文件.sh` | 批量下载文件（wget/curl） |
| `40显示当前计算机中所有用户名.sh` | 列出所有用户名 |
| `41tar打包备份到目录.sh` | tar 打包备份 |
| `43找出系统中能登录的用户.sh` | 查找可登录用户 |
| `45判断用户输入的数据类型.sh` | 输入数据类型判断 |
| `47生成延时.sh` | 延时生成 |
| `48Fork_炸弹_慎用.sh` | Fork 炸弹（警告：慎用） |
| `49memorandum_book.sh` | 备忘录脚本 |
| `50彩色输出_helloworld.sh` | 彩色输出 Hello World |
| `51判断文件是否存在.sh` | 判断文件是否存在 |
| `52优秀运维脚本鉴赏.sh` | 综合运维脚本示范 |
| `53time_Backup_Files.sh` | 定时备份文件 |
| `54continuous_updates.sh` | 持续更新脚本 |
| `55shell面试题.sh` | Shell 面试题汇总 |
| `56create_users.sh` | 批量创建用户 |
| `57backup_script.sh` | 备份脚本 |

---

## 8. 推荐学习路线图

```
┌──────────────────────────────────────────────────────────────┐
│                  Shell 脚本从入门到精通路线图                    │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  第1阶段: 入门（1-2周）                                        │
│  ├── s02_basic_commands/  基础命令(find/echo/printf/read)     │
│  ├── s04_file_permissions/ 文件权限                            │
│  ├── s03_regular_expr/    正则表达式                           │
│  └── 目标: 写出第一个脚本，理解脚本结构                          │
│                                                              │
│  第2阶段: 基础（2-3周）                                        │
│  ├── s05_variable/        变量与运算（10个脚本）                 │
│  ├── s06_io_redirection/  输入输出重定向                        │
│  ├── s10_condition/       条件判断（if/case）                   │
│  ├── s11_cycles/          循环控制（for/while/until）           │
│  └── 目标: 能写带逻辑判断和循环的中等脚本                        │
│                                                              │
│  第3阶段: 进阶（2-3周）                                        │
│  ├── s07_array/           数组详解                             │
│  ├── s08_script_call/     脚本调用(source/bash/./)             │
│  ├── s09_function/        函数（6个脚本）                       │
│  ├── s13_writing_tools_rules/ 编程工具与规范                   │
│  └── 目标: 能组织模块化的脚本，会用函数封装                       │
│                                                              │
│  第4阶段: 文本处理三剑客（3-4周）                                │
│  ├── s12_three_musketeers/01 grep  → 掌握文本搜索               │
│  ├── s12_three_musketeers/02 sed   → 掌握流编辑                │
│  ├── s12_three_musketeers/03-13 awk → 掌握文本分析              │
│  └── 目标: 熟练运用三剑客处理日志/配置文件/数据                  │
│                                                              │
│  第5阶段: 全书体系学习（4-6周）                                  │
│  ├── s01_scripts_master/chaper01/  入门与基础回顾               │
│  ├── s01_scripts_master/chaper02/  智能判断进阶                 │
│  ├── s01_scripts_master/chaper03/  循环中断精通                 │
│  ├── s01_scripts_master/chaper04/  数组/SubShell/函数/排序      │
│  ├── s01_scripts_master/chaper05/  脚本技巧大全                 │
│  ├── s01_scripts_master/chaper06/  sed高级实战                  │
│  ├── s01_scripts_master/chaper07/  awk高级实战                  │
│  └── 目标: 系统掌握Shell核心编程，具备独立开发能力               │
│                                                              │
│  第6阶段: 生产实战（持续练习）                                   │
│  └── s14_practical_script/  57个生产级脚本：                    │
│      ├── 系统监控、进程管理                                      │
│      ├── 文件操作、字符串处理                                    │
│      ├── 网络检测、批量部署                                      │
│      ├── 用户管理、备份恢复                                      │
│      └── 目标: 成为 Shell 脚本高级运维工程师                     │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

## 脚本难度分级统计

| 难度 | 标记 | 脚本数 | 典型内容 |
|------|------|--------|----------|
| 入门 | ★☆☆ | ~20 | 基础命令、echo、变量定义 |
| 基础 | ★★☆ | ~50 | 条件判断、循环、IO重定向 |
| 进阶 | ★★★ | ~60 | 函数、数组、脚本调用、工具链 |
| 高级 | ★★★★ | ~40 | sed/awk高级、SubShell、排序算法 |
| 精通 | ★★★★★ | ~30 | 系统部署、性能监控、多进程、爬虫 |

---

## 核心技术点索引

| 技术点 | 对应章节 |
|--------|----------|
| 变量定义与替换 | s05_variable, s01-chaper01 |
| 条件测试(test/[]/[[]]) | s05_variable(03-07), s10_condition, s01-chaper02 |
| if/case 分支 | s10_condition, s01-chaper02 |
| for/while/until/select | s11_cycles, s01-chaper03 |
| break/continue/exit | s11_cycles, s01-chaper03 |
| 函数定义/参数/递归 | s09_function, s01-chaper04 |
| 数组(普通/关联) | s07_array, s01-chaper04 |
| SubShell/进程 | s01-chaper04(04-09) |
| 管道与重定向 | s06_io_redirection |
| grep/正则表达式 | s03_regular_expr, s12(01) |
| sed(基本+高级) | s12(02), s01-chaper06 |
| awk(基础+进阶) | s12(03-13), s01-chaper07 |
| 排序算法 | s01-chaper04(12-15) |
| trap信号 | s01-chaper05(11) |
| 进度条 | s01-chaper05(15), s14(28) |
| 脚本调试 | s01-chaper05(14), s14(02) |
| 文件处理工具 | s13_writing_tools_rules |
| 系统监控/运维 | s14_practical_script |

---

> **学习建议**: 按推荐路线图的6个阶段逐层推进。每个脚本内部都有详细的中文注释和分隔线标记，代码示例丰富。基础阶段重点关注 `s02`~`s11`；进阶阶段吃透 `s12` 三剑客和 `s01_scripts_master`；实战阶段将 `s14` 中的每个脚本都手敲一遍。
