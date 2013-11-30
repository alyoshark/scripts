#!/usr/bin/env bash

# The virtual machine has to have Ports opened and sshd started
# sudo systemctl start sshd.service
# sudo echo "Port 22" > /etc/sshd_config
# sudo echo "Port 9422" > /etc/sshd_config

# Gets the IP of virtual machine
macaddr=`sudo virsh dumpxml "$1" | grep 'mac address' | cut -d\' -f2`
ipaddr=`arp | grep "$macaddr" | cut -d' ' -f1`

echo "$ipaddr"

# And we can now happily ssh to it :)
if [[ "$2" -eq "ssh" ]]; then
    ssh -X "$ipaddr"
fi
