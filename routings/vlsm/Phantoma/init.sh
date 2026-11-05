#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

ip route replace default via 10.67.16.81
ip route replace 10.67.15.0/26 via 10.67.16.86
