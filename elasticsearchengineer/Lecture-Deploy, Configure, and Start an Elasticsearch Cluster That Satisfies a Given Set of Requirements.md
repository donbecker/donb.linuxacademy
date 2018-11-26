* Spin up 3 CentOS 7 servers
* Log into server 1
* Install Java
    * `sudo yum install -y java-1.8.0-openjdk`
* Add elastic user
    * `sudo useradd elastic`
* Confirm user created by listing home directory
    * `ll /home/elastic`
* Configure the file open limit
    * `sudo vim /etc/security/limits.conf`
    * add line at bottom
        * `elastic - nofile 65536`
* Configure the memory map limit
    * `sudo vim /etc/sysctl.conf`
    * add line at bottom
        * `vm.max_map_count = 262144`
    * reload sysctl config changes
        * `sudo sysctl -p`
* install elasticsearch via archive method
    * switch to elastic user
        * `sudo su - elastic`
    * change to home dir
        * `cd /home/elastic/`
    * download Elasticsearch
        * `curl -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz`
    * untar
        * `tar -xzvf elasticsearch-6.2.4.tar.gz`
    * change dir name
        * `mv elasticsearch-6.2.4/ elasticsearch`
    * change to es dir
        * `cd elasticsearch`
    * start es
        * `./bin/elasticsearch -d -p pid`
    * view server es log
        * `less logs/elasticsearch.log`
    * view es endpoint
        * `curl localhost:9200`
    * kill es process
        * `kill `cat pid` `
* Set up Server 2
    * Install Java
        * `sudo yum install -y java-1.8.0-openjdk`
    * Add elastic user
        * `sudo useradd elastic`
    * Confirm user created by listing home directory
        * `ll /home/elastic`
    * Configure the file open limit
        * `sudo vim /etc/security/limits.conf`
        * add line at bottom
            * `elastic - nofile 65536`
    * Configure the memory map limit
        * `sudo vim /etc/sysctl.conf`
        * add line at bottom
            * `vm.max_map_count = 262144`
        * reload sysctl config changes
            * `sudo sysctl -p`
    * install elasticsearch via archive method
        * switch to elastic user
            * `sudo su - elastic`
        * change to home dir
            * `cd /home/elastic/`
        * download Elasticsearch
            * `curl -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz`
        * untar
            * `tar -xzvf elasticsearch-6.2.4.tar.gz`
        * change dir name
            * `mv elasticsearch-6.2.4/ elasticsearch`
        * change to es dir
            * `cd elasticsearch`
* Set up Server 3
    * Install Java
        * `sudo yum install -y java-1.8.0-openjdk`
    * Add elastic user
        * `sudo useradd elastic`
    * Confirm user created by listing home directory
        * `ll /home/elastic`
    * Configure the file open limit
        * `sudo vim /etc/security/limits.conf`
        * add line at bottom
            * `elastic - nofile 65536`
    * Configure the memory map limit
        * `sudo vim /etc/sysctl.conf`
        * add line at bottom
            * `vm.max_map_count = 262144`
        * reload sysctl config changes
            * `sudo sysctl -p`
    * install elasticsearch via archive method
        * switch to elastic user
            * `sudo su - elastic`
        * change to home dir
            * `cd /home/elastic/`
        * download Elasticsearch
            * `curl -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz`
        * untar
            * `tar -xzvf elasticsearch-6.2.4.tar.gz`
        * change dir name
            * `mv elasticsearch-6.2.4/ elasticsearch`
        * change to es dir
            * `cd elasticsearch`
* Set up Cluster
    * Log into Server 1
        * Configure ES
            * `vim config/elasticsearch.yml`
            * change cluster name
                * `cluster.name: linux_academy`
            * change node name
                * `node.name: master`
            * change default attribute
                * `node.attr.zone: 1`
            * set node to be master
                * `node.master: true`
            * disable data role
                * `node.data: false`
            * enable ingest role
                * `node.ingest: true`
            * update bind addresses
                * `network.host: [_local_, _site_]`
            * add other nodes to discovery (private IP's)
                * `discovery.zen.ping.unicast.hosts: ["172.31.98.86", "172.31.23.57"]`
            * set minimum master nodes
                * `discovery.zen.minimum_master_nodes: 2`
        * Configure Java
            * `vim config/jvm.options`
            * update jvm memory
                * `-Xms256m`
                * `-Xmx256m`
    * Log into Server 2
        * Configure ES
        * `vim config/elasticsearch.yml`
        * change cluster name
            * `cluster.name: linux_academy`
            * change node name
                * `node.name: data1`
            * change default attributes
                * `node.attr.zone: 2`
                * `node.attr.temp: hot`
            * set node to be master
                * `node.master: true`
            * enable data role
                * `node.data: true`
            * disable ingest role
                * `node.ingest: false`
            * update bind addresses
                * `network.host: [_local_, _site_]`
            * add other nodes to discovery (private IP's)
                * `discovery.zen.ping.unicast.hosts: ["172.31.111.168", "172.31.23.57"]`
            * set minimum master nodes
                * `discovery.zen.minimum_master_nodes: 2`
    * Log into Server 3
        * Configure ES
        * `vim config/elasticsearch.yml`
        * change cluster name
            * `cluster.name: linux_academy`
            * change node name
                * `node.name: data2`
            * change default attributes
                * `node.attr.zone: 3`
                * `node.attr.temp: warm`
            * set node to be master
                * `node.master: true`
            * enable data role
                * `node.data: true`
            * disable ingest role
                * `node.ingest: false`
            * update bind addresses
                * `network.host: [_local_, _site_]`
            * add other nodes to discovery (private IP's)
                * `discovery.zen.ping.unicast.hosts: ["172.31.111.168", "172.31.98.86"]`
            * set minimum master nodes
                * `discovery.zen.minimum_master_nodes: 2`
* Start ES cluster
    * Log into Server 1
        * Start ES in background, with pid
            * `./bin/elasticsearch -d -p pid`
        * Output pid file to show process ID
            * `cat pid`
        * Show ES logs for linux_academy cluster
            * `less logs/linux_academy.log`
            * will show `not enough master modes discovered during pinging`
    * Log into Server 2
        * Start ES in background, with pid
            * `./bin/elasticsearch -d -p pid`
        * Output pid file to show process ID
            * `cat pid`
        * Show ES logs for linux_academy cluster
            * `less logs/linux_academy.log`
            * will show `detected master` (server 1 log will also show this)
        * list nodes
            * `curl localhost:9200/_cat/nodes?v`
    * Log into Server 3
        * Start ES in background, with pid
            * `./bin/elasticsearch -d -p pid`
        * Output pid file to show process ID
            * `cat pid`
        * Show ES logs for linux_academy cluster
            * `less logs/linux_academy.log`
            * will show `detected master`
        * list nodes
            * `curl localhost:9200/_cat/nodes?v`
* Install Kibana on master
    * Log into Server 1
        * cd to home dir
            * `~`
        * d/l Kibana
            * `curl -O https://artifacts.elastic.co/downloads/kibana/kibana-6.2.4-linux-x86_64.tar.gz`
        * untar
            * `tar -xzvf kibana-6.2.4-linux-x86_64.tar.gz`
        * delete tarfile
            * `rm kibana-6.2.4-linux-x86_64.tar.gz`
        * rename dir
            * `mv kibana-6.2.4-linux-x86_64 kibana`