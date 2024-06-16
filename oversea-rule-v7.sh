#!/bin/sh

# 输出文件名
output_file="./route-rule/oversea-rule-v7.rsc"

# 清空输出文件
> "$output_file"

# 删除现有的所有路由规则
echo ":foreach i in=[/routing rule find ] do=[/routing rule remove \$i]" >> "$output_file"

# 进入路由规则配置模式
echo "/routing rule" >> "$output_file"

# 读取并添加 国外IP 文件中的网络地址到路由表 OVERSEA
if [ -f ./iplist/oversea.txt ]; then
  while IFS= read -r net; do
    echo "add dst-address=$net action=lookup table=OVERSEA" >> "$output_file"
  done < ./iplist/oversea.txt
else
  echo "文件 oversea.txt 未找到." >> "$output_file"
fi


echo "配置已生成到 $output_file"
