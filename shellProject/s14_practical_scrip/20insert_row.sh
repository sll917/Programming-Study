#!/bin/bash
#######################################################
# Author: liangliangSu
# Created Time: 2024-12-03 18:35
# Email: sll917@outlook.com
# Version: V1.0
# File Name: insert_row.sh
#######################################################
#echo '(1)---------------完美分割线------------------'
#!/bin/bash

# 定义源CSV文件和目标目录的路径
source_csv="source.csv"
target_dir="TestFile"

# 定义要提取的行号（从1开始）
extract_line_1=1
extract_line_2=2
extract_line_3=4
extract_line_4=5
extract_line_5=6
extract_line_6=7

# 定义要插入的目标行号（从1开始）
insert_line_1=43
insert_line_2=44
insert_line_3=46
insert_line_4=47
insert_line_5=48
insert_line_6=49

# 读取源CSV文件，提取指定行
extracted_line_1=$(sed -n "${extract_line_1}p" "$source_csv")
extracted_line_2=$(sed -n "${extract_line_2}p" "$source_csv")
extracted_line_3=$(sed -n "${extract_line_3}p" "$source_csv")
extracted_line_4=$(sed -n "${extract_line_4}p" "$source_csv")
extracted_line_5=$(sed -n "${extract_line_5}p" "$source_csv")
extracted_line_6=$(sed -n "${extract_line_6}p" "$source_csv")

# 获取目标目录下的所有CSV文件
target_files=$(find "$target_dir" -type f -name "*.csv")

# 遍历目标文件列表
for file in $target_files; do
    # 将提取的行插入到目标文件中的指定行
    sed -i "${insert_line_1}i$extracted_line_1" "$file"
    sed -i "${insert_line_2}i$extracted_line_2" "$file"
    sed -i "${insert_line_3}i$extracted_line_3" "$file"
    sed -i "${insert_line_4}i$extracted_line_4" "$file"
    sed -i "${insert_line_5}i$extracted_line_5" "$file"
    sed -i "${insert_line_6}i$extracted_line_6" "$file"
done

echo "行已成功插入到目标文件中。"
