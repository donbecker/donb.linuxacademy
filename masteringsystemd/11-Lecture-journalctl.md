* journalctl commands
    * `journalctl`: starting from oldest
    * `journalctl -r`: starting from most Recent
    * `journalctl -e`: jumps to the End
    * `journalctl -n X`: last X entries
    * `journalctl -f`: shows most recent and follows the logs
    * `journalctl -u` Y: shows entries from unit Y only
    * `journalctl -o verbose`: shows all info for each log entry (verbose)
    * `journalctl -o json-pretty`: json output
    * `journalctl -x`: include additional log info from service catalog where available
    * `journalctl -k`: only show kernel level messages, similar to the old `dmesg` command
    * `journalctl -b`: show all entries since last boot
    * `journalctl --list-boots`: list all recorded boot sessions
    * `journalctl --since <date>`: list entries from certain date forward
    * `journalctl --disk-usage`: show disk usage of journal
    * `journalctl --rotate`: rotates journal files, does not return until the rotation is completed
* `echo "hello journal" | systemd-cat`: manually add journal entry