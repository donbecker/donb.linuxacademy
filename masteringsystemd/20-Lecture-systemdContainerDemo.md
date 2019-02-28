* CentOS 7 server
* download packages
    * `yum -y --releasever=7 --installroot=/var/lib/machines/centos7 install systemd passwd yum vim-minimal redhad-release`
* set SELinux in permissive mode
    * `setenforce 0`
* spawn container
    * `systemd-nspawn -D /var/lib/machines/centos7`
    * prompt inside container appears
* set password for root user in container
    * `passwd`
* fix security 
    * `mv /etc/securetty /etc/securetty.disable`
* exit container
    * `CTRL+]` x3 in 1 second
* enable the container
    * `systemctl enable systemd-nspawn@centos7`
* start the container
    * `machinectl start centos7`
* check status
    * `machinectl status centos7`
* list all running containers
    * `machinectl list`
* log into container
    * `machinectl login centos7`
    * log in with root user (only user in container)
    * run poweroff to turn off and exit
    * to exit without shutting down: `CTRL+]` x3 in 1 second