#!/bin/sh

# 输出文件名
output_file="./route-rule/all-cn-router-v6.rsc"

# 清空输出文件
> "$output_file"

# 删除现有的所有路由规则
echo ":foreach i in=[/ip route rule find table=CN] do=[/ip route rule remove \$i]" >> "$output_file"

# 进入路由规则配置模式
echo "/ip route rule" >> "$output_file"

# 读取并添加 CNCGROUP 文件中的网络地址到路由表 CN
if [ -f ./iplist/all-cn.txt ]; then
  while IFS= read -r net; do
    echo "add dst-address=$net action=lookup table=CN" >> "$output_file"
  done < ./iplist/all-cn.txt
else
  echo "文件 all-cn.txt 未找到." >> "$output_file"
fi


echo "配置已生成到 $output_file"
