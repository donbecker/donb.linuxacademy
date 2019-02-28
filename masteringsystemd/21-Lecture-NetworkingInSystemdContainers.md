* systemd-nspawn
    * `--private-network`: local, loopback interface only
    * `--network-veth`: a shared virtual ethernet interface between the container and the guest
    * `--network-bridge`: bridge the host's connection to the container
        * specify a bridge to attach to (must already exist on the host)
            * ex: `--network-bridge=container-br`
* Enabling systemd-networkd
    * Install and start systemd-networkd
        * `systemctl enable systemd-networkd.service`
        * `systemctl start networkd.service`
    * Configuration files: `/etc/systemd/network`
        * network connection settings files end with a `.network` extension
        * network device (interface) settings files (for bridges, bonds, etc) end with a `.netdev` extension