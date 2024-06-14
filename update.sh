#!/bin/sh
rm  /opt/routeros/route-rule/*.txt
wget -O /opt/routeros/route-rule/cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt
wget -O /opt/routeros/route-rule/unicom.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
wget -O /opt/routeros/route-rule/chinatelecom.txt https://ispip.clang.cn/chinatelecom_cidr.txt
wget -O /opt/routeros/route-rule/all-cn.txt https://ispip.clang.cn/all_cn_cidr.txt

rm /opt/routeros/route-rule/*.rsc
bash all-cn-rule-v6.sh 
bash route-rule-v6.sh
bash all-cn-rule-v7.sh 
bash route-rule-v7.sh