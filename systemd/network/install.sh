#!/bin/sh
ETHER=enp3s0
sed -e "s/en[*]/${ETHER}/g" < ether.network \
    | sudo tee /etc/systemd/network/${ETHER}.network
#sudo systemctl enable systemd-networkd
#sudo apt install systemd-resolved
#sudo apt purge ifupdown -y ; sudo ip link set ${ETHER} down ; sudo systemctl restart systemd-networkd.service
#sudo systemctl restart systemd-resolved.service
