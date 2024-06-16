#!/bin/sh
#rm  ./iplist/*.txt
wget -O ./iplist/cmcc.txt https://ispip.clang.cn/cmcc_cidr.txt
wget -O ./iplist/unicom.txt https://ispip.clang.cn/unicom_cnc_cidr.txt
wget -O ./iplist/chinatelecom.txt https://ispip.clang.cn/chinatelecom_cidr.txt
wget -O ./iplist/all-cn.txt https://raw.githubusercontent.com/billkit/ip-area-route/master/data/apnic_china_0_v4.txt
wget -O ./iplist/oversea.txt https://raw.githubusercontent.com/billkit/ip-area-route/master/data/apnic_oversea_0_v4.txt

#rm ./route-rule/*.rsc
bash all-cn-rule-v6.sh 
bash route-rule-v6.sh
bash all-cn-rule-v7.sh 
bash route-rule-v7.sh
bash oversea-rule-v7.sh
bash oversea-rule.sh
