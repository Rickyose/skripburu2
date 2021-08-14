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

sudo -u root iptables -A INPUT -i lo -j ACCEPT
sudo -u root iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 
sudo -u root iptables -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
sudo -u root iptables -A INPUT -p icmp -m icmp --icmp-type 3/4 -j ACCEPT 
sudo -u root iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  125.163.173.171 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  208.53.12.223 --dport 5901 -j ACCEPT
sudo -u root iptables -A INPUT -p tcp --dport 22 -j ACCEPT #untuk ssh
sudo -u root iptables -A INPUT -p tcp --dport 8000 -j ACCEPT #untuk sharing folder ke internet
sudo -u root iptables -A INPUT -p tcp --dport 8080 -j ACCEPT #untuk rclone
sudo -u root iptables -A INPUT -p tcp --dport 443 -j ACCEPT #untuk rclone
sudo -u root iptables -A INPUT -p tcp --dport 5901 -j ACCEPT  #untuk reject vnc 
sudo -u root iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable

#######################################################################################################################################################################
