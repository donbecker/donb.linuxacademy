* upstart background
    * developed for Ubuntu in 2006 by Scott Remnant
    * first used in Ubuntu 6.10
    * eventually used in RedHat Enterprise 6, Debian and Fedora 9
    * unlike init, upstart can asynchronously start services, decreasing boot times
    * unlike init, works off of real-time events (can monitor service availability as well as start/stop)
* upstart overall boot sequence:
    * `/sbin/init`
    * fires off startup event
        * calls mountall tool, checks drives and loads drivers for hardware
        * calls `/etc/init/rc-sysinit.conf` which checks for the `/etc/inittab` file to run it
            * calls telinit
                * call runlevel to switch to the correct runlevel
                    * note this `runlevel` is not the same as the runlevel in an init/systemV system
                    * calls `/etc/init/rc.conf` passing runlevel to start downstream processes
    * login
* upstart service monitoring
    * init is static, does not natively respond to changes on a system
    * upstart is dynamic and can respond to changes on a system
    * a change on a Linux system is an event
    * events trigger jobs
    * jobs have two categories
        * tasks: will do what is requested of it, then returns to a waiting state when finished
        * services: will not typically start by itself
    * job states/lifecycle
        * waiting: the initial state (not doing anything)
        * starting: the job is about to start
        * running: the job is running
        * stopping: interim state where job has processed the pre-stop configuration, but not yet stopped
        * killed: job is in process of stopping
        * post-stop: job is actually stopped, once done it goes back to waiting state
        * respawning: when something goes wrong and the job quits unexpectedly during running