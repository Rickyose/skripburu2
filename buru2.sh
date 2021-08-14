#!/bin/bash
#by pudh

root -l <<-EOF
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 
iptables -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type 3/4 -j ACCEPT 
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
iptables -I INPUT -p tcp -s  208.53.12.223 --dport 5901 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable
EOF
