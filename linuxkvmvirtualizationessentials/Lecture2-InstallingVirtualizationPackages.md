* dnf or yum 
    * dnf (successor to yum)
        * individual package install
            * dnf install qemu-kvm libvirtd virt-install virt-manager 
        * or group install
            * dnf group install virtualization
        * list dnf group install contents
            * dnf groupinfo virtualization
    * yum -y install qemu-kvm libvirtd virt-install virt-manager 
* ensure libvirtd service has started
    * allows us to use api to interact with qemu-kvm
* enable libvirtd to start on startup 
    * `systemctl enable libvirtd`
* start libvirtd
    * `systemctl start libvirtd`
* check libvirtd status
    * `systemctl status libvirtd`
* ensure system meets virtualization prerequisites
    * `virt-host-validate`
    * all should say PASS
        * hardware virtualization: qemu-kvm is able to run virtual machines (direct access to cpu)
        * device /dev/kvm: direct access to hardware resources
        * device /dev/vhost-net: direct access to network resources
        * device /dev/net/tun: (tunnel/tap device) allows network connectivity for vms
        * Linux >= 2.6.26: linux version
* show virtualization node info
    * `virsh nodeinfo`
* show node capabilities (xml doc)
    * `virsh domcapabilities`