iptables -t nat -I PREROUTING -p tcp --dport 443 -j DNAT --to-destination 192.168.180.3
iptables -t nat -I POSTROUTING -p tcp --dport 443 -d 192.168.180.3 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.180.3
iptables -t nat -I POSTROUTING -p tcp --dport 80 -d 192.168.180.3 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 25565 -j DNAT --to-destination 192.168.180.3
iptables -t nat -I POSTROUTING -p tcp --dport 25565 -d 192.168.180.3 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 3025 -j DNAT --to-destination 192.168.180.4
iptables -t nat -I POSTROUTING -p tcp --dport 3025 -d 192.168.180.4 -j MASQUERADE