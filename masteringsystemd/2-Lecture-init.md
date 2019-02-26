* init Background
    * init - short for "initialization"
    * based off System V used in Unix
    * sysvinit - Written by Miquelvan Smoorenburg
    * Services are started one after the other, in serialized fashion
        * was done for simplicity, but delays in startup could cause hangs
* how init works
    * after kernel loads initial ram disk, looks for an initialization system to hand control to
    * first place it looks for is `/sbin/init`, and kernel starts it, at this point init is in control
    * init first reads configuration settings in `/etc/inittab` to determine the runlevel and other config
        * init runlevels
            * 0: Halt
            * 1: Single user Mode
            * 2: Multi-user mode (no networking)
            * 3: Multi-user mode (with networking)
            * 4: unused
            * 5: Multi-user, with networking and a graphical desktop
            * 6: Reboot
        * inittab file format
            * <identifier>:<runlevel>:<action><process>
            * example of default runlevel 3 entry
                * `id:3:initdefault`
            * example of startup script (no runlevel due to startup script)
                * `si::sysinit:/etc/rc.d/rc.sysinit`
            * operating runlevel entry example
                * `l3:3:wait:/etc/rc.d/rc 3`
            * "rc" means "run commands"   
            * `rc.sysinit` script does some set up prior to run level scripts
            * `rc.local` typically used by admin to set up or run processes without their own init scripts
            * `rc.` script orchestrates how the runlevel scripts run and what occurs when a runlevel changes
            * init runlevel script directories 
                * init scripts on RedHat/CentOS: `/etc/rc.d`
                * init scripts on Debian based: `/etc/init.d`
                * contain directories for each run level (rc0.d, rc1.d, etc)
                * within each runlevel directory are symlinks to services, which are located in `/etc/rc.d` or `/etc/init.d`
                    * starting with `K` means that service will be killed
                    * starting with `S` means that service will be started
                    * following `K` or `S` is a two digit number, representing order run
    * init overall boot sequence:
        * `/sbin/init`
        * `/etc/inittab`
        * `/etc/rc.d/rc.sysinit`
        * `/etc/rc.d/rcX.d` (where X is runlevel) (scripts run in sequential order)
        * user login