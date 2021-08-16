#!/bin/bash
#by pudh

######################################################################## IP TABLES ####################################################################################
#### Agar tidak terlocked 
sudo -u root iptables -P INPUT ACCEPT
sudo -u root iptables -P FORWARD ACCEPT
sudo -u root iptables -P OUTPUT ACCEPT

############ Flush 
sudo -u root iptables -t nat -F
sudo -u root iptables -t mangle -F
sudo -u root iptables -F
sudo -u root iptables -X


sudo -u root iptables -I INPUT -p tcp -s  125.163.173.171 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  208.53.12.223 --dport 5901 -j ACCEPT
sudo -u root iptables -A INPUT -p tcp --dport 22 -j ACCEPT #untuk ssh
sudo -u root iptables -A INPUT -p tcp --dport 8000 -j ACCEPT #untuk sharing folder ke internet
sudo -u root iptables -A INPUT -p tcp --dport 8080 -j ACCEPT #untuk rclone
sudo -u root iptables -A INPUT -p tcp --dport 443 -j ACCEPT #untuk rclone
sudo -u root iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 5901 -j DROP #untuk reject vnc 
sudo -u root iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable

#######################################################################################################################################################################
