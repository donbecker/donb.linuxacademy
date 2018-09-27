# list all vms (running only) 
`virsh list`

# list all vms (in any state)
`virsh list --all`

# power on the "Test1" vm
`virsh start Test1`

# shut down the "Test1" vm
`virsh shutdown Test1`

# reboot the "Test1" vm
`virsh reboot Test1`

# suspend (pause) the "Test1" vm
`virsh suspend Test1`

# resume the (suspended/paused) "Test1" vm
`virsh resume Test1`

# open vm in virt-viewer app for the "Test1" vm
`virt-viewer Test1`
