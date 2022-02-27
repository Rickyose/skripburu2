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

sudo -u root iptables -I INPUT -p tcp -s  140.213.163.63 --dport 5901 -j ACCEPT # IP VPS Untuk monitoring
sudo -u root iptables -I INPUT -p tcp -s  180.243.30.70 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  125.163.172.125 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  36.73.7.254 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  95.216.154.0 --dport 5901 -j ACCEPT # IP VPS Untuk monitoring
sudo -u root iptables -I INPUT -p tcp -s  65.108.154.38 --dport 5901 -j ACCEPT # IP VPS Untuk monitoring
sudo -u root iptables -I INPUT -p tcp -s  159.69.153.127 --dport 5901 -j ACCEPT # IP VPS Untuk monitoring
sudo -u root iptables -I INPUT -p tcp -s  65.21.1.39 --dport 5901 -j ACCEPT # IP VPS Untuk monitoring
sudo -u root iptables -I INPUT -p tcp -s  125.166.229.14 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  208.53.12.223 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  36.72.217.240 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  180.254.26.167 --dport 5901 -j ACCEPT
sudo -u root iptables -A INPUT -p tcp --dport 22 -j ACCEPT #untuk ssh
sudo -u root iptables -A INPUT -p tcp --dport 8000 -j ACCEPT #untuk sharing folder ke internet
sudo -u root iptables -A INPUT -p tcp --dport 8080 -j ACCEPT #untuk rclone
sudo -u root iptables -A INPUT -p tcp --dport 443 -j ACCEPT #untuk rclone
sudo -u root iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 5901 -j DROP #untuk reject vnc 

#######################################################################################################################################################################
