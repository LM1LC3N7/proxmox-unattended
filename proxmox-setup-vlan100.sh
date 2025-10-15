#!/bin/bash
cat <<EOF > /etc/network/interfaces.d/management
auto enp1s0.100
iface enp1s0.100 inet static
    address 10.15.100.100/24
    gateway 10.15.100.100.1
    vlan-raw-device enp1s0

auto vmbr0
iface vmbr0 inet static
    address 10.15.100.100.21/24
    bridge-ports enp1s0.100
    bridge-stp off
    bridge-fd 0
EOF
systemctl restart networking
