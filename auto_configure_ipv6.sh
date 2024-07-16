#!/bin/bash

# Cấu hình IPv6
IPV6_ADDRESS="2400:6180:0:d0::13:9001"
IPV6_NETMASK="64"
IPV6_GATEWAY="2400:6180:0:d0::1"

# Kiểm tra xem địa chỉ IPv6 đã được gán chưa
if ! ip -6 addr show dev eth0 | grep -q "$IPV6_ADDRESS"; then
    echo "Gán địa chỉ IPv6 cho eth0..."
    sudo ip -6 addr add "$IPV6_ADDRESS/$IPV6_NETMASK" dev eth0
    sudo ip -6 route add default via "$IPV6_GATEWAY" dev eth0
    echo "Địa chỉ IPv6 đã được gán thành công."
else
    echo "Địa chỉ IPv6 đã được gán trước đó."
fi

# Kiểm tra lại địa chỉ IPv6 đã được gán thành công chưa
ip -6 addr show dev eth0
