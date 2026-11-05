#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

ip route replace 10.67.0.0/19 via 10.67.16.58
command -v iptables >/dev/null || { apk update && apk add iptables; }
iptables -t nat -C POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || \
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
