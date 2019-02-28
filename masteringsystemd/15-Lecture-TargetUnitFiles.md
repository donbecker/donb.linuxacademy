* Purpose of a systemd Target
    * A unit that syncs up other units when the computer boots or changes states
    * Other units associate themselves with a target
* Types of Targets
    * multi-user.target: multi-user system, similar to init runlevel 3 (commandline shell, networking, multi-user)
    * graphical.target: multi-user system, similar to init runlevel 5 (desktop, networking, multi-user)
    * rescue.target: single-user system, similar to init runlevel 1, provides rescue shell
    * basic.target: using during boot process only before switching to another target
    * sysinit.target: what is first used when systemd starts
* `systemctl list-unit-files -t target`: shows all unit files for available targets
* `systemctl list-units -t target`: shows all loaded and active target unit files
* `systemctl get-default`: shows the default target
* `systemctl set-default`: sets the default target
* `systemctl isolate <target>`: will change the running state of the system from current target to a different target
* `systemctl rescue`: switch to rescue.target
* `systemctl reboot`: runs the reboot target, identical to running `reboot`
* `systemctl poweroff`: will perform a complete shutdown by switching to the poweroff.target, identical to running `poweroff`