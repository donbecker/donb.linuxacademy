# switch to root

# create harddisk image
`qemu-img create -f raw -o size=10G /var/lib/libvirt/qemu/windows7.img`

# verify image created
`ls /var/lib/libvirt/qemu/`

# create vm
`virt-install --name Windows1 --ram 1024 --disk path=/var/lib/libvirt/qemu/windows7.img --vcpus 1 --os-type=Windows --network bridge=virbr0 --graphics vnc,port=5999 --console pty,target_type=serial --cdrom /(path)/en_windows_7_professional_with_sp1_x64_dvd_u_676939.iso`

