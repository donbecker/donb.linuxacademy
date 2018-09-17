* using virtualbox
* vm name: centos
* vm type: Linux
* version: red hat (64-bit)
* mem: minium 6GB
* create hard disk
* hard disk file type: VDI
* dynamically allocated
* minimum 25GB
* create vm
* right click, settings
* network tab, select adapter 1
* attached to: bridged adapter
* advanced
* promiscuous mode, allow all
* storage tab, click empty disk
* select image, centos minimal
* click start
* select install
* centos installer starts
* select language english
* select date/time chicago
* click done
* click installation destination
* click done
* click network & host name
* set hostname to `centos.trilliams.cloud`
* click apply
* click the ON button to enable networking
* verify DHCP retrieves IPv4, etc
* click configure
* click ipv4 settings
* click method and change to manual
* under addresses, click add
* add static ipv4, netmask and gateway
* enter dns servers, click save
* click done in network
* click date & time
* verify ntp showing as on
* click ntp settings icon 
* verify all are green
* click done on date & time
* click begin installation
* while install continues
    * set password for root
    * create user
        * name "trilliams"    
        * check "Make this user administrator"
* after install completes, click reboot
* ssh to centos vm directly using IP, "trilliams" user and password
* perm elevate to sudo 
    * `sudo -i`
* update via yum 
    * `yum -y update`
* install packages
    * `yum -y install centos-release-qemu-ev`
* remove existing mariadb libs
    * `yum -y remove mariadb-libs`
* elevate normal user to be able to run sudo commands without prompt
    * `visudo`
    * uncomment
        * `%wheel ALL=(ALL)         NOPASSWD: ALL`
    * save file
* disable SE Linux
    * `vi /etc/selinux/config`
    * change 
        * `SELINUX=enforcing`
        * to
        * `SELINUX=disabled`
    * save file
* disable network manager and firewalld
    * `systemctl disable NetworkManager firewalld`
* reboot server to make all changes take affect
* list versions of openstack
    * `yum search openstack`
* install openstack repos via yum
    * `sudo yum -y install centos-release-openstack-ocata`    
* install packstack
    * `sudo yum -y install openstack-packstack`
* generate answerfile
    * `packstack --gen-answer-file=/home/trilliams/answers.txt`
* update answerfile
    * set default password
        * `CONFIG_DEFAULT_PASSWORD=openstack`
    * enable heat
        * `CONFIG_HEAT_INSTALL=y`
    * enable magnum
        * `CONFIG_MAGNUM_INSTALL=y`
    * optionally enable ironic (bare metal install)
        * `CONFIG_IRONIC_INSTALL=y`
    * change keystone admin password
        * `CONFIG_KEYSTONE_ADMIN_PW=openstack`            
    * change keystone demo password
        * `CONFIG_KEYSTONE_DEMO_PW=demo`
    * save file
* start packstack
    * `packstack --answer-file=/home/trilliams/answers.txt
    * enter root password when prompted
    * (may take up to 25m)
* navigate to dashboard in browser
    * (ip)/dashboard
* login using admin creds
    



