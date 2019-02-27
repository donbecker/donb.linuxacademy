* Controversy surrounding systemd
    * long history of init usage
    * systemd possibly violates unix principle of keeping things simple
    * systemd use a binary log file format, many existing tools won't work with
    * perception of feature creep
    * not portable outside of linux
* Debian switches to systemd
    * switched in April 2015, affected Ubuntu as well
    * dissenting developers forked Debian and started Devuan    
* OpenRC
    * dependency-base init implementation
    * doesn't replace init, extends it / works with it
    * utilizes cgroups from the kernel to limit resources used by processes
    * default on: Gentoo Linux and Alpine Linux
* runit
