* a brief history of systemd
    * created by Lennart Poettering and Kay Sievers
    * started as a personal side project of Lennart Poettering
    * inspired by both upstart and Apple's launchd
    * initially released March 30, 2010 in Fedora 15
* inspirations for systemd
    * upstart: speeding up boot process by launching services in parallel, with monitoring of services
    * launchd: listens for a socket so that each individual daemon doesn't have to
        * traditional daemons/services require a socket from the daemon/service they depend on before they can start
        * launchd makes all sockets available to all services, services are not opening sockets themselves
        * with launchd providing sockets for all services, there are fewer dependency issues between servcies
* robustness of systemd
    * can queue messages bound for a service if service is unavailable
    * can close unused sockets to save resources (15 sec idle)
* improved system troubleshooting
    * everything that happens on a system is logged
    * including information previously lost during system reboots
    * including data not logged in traditional syslog