* Getting rid of shell scripts
    * init and parts of upstart relied on Bash scripts
    * systemd replaces the functionality of the shell scripts with compiled C code called Unit Files
    * still compatible with older System V Init scripts (they can still be used)
* Unit File locations
    * `/usr/lib/systemd/system`: provided by package installations (do not edit)
    * `/etc/systemd/system`: location for sys admin unit files, overrides `/usr/lib/systemd/system` files
    * `/run/systemd/system`: runtime unit files
    * list all unit files on a server: `systemctl list-unit-files`
* Components of the Unit File
    * `[Unit]`: indicates a unit file
    * `Description=Multi-User System`: simple description
    * `Documentation=man:systemd.special(7)`: man pages
    * `Requires=basic.target`: units that will be activated when this unit is activated
    * `Wants=foo.target`: works like `Requires` except a failure of the `Wants` will not stop this unit from activating
    * `Conflicts=rescue.service rescue.target`: units that cannot be running while this unit is active
    * `After=basic.target rescue.service rescue.target`: this unit file must be started after the units listed here
* View a unit file: `systemctl cat something.unit`
* Modifying Unit Files
    * modifications must be in `/etc/systemd/system`
    * Unit files can be either be complete copies that are modified or drop-in (only include overrides)
* Drop-in Unit Files (manual)
    * Create a directory in `/etc/systemd/system` with the name of the unit followed by `.d`
        * example: `/etc/systemd/system/httpd.service.d/`
    * In the directory, create a .conf file that contains changes, with `AddaExecStart=` line
* Drop-in Unit Files (via edit command)
    * `systemctl edit <unit>`: will create directory and conf file
    * `systemctl edit --full <unit>`: will create directory and full override file
* View differences between original and modified unit files: `systemd-delta`
* Reloading systemd Unit Files
    * After ANY modification to a unit file (drop-in or full override) we must reload: `systemctl daemon-reload`
    * This will re-run all of systemd's dependency generators on all unit files on the server