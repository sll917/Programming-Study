#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2025-02-12 11:30
# Email: sll917@outlook.com
# Version: V1.0
# File Name: backup_script.sh
#######################################################
echo '(1)---------------完美分割线------------------'
#!/bin/bash

#用于定时备份指定文件夹的内容。这个脚本使用了 `cron` 来设置定时任务，以及 `rsync` 命令来进行文件夹的同步和备份。请确保在运行此脚本之前，你的系统中已经安装了 `rsync`。

# 要备份的源文件夹路径
SOURCE_DIR="/home/sll/gitee/shellProject"

# 备份文件夹存放的目标路径
BACKUP_DIR="/home/sll/Documents"

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
一, 要使用这个脚本，请按照以下步骤操作：
1. 打开文本编辑器，将上面的脚本复制粘贴进去。
2. 修改 `SOURCE_DIR` 和 `BACKUP_DIR` 的值为你实际的源文件夹和备份文件夹的路径。
3. 如果有不需要备份的文件或文件夹，可以通过修改 `EXCLUDES` 变量来添加额外的排除规则。
4. 保存这个文件为 `backup_script.sh`。
5. 给这个脚本文件执行权限：`chmod +x backup_script.sh`。
6. 运行脚本测试是否正常工作：`./backup_script.sh`。
二, 接下来，设置定时任务：
1. 打开终端，输入 `crontab -e` 命令来编辑 cron 任务。
2. 在打开的编辑器中，添加一行来设置你的定时任务。例如，每天凌晨 1 点执行备份：
0 1 * * * /home/sll/Documents/backup_script.sh
3. 保存并退出编辑器，`cron` 会自动安装新的定时任务。
请注意，备份脚本和 `cron` 任务的设置需要根据你的具体需求进行调整。务必确保你的备份脚本能够在你的系统环境中正常运行，并且在设置定时任务之前对其进行了充分的测试。
'
