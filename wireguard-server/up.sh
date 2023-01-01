# traefik = 192.168.180.3
iptables -t nat -I PREROUTING -p tcp --dport 443 -j DNAT --to-destination 192.168.180.3
iptables -t nat -I POSTROUTING -p tcp --dport 443 -d 192.168.180.3 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.180.3
iptables -t nat -I POSTROUTING -p tcp --dport 80 -d 192.168.180.3 -j MASQUERADE

# 192.168.180.4 = teleport
iptables -t nat -I PREROUTING -p tcp --dport 3025 -j DNAT --to-destination 192.168.180.4
iptables -t nat -I POSTROUTING -p tcp --dport 3025 -d 192.168.180.4 -j MASQUERADE

# 192.168.180.5 = minecraft
iptables -t nat -I PREROUTING -p tcp --dport 25565 -j DNAT --to-destination 192.168.180.5
iptables -t nat -I POSTROUTING -p tcp --dport 25565 -d 192.168.180.5 -j MASQUERADE

# 192.168.180.6 = mailserver
iptables -t nat -I PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.180.6
iptables -t nat -I POSTROUTING -p tcp --dport 25 -d 192.168.180.6 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 143 -j DNAT --to-destination 192.168.180.6
iptables -t nat -I POSTROUTING -p tcp --dport 143 -d 192.168.180.6 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 465 -j DNAT --to-destination 192.168.180.6
iptables -t nat -I POSTROUTING -p tcp --dport 465 -d 192.168.180.6 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 587 -j DNAT --to-destination 192.168.180.6
iptables -t nat -I POSTROUTING -p tcp --dport 587 -d 192.168.180.6 -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp --dport 993 -j DNAT --to-destination 192.168.180.6
iptables -t nat -I POSTROUTING -p tcp --dport 993 -d 192.168.180.6 -j MASQUERADE

# database-dev
iptables -t nat -I PREROUTING -p tcp --dport 5432 -j DNAT --to-destination 192.168.180.7
iptables -t nat -I POSTROUTING -p tcp --dport 5432 -d 192.168.180.7 -j MASQUERADE
