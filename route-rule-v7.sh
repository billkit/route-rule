#!/bin/sh

# 输出文件名
output_file="/opt/routeros/route-rule/ros-router-v7.rsc"

# 清空输出文件
> "$output_file"

# 删除现有的所有路由规则
echo ":foreach i in=[/routing rule find ] do=[/routing rule remove \$i]" >> "$output_file"

# 进入路由规则配置模式
echo "/routing rule" >> "$output_file"

# 读取并添加 中国联通文件中的网络地址到路由表 UNICOM
if [ -f /opt/routeros/route-rule/unicom.txt ]; then
  while IFS= read -r net; do
    echo "add dst-address=$net action=lookup table=UNICOM" >> "$output_file"
  done < /opt/routeros/route-rule/unicom.txt
else
  echo "文件 unicom.txt 未找到." >> "$output_file"
fi

# 读取并添加 中国电信 文件中的网络地址到路由表 CT
if [ -f /opt/routeros/route-rule/chinatelecom.txt ]; then
  while IFS= read -r net; do
    echo "add dst-address=$net action=lookup table=CT" >> "$output_file"
  done < /opt/routeros/route-rule/chinatelecom.txt
else
  echo "文件 chinatelecom.txt 未找到." >> "$output_file"
fi

# 读取并添加 中国移动 文件中的网络地址到路由表 CMCC
if [ -f /opt/routeros/route-rule/cmcc.txt ]; then
  while IFS= read -r net; do
    echo "add dst-address=$net action=lookup table=CMCC" >> "$output_file"
  done < /opt/routeros/route-rule/cmcc.txt
else
  echo "文件 cmcc.txt 未找到." >> "$output_file"
fi

echo "配置已生成到 $output_file"