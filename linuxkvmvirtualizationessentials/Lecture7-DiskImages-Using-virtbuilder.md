# elevate to root

# install
`yum -y install libguestfs-tools-c`

# repo for builder images
www.libguestfs.org/download/builder/

# move to images folder
`cd /var/lib/libvirt/qemu/`

# use virtbuilder to build fedora img (disk)
`virt-builder fedora-23 --root-password password:linuxacademy`

# import the img 
`virt-install --name fedora --ram 1028 --vcpus=1 --disk path=/var/lib/libvirt/qemu/fedora-23.img --import`

