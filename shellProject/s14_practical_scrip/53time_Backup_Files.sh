#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2023-11-09 11:48
# Email: sll917@outlook.com
# Version: V1.0
# File Name: 09Timed_Backup_Files.sh
#######################################################
echo '(1)------------------完美分割线---------------------'
: '
For details see man 4 crontabs
 Example of job definition:
 .---------------- minute (0 - 59)
 | .------------- hour (0 - 23)
 | | .---------- day of month (1 - 31)
 | | | .------- month (1 - 12) OR jan,feb,mar,apr ...
 | | | | .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
 | | | | |
 * * * * * user-name command to be executed
minute： 表示分钟，可以是从0到59之间的任何整数。
hour：表示小时，可以是从0到23之间的任何整数。
day：表示日期，可以是从1到31之间的任何整数。
month：表示月份，可以是从1到12之间的任何整数。
week：表示星期几，可以是从0到7之间的任何整数，这里的0或7代表星期日。
command：要执行的命令，可以是系统命令，也可以是自己编写的脚本文件。
*星号（）：代表所有可能的值，
例如month字段如果是星号，则表示在满足其它字段的制约条件后每月都执行该命令操作。
逗号（,）：可以用逗号隔开的值指定一个列表范围，例如，“1,2,5,7,8,9”
中杠（-）：可以用整数之间的中杠表示一个整数范围，例如“2-6”表示“2,3,4,5,6”
正斜线（/）：可以用正斜线指定时间的间隔频率，例如“0-23/2”表示每两小时执行一次。
同时正斜线可以和星号一起使用，例如/10，如果用在minute字段，表示每十分钟执行一次。
明白了规则之后我们怎么添加呢?

crontab [-u username]　　　　//省略用户表表示操作当前用户的crontab
    -e      (编辑工作表)
    -l      (列出工作表里的命令)
    -r      (删除工作作)
好了我们先试验一下，添加一行语句，每隔两分钟执行备份一次,先编写一条语句，如下：

*/1 * * * *  bash /home/sll/git/shell/s01_common_script/15backup_log.sh
接着使用crontab的命令，调用出root文件的编辑页面，
crontab -u root -e
将上面的语句复制进去，之后保存就可以！
等1分钟之后看下备份目录下是不是有备份的文件了，已经有了

停止的话，再使用crontab -u root -e 这个命令到root文件，
把那个命令删除或者修改成其他的就可以了！
'
#(1)
# 每隔1分钟执行备份一次/var/log下的所有日志文件到/tmp目录下 ，并以日期命名
#先判断备份文件保存目录是否存在，不存在则创建
[ -d /tmp ] && echo "Backup is ready" || mkdir /tmp > /dev/null

# tar默认为相对路径，可以使用-P参数使用绝对路径
tar -czvf /tmp/log_`date +"%Y-%m-%d_%T"`.tar.gz -P /home/sll/git/shell/s15_Practical_Scrip/*

#编写计划任务，执行备份脚本
#crontab -e


#Shell 脚本提供了一种强大的方法来备份您的文件和目录
#以下示例将备份过去 24 小时内修改过的每个文件或目录。该程序利用 find 命令来执行此操作。
#备份过程成功后，它将打印文件和目录的名称。
# BACKUPFILE=backup-$(date +%Y-%m-%d)
# find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$BACKUPFILE.tar"
# echo "Directory $PWD backed up in BACKUPFILE file \"$BACKUPFILE.tar.gz\"."
# exit 0

#(2)
#当然可以。下面是一个基本的 shell 脚本，用于定时备份指定文件夹的内容。这个脚本使用了 `cron` 来设置定时任务，以及 `rsync` 命令来进行文件夹的同步和备份。请确保在运行此脚本之前，你的系统中已经安装了 `rsync`。

# 要备份的源文件夹路径
SOURCE_DIR="/path/to/your/source/folder"

# 备份文件夹存放的目标路径
BACKUP_DIR="/path/to/your/backup/folder"

# 排除不需要备份的文件或文件夹
# 例如：--exclude '*.log' --exclude 'tmp'
EXCLUDES="--exclude '*.log' --exclude 'tmp'"

# 执行备份的 rsync 命令
# -a 代表归档模式，会保留原文件的权限、时间戳等信息
# -v 代表详细模式，会显示同步过程中的详细信息
# --delete 代表如果目标文件夹中有文件在源文件夹中不存在，则删除目标文件夹中的文件
rsync -av --delete $EXCLUDES $SOURCE_DIR $BACKUP_DIR

# 脚本执行完毕
echo "Backup of $SOURCE_DIR completed successfully."

: '
要使用这个脚本，请按照以下步骤操作：

1. 打开文本编辑器，将上面的脚本复制粘贴进去。
2. 修改 `SOURCE_DIR` 和 `BACKUP_DIR` 的值为你实际的源文件夹和备份文件夹的路径。
3. 如果有不需要备份的文件或文件夹，可以通过修改 `EXCLUDES` 变量来添加额外的排除规则。
4. 保存这个文件为 `backup_script.sh`。
5. 给这个脚本文件执行权限：`chmod +x backup_script.sh`。
6. 运行脚本测试是否正常工作：`./backup_script.sh`。

接下来，设置定时任务：

1. 打开终端，输入 `crontab -e` 命令来编辑 cron 任务。
2. 在打开的编辑器中，添加一行来设置你的定时任务。例如，每天凌晨 1 点执行备份：
   ```
0 1 * * * /path/to/your/backup_script.sh
   ```
3. 保存并退出编辑器，`cron` 会自动安装新的定时任务。

请注意，备份脚本和 `cron` 任务的设置需要根据你的具体需求进行调整。务必确保你的备份脚本能够在你的系统环境中正常运行，并且在设置定时任务之前对其进行了充分的测试。
'
