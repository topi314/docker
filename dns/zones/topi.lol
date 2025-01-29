$TTL 5m

$ORIGIN topi.lol.

@             IN     SOA    ns.topi.lol. mail.topi.lol (
                            0000000001     ; serial
                            12h            ; refresh
                            15m            ; retry
                            3w             ; expire
                            5m )           ; minimum TTL

              IN     NS     ns.topi.lol.

ns            IN     A      192.168.178.31

@             IN     A      192.168.178.74
@             IN     AAAA   fe80::5c19:77ff:fee3:2f62
*             IN     CNAME  @

mail          IN     A      194.59.207.110
imap          IN     CNAME  mail    
smtp          IN     CNAME  mail

vps           IN     A      194.59.207.110
vps1          IN     A      89.58.40.223
vps2          IN     A      37.120.172.158
vps3          IN     A      5.45.108.89

pve           IN     A      192.168.178.73
pve           IN     AAAA   fe80::dabb:c1ff:fea2:1c46

pbs           IN     A      192.168.178.72
pbs           IN     AAAA   fe80::2e0:4cff:fe17:5a0c

pi-zero       IN     A      192.168.178.31
pi-zero       IN     AAAA   fe80::3685:8702:6aba:3a04

pmg           IN     A      192.168.178.76
pmg           IN     AAAA   fe80::8462:90ff:fe71:cfd6
