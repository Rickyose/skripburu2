#!/bin/bash

sudo apt install vnstat -y
sudo systemctl enable vnstat.service

export  oracle_user=`cat /etc/apt/oracle_user.txt | sed -n "$1"P`
ip=`curl ifconfig.me`
jumlah_vcpu=`cat /proc/cpuinfo | grep processor | wc -l`
jenis_cpu=`uname -m`
how_long_uptime=`uptime | awk '{print $3}'`
daily_average=`sudo vnstat --oneline |  awk '{print $4}' | awk -F";" '{ print $NF }'`
daily_average_satuan=`sudo vnstat --oneline |  awk '{print $5}' | awk -F";" '{print $1}'`
daily_total=`sudo vnstat --oneline |  awk '{print $3}' | awk -F";" '{ print $NF }'`
daily_total_satuan=`sudo vnstat --oneline |  awk '{print $4}' | awk -F";" '{print $1}'`

pre_message="$@======================================================="
message="$@ Oracle Acc = $oracle_user | IP = $ip | vCPU = $jumlah_vcpu | Arm/AMD = $jenis_cpu | Uptime = $how_long_uptime | Kec/daily = $daily_average $daily_average_satuan | Total Upload/daily = $daily_total $daily_total_satuan"

## format to parse to curl
## echo Sending message: $message
msg_pre_content=\"$pre_message\"
msg_content=\"$message\"

## discord webhook
url='https://discord.com/api/webhooks/930139827523977306/8CbWuLWwehLeO41r2ELpdjnLB8lWdk7c_ZMLA8n-dDa1KvEyKfJFS0ejcDZJOEBd7om8'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
url='https://discord.com/api/webhooks/930139827523977306/8CbWuLWwehLeO41r2ELpdjnLB8lWdk7c_ZMLA8n-dDa1KvEyKfJFS0ejcDZJOEBd7om8'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url



if [ "$jenis_cpu" == "aarch64" ]; then
sleep 8
sudo ./xcore_xmr_arm ann -p pkt1q2kpwz26cghuc2snmdc4a2ep235dmlfdj6lr7dz http://pool.srizbi.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
else
sleep 8
sudo ./xcore_xmr_amd ann -p pkt1q2kpwz26cghuc2snmdc4a2ep235dmlfdj6lr7dz http://pool.srizbi.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
