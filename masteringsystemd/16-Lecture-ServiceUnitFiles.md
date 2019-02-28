* Service unit file sections
    * `[Service]`
    * `Type=`: specifies what type of service this is
    * `ExecStart=`: commands and args that will be run when this service is activated
        * `[Install]`: information about the service's installation, only run during enable and disable operations
        * `WantedBy=`: units that will 'want' this unit. Creates a symlink (when enabled) of this service to the target unit's *.wants directory
* Types of Services
    * `simple`: process started by `ExecStart=` is the main process. This is the default if `Type=` is missing and `ExecStart=` is not missing
    * `forking`: process started by `ExecStart=` will be a parent process that will fork into other child processes and the parent process will exit when the child processes are complete
        * use with `PIDFile=` option so systemd can track the parent process
    * `oneshot`: process will have to exit before systemd will start other follow-up units. This is the default if both `Type=` and `ExecStart=` are missing
    * `dbus`: indicates the service will have a name for it on the D-Bus bus, name specified by `BusName=`
    * `notify`: will send notify signal to systemd after it finishes starting up, then systemd will start followup units 
    * `idle`: delayed startup (up to 5 seconds)
* States of Services
    * `Active`: started, bound, plugged in, the service is running
    * `Inactive`: stopped, unbound, unplugged, service is not running
    * `Failed`: process is inactive and has failed, and/or the process has returned with an error code
`systemctl enable <name>.service`: enable <name> service to start when current target starts
`systemctl disable <name>.service`: disable <name> service from starting when current target starts
`systemctl list-units -t service`: list all active service units in current target
`systemctl is-enabled <name>.service`: returns whether a service is enabled or disabled in current target
`systemctl start <name>.service`: starts a service unit
`systemctl stop <name>.service`: stops a service unit
`systemctl restart <name>.service`: reestarts a service unit
`systemctl reload <name>.service`: triggers service to reload its configuration file 
`systemctl status <name>.service`: shows status of service
`systemctl is-active <name>.service`: returns whether a service is active or not
`systemctl mask <name>.service`: creates a symlink of the service unit file to `/dev/null` so it will not start (even if `systemctl start` is used)
`systemctl unmask <name>.service`: removes the symlink created by `systemctl mask <name>.service`, service can then be started again