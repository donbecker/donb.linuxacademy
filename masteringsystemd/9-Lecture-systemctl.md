* Intro to Unit Files
    * systemd deals with everything as units
    * a unit is denoted as "something.unit"
        * unit types: service, timer, mount, target, automount, scope, snapshot, path, socket, swap, device, slice
        * unit instance examples: session-3.scope, user.slice, dbus.socket
* systemctl command
    * status: show status of a unit instance, if no unit instance specified, shows system status
    * enable: set a service to start on system boot
    * disable: prevent a service from starting on system boot
* chkconfig command (legacy Redhat): will still work to manage services, redirects to systemctl 
* using apache to understand systemd services
    * CentOS7 machine
    * `sudo yum -y install httpd`
    * examine systemd files in install package
        * `rpm -ql httpd | grep system`
    * view status (note this defaults to service)
        * `systemctl status httpd.service`    
        * examine status output
            * `Active: inactive (dead)`: service is off
            * `Docs...` man pages
            * `Loaded: ... disabled`: service is disabled on boot
            * `Loaded: ... vendor preset: disabled`: service is disabled on boot by default during install
    * enable service
        * `systemctl enable httpd.service`
            * creates a symlink to enable service and reloads systemd state
            * service will now start on boot
    * disable service
        * `systemctl disable httpd.service`
            * disables symlink to enable service and reloads systemd state
            * service will no longer start on boot
    * show system status
        * `systemctl status`
    * show status of all systemd units
        * `systemctl`
    * start a unit
        * `systemctl start httpd.service`
    * stop a unit
        * `systemctl stop httpd.service`
    * open all man pages for unit
        * `systemctl help httpd.service`
    * remotely control units on a remote computer via IPv4 or hostname
        * `systemctl -H 10.10.220.1 status httpd.service`