# list all networks
`virsh net-list --all`

# show xml file of the network
`virsh net-dumpxml isolated`

# default location networks are stored
`/etc/libvirt/qemu/networks/`

# start a currently stopped network named "isolated"
`virsh net-start isolated`
