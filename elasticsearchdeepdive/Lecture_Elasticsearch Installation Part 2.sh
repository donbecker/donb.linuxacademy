1. Install Elasticsearch

# elevate to root
sudo su -
# create new repo file
vim /etc/yum.repos.d/elastic_stack.repo
#file content
[elastic_stack-6.x]
name=Elastic Stack repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
#end file content
# install java and elasticsearch
yum install java-1.8.0-openjdk elasticsearch -y
#enable elasticsearch
systemctl daemon-reload
systemctl enable elasticsearch


# start elasticsearch
systemctl start elasticsearch
# check service status
systemctl status elasticsearch
# check default log
less /var/log/elasticsearch/elasticsearch.log
# return version info
curl localhost:9200

2. Install Kibana
# install kibana
sudo yum install kibana -y
# enable 
sudo systemctl enable kibana
# start
sudo systemctl start kibana
# view default kibana log
sudo less /var/log/messages
# view default config for kibana
sudo less /etc/kibana/kibana.yml



master node private IP: (priIP)

3. Config data only node

vim /etc/elasticsearch/elasticsearch.yml

cluster.name: linux_academy
node.name: dataX
node.master: false
node.data: true
network.host: [_local_, _site_]
discovery.zen.ping.unicast.hosts: ["(priIP)"]


systemctl start elasticsearch







