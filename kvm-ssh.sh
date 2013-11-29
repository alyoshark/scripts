# The virtual machine has to have Ports opened and sshd started
# sudo systemctl start sshd.service
# sudo echo "Port 21" > /etc/sshd_config

# Gets the IP of virtual machine
addr=`arp -an | grep virbr | cut -d'(' -f2 | cut -d')' -f1`

# And we can now happily ssh to it :)
ssh -X "$addr"
