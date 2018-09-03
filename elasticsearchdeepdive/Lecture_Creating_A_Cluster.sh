## Master

sudo su -
java -version
systemctl status elasticsearch
cd /etc/elasticsearch/
ll

# edit ES config
vim elasticsearch.yml

# cluster name
cluster.name: my_cluster
# node name
node.name: master
# node is master
node.master: true
# node is not data
node.data: false
# set network
network.host: [_local_, _site_]

# start ES
systemctl start elasticsearch

# view log
less /var/log/elasticsearch/(clustername).log

# check node info on local endpoint
curl localhost:9200


## Data

# edit ES config
vim elasticsearch.yml

# cluster name
cluster.name: my_cluster
# node name 
node.name: data1
# node is not master
node.master: false
# node is data
node.data: true
# set network
network.host: [_local_, _site_]
# add master private IP
discovery.zen.ping.unicast.hosts: ["masterprivip"]
# set min master notes
# if 3 masters, set to 2
# if 5 masters, set to 3
#discovery.zen.minimum_master_nodes: 2

# start ES
systemctl start elasticsearch

# view log
# should say "detected_master"
less /var/log/elasticsearch/(clustername).log

# list nodes
curl localhost:9200/_cat/nodes

# list nodes with more info
curl localhost:9200/_cat/nodes?v