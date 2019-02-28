* Timer Units are a timer completely controlled by systemd
* Each `.timer` unit file must have a matching `.service` unit file
* Types of timers
    * Monotonic: Meant to be run after a certain amount of time has passed, based on a defined starting point (ex. `OnBootSec=`, `OnActiveSec=`)
    * Realtime: Meant to run based on a calendar event (ex. `OnCalendar=`)
* Why not use cron? systemd timer syntax could be simpler
* Timer Unit Files
    * `[Timer]`
    * `OnBootSec=` or `OnUnitActiveSec=` (monotonic timers)
    * `OnCalendar=` (realtime timer)
    * `Unit=`: the service file, not required and defaults to timer name
    * `[Install]`
    * `WantedBy=timers.target`
`systemctl list-timers --all`: list all timers in the current target
`systemctl cat <name.timer>`: show timer unit file
`systemd-run --on-active=`: creates a timer without a service file