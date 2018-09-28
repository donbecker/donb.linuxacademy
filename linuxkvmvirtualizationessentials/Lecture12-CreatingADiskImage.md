# default path for images
`/var/lib/libvirt/images`

# create new disk, 1GB 
`qemu-img create -f raw addondisk1.img 1G`

# list all images
`virsh list --all`

# attach new disk image to existing vm "vmname"
`virsh attach-disk vmname --source /var/lib/libvirt/images/addondisk1.img --target vdc --persistent`

# make file system on new drive (on vm)
`mkfs.ext4 /dev/vdc1`

# mount
`mkdir diskattach`
`mount /dev/vdc1 diskattach/`