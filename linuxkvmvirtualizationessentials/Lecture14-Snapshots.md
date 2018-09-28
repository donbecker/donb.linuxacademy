# virtmanager internal snapshot limitations  
* drive must be in the qcow2 format
* vm must be paused

# external snapshot (copy on write)
* when a snapshot is taken, the original image becomes readonly
* new overlay image create for writes
* overlay is qcow2 image format

# list all virtual machines
`virsh list --all`

# list all snapshots for vm "myvm"
`virsh snapshot-list myvm`

# pause machine and create internal snapshot for vm "myvm"
`virsh snapshot-create myvm`

# convert raw image "myimage.img" to qcow2
`qemu-img convert -f raw -0 qcow2 myimage.img myimage.qcow2`

# revert to snapshot "1474480552" for vm "myvm"
`virsh snapshot-revert myvm --snapshotname "1474480552"`


