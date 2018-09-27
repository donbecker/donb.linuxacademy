# nat mode
# all vm traffic is nat-ed thru the bridge
# to outside world, vm's have ip of host
# libvirt runs dns and dncp server (dnsmasq)

# routed mode
# all vm's have ip in same cidr range as host
# outside world can directly hit the vms from their ip

# isolated mode
# all vm's can communicate to each other
# vm's and host cannot communicate
# public traffic cannot communicate to vms
# vms cannot connect out

