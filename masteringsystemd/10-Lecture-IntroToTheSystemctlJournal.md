* systemd Journal
    * what the journal collects
        * kernel log messages
        * system log messages, the same as what syslog would collect
        * system services that send output to standard output and standard error
        * audit records for SELinux messages
    * default location is `/run/log/journal/` which is lost on reboot (not permanent by default)
    * configure journal to be permanent
        * `mkdir -p /var/log/journal`
        * `systemd-tmpfiles --create --prefix /var/log/journal`
* journal configuration file
    * `/etc/systemd/journald.conf`
    * storage settings (`Storage=`)
        * auto: the default, will store data to both /var/log/journal (if it exists) and to /run/log/journal
        * persistent: data is stored to /var/log/journal only
        * volatile: data is only sent to /run/log/journal, resides only in memory
        * none: no data is kept, all log data is dropped
    * compression settings (`Compress=`)
        * yes: the default, any data objects above a certain threshold are compressed before they are written to disk
        * no: no data objects are compressed
    * `SystemMaxUse=`: physical disk space the journal can use, default is 10%
    * `RuntimeMaxUse=`: amount of ram the journal can use, default is 10%
    * `SystemMaxFileSize=`: how large individual journal files can get on disk
    * `RuntimeMaxFileSize=`: how large individual journal files can get in ram
    * `MaxRetentionSec=`: maximum amount of time to store journal entries
        * default is 0 (off)
        * typically previous size options are used instead of this
        * time can be set to a number, followed by the scale: years, months, etc. The default is seconds. 