#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

ip route replace default via 10.67.16.57
ip route replace blackhole 10.67.0.0/19
ip route replace 10.67.14.0/25 via 10.67.16.57
ip route replace 10.67.0.0/22 via 10.67.16.34
for n in 10.67.8.0/23 10.67.15.192/26; do ip route replace $n via 10.67.16.35; done
for n in 10.67.4.0/22 10.67.16.40/29 10.67.16.88/30; do ip route replace $n via 10.67.16.36; done
for n in 10.67.12.0/24 10.67.13.0/24 10.67.15.64/26; do ip route replace $n via 10.67.16.62; done
for n in 10.67.10.0/23 10.67.14.128/25 10.67.15.0/26 10.67.15.128/26 10.67.16.0/27 10.67.16.48/29 10.67.16.68/30 10.67.16.72/30 10.67.16.76/30 10.67.16.80/30 10.67.16.84/30; do ip route replace $n via 10.67.16.66; done
