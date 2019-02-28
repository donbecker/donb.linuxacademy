* Containers - systemd style
    * not meant to compete with other container tech, provided for different use cases
    * Systemd containers: containers that can have an init system (systemd) within them
        * Provides ability to run more than one service within container, instead of multiple containers
        * Full OS in container, but faster (no separate file system, BIOS, device drivers, etc)
        * Containers run as a system service
            * Ex: container "bar" would show as "systemd-nspawn@bar.service"
* `systemd-nspawn`: works as a container manager for containers running in systemd
    * minimal container manager built into systemd
* How to build a systemd container
    * Place an OS tree in `/var/lib/machines/<name>`
        * "OS tree" is a git repo for machine images
    * Start up with `systemd-nspawn -M <name>`
    * Keep container permanent: `machinectl enable <name>`
* Getting OS tree images
    * image formats can be raw disk images, btrfs subvolumes, compressed tarballs or a pre-built directory structure that mimics an OS installation
    * using machinectl: `machinectl pull-raw --verify=checksum https://example.com/example-os.raw.gz`
    * fedora can use dnf
        * ex: `dnf -y --releasever=27 --installroot=/var/lib/machines/f27 install systemd passwd dnf vim-minimal`
    * redhad can use yum
        * ex: `yum -y --releasever=7Server. --installroot=/var/lib/machines/rhel7 install systemd passwd yum vim-minimal redhat-release`
    * tools are also available for debian, ubuntu and arch linux
* Managing Containers
    * enable: `systemctl enable systemd-nspawn@<name>`
    * start: `systemd-nspawn -D /var/lib/machines/<name>`
    * caveats
        * on redhat based systems (redhat, centos, fedora) SELinux will need to be in permissive mode (`setenforce 0`)
        * on debian systems, dbus will need to be installed
        * `/etc/securetty` needs to be removed or renamed in the container
* `machinectl` command list
    * `machinectl list`: list out containers on the system
    * `machinectl login <name>`: log into running container
    * `machinectl status <name>`: status of a container
    * `machinectl reboot <name>`: reboot a running container
    * `machinectl poweroff <name>`: power off a running container
    * `machinectl start <name>`: power on a container
    * `machinectl enable <name>`: enable a container to start when the host system starts
    * `machinectl remove <name>`: removes a container from the system