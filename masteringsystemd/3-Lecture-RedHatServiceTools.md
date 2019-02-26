* Older functions being phased out (duplicated by systemd) of RedHat, Fedora and CentOS
* chkconfig
    * enable/disable service running during system boot
        * disable bluetooth service, runlevel 3: `chkconfig --level 3 bluetooth off`
    * verify what runlevel a service will start in
        * list an individual service: `chkconfig --list bluetooth`
        * list all services: `chkconfig --list`
* service
    * runs a sysvinit script to manage a service (start, stop, reload, etc)
    * restart apache: `service httpd restart`
    * show status of apache: `service httpd status`
* ntsysv
    * textual user interface for enabling/disabling services within the current runlevel
* runlevel  
    * returns the current runlevel