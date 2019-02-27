* process management
    * all processes managed in cgroups
        * cgroups (control groups): Linux kernel feature, collections of services that are grouped together in a hierarchy
        * each cgroup can have its resources limited (cpu, ram, etc)
    * slices: groups of services
        * located here: `/sys/fs/cgroup/systemd`
        * `system.slice`: contains the system services, including systemd's services
            * Examples: tmp.mount, crond.service, httpd.service, etc.
        * `user.slice`: user specific services that are running, such as the desktop session. Each user logged in get their own slice.
    * scopes: sets of process, started by other processes but registered with systemd for management
        * systemd does not directly start these processes
        * somthing that systemd starts will fork their processes off into scopes
        * contain runtime params which are dynamic, not execution params which are static (example is a PID)
    * `systemd-cgls` (cgroup list): show hierarchy of how all processes and resources on the system are split up
    * `systemd-cgtop` (cgroup top): shows resource usage by slice, updated live like the `top` command
* bringing up file systems in parallel
    * init would bring up each file system in `/etc/fstab` on at a time, running `fsck` on each one, and all file systems would have to be loaded before a service could be started
    * systemd uses `autofs`, a file system service that only mounts a file system when it is needed
    * systemd sets up an autofs-like mount point to allow a service to get queued to start, then swaps the mount point for the real one once the filesystem is ready