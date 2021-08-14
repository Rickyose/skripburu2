#!/bin/bash
#by pudh


sudo -u root iptables -A INPUT -i lo -j ACCEPT
sudo -u root iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 
sudo -u root iptables -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
sudo -u root iptables -A INPUT -p icmp -m icmp --icmp-type 3/4 -j ACCEPT 
sudo -u root iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  125.163.173.171 --dport 5901 -j ACCEPT
sudo -u root iptables -I INPUT -p tcp -s  208.53.12.223 --dport 5901 -j ACCEPT
sudo -u root iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo -u root iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable
