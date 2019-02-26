* Computer starts
* Bios checks all hardware, input/output devices
* Boot process begins
    * Boot sector on first drive (boot loader)
    * Boot loader loads the Linux kernel
    * Linux kernel loads the inital ram disk
    * Initial ram disk contains device drivers
    * Linux kernel then starts the Initialization System
    * Initialization system mounts filesystems from drives
    * Initial ram disk is no longer needed, and is removed
    * Initialization system loads/starts services