#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

ip route replace default via 10.67.16.69
for n in 10.67.15.0/26 10.67.15.128/26 10.67.16.0/27 10.67.16.48/29 10.67.16.76/30 10.67.16.80/30 10.67.16.84/30; do ip route replace $n via 10.67.16.74; done
