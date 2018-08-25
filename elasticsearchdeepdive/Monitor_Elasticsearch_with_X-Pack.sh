
## on monitor cluster

# elevate to root
sudo su - 

# update config
vim /etc/elasticsearch/elasticsearch.yml

# bind to local and site to allow other clusters to send monitor info to it
# change this
#network.host: 192.168.0.1
# to this
network.host: [ _local_, _site_ ]

#enable xpack monitoring
# change this
xpack.monitoring.enabled: false
# to this
xpack.monitoring.enabled: true

#enable cluster to monitor other clusters
# add line below
xpack.monitoring.collection.enabled: true

# restart ES 
systemctl restart elasticsearch


## on cluster to be monitored

# elevate to root
sudo su - 

# update config
vim /etc/elasticsearch/elasticsearch.yml

#enable xpack monitoring
# change this
xpack.monitoring.enabled: false
# to this
xpack.monitoring.enabled: true

#enable cluster to send monitor data to other clusters
# add line below
xpack.monitoring.collection.enabled: true
# add lines below, with private IP of monitor cluster
xpack.monitoring.exporters:
  1:
    type: http
    host: "http://<privateip>:9200"

# restart ES 
systemctl restart elasticsearch    