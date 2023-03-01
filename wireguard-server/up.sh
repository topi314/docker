# 192.168.179.2 = traefik
iptables -t nat -I PREROUTING -p tcp --dport 443 -j DNAT --to-destination 192.168.179.2
iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.179.2

# 192.168.179.2 = mailserver
iptables -t nat -I PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.179.2
iptables -t nat -I PREROUTING -p tcp --dport 143 -j DNAT --to-destination 192.168.179.2
iptables -t nat -I PREROUTING -p tcp --dport 465 -j DNAT --to-destination 192.168.179.2
iptables -t nat -I PREROUTING -p tcp --dport 587 -j DNAT --to-destination 192.168.179.2
iptables -t nat -I PREROUTING -p tcp --dport 993 -j DNAT --to-destination 192.168.179.2

# 192.168.180.4 = teleport
iptables -t nat -I PREROUTING -p tcp --dport 3025 -j DNAT --to-destination 192.168.180.4
iptables -t nat -I POSTROUTING -p tcp --dport 3025 -d 192.168.180.4 -j MASQUERADE

# 192.168.180.5 = minecraft
iptables -t nat -I PREROUTING -p tcp --dport 25565 -j DNAT --to-destination 192.168.180.5
iptables -t nat -I POSTROUTING -p tcp --dport 25565 -d 192.168.180.5 -j MASQUERADE

# 192.168.180.7 = database-dev
iptables -t nat -I PREROUTING -p tcp --dport 5432 -j DNAT --to-destination 192.168.180.7
iptables -t nat -I POSTROUTING -p tcp --dport 5432 -d 192.168.180.7 -j MASQUERADE

# 192.168.180.8 = gitea
iptables -t nat -I PREROUTING -p tcp --dport 22 -j DNAT --to-destination 192.168.180.8
iptables -t nat -I POSTROUTING -p tcp --dport 22 -d 192.168.180.8 -j MASQUERADE

# 192.168.178.44 = raspberry pi 3
iptables -t nat -I PREROUTING -p tcp --dport 90 -j DNAT --to-destination 192.168.178.44
iptables -t nat -I POSTROUTING -p tcp --dport 90 -d 192.168.178.44 -j MASQUERADE
