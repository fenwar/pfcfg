#!/bin/sh
ETHER=enp4s0f0
sed -e "s/en[*]/${ETHER}/g" < ether.network \
    | sudo tee /etc/systemd/network/${ETHER}.network
#sudo systemctl enable systemd-networkd
#sudo apt install systemd-resolved
#sudo ip link set ${ETHER} down ; sudo apt purge ifupdown -y ; sudo systemctl restart systemd-networkd.service
