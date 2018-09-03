1. Master Node: 

# switch to root
sudo su - 
# install java
yum install java-1.8.0-openjdk -y
# import gpg key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
# download elasticsearch rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.3.rpm
# install
rpm --install elasticsearch-6.2.3.rpm
# daemon reload
systemctl daemon-reload
# set es to start on boot
systemctl enable elasticsearch
# config es jvm
vim /etc/elasticsearch/jvm.options
#change heap from 1g
# -Xms1g
# -Xmx1g
# config es log4j
# vim /etc/elasticsearch/log4j2.properties
# config es node settings
vim /etc/elasticsearch/elasticsearch.yml
# node name
node.name: master1
# turn off data node feature
node.data: false
# set bind address for es (should never be public ip)
network.host: ["localhost", "<privateip>"]
# start es
systemctl start elasticsearch
# check status
systemctl status elasticsearch
# view log 
less /var/log/elasticsearch/elasticsearch.log

2. First data node: 
# switch to root
sudo su - 
# install java
yum install java-1.8.0-openjdk -y
# import gpg key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
# download elasticsearch rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.3.rpm
# install
rpm --install elasticsearch-6.2.3.rpm
# daemon reload
systemctl daemon-reload
# set es to start on boot
systemctl enable elasticsearch
# config es node settings
vim /etc/elasticsearch/elasticsearch.yml
# node name
node.name: data1
# turn off master node feature
node.master: false
# set bind address for es (should never be public ip)
network.host: ["localhost", "<privateip>"]
# set discovery pointer to master node private ip
discovery.zen.ping.unicast.hosts: ["<master privateip>"]
# start es
systemctl start elasticsearch
# check status
systemctl status elasticsearch
# view log 
less /var/log/elasticsearch/elasticsearch.log
# should see "detected_master {<master name>}" in log
# in master log, should see "zen-disco-node-join[{<nodename>}"

3. Second data node: (exactly the same as first, except for node name in config, and private IP)

Check endpoints on master
#default endpoint
curl localhost:9200
#health endpoint
curl localhost:9200/_cluster/health?pretty=true

4. Install Logstash on master
# switch to root
sudo su - 
# download logstash
wget https://artifacts.elastic.co/downloads/logstash/logstash-6.2.3.rpm
# install logstash
# note we already have java prereq installed
rpm --install logstash-6.2.3.rpm
# set ls to start on boot
systemctl enable logstash

# logstash dirs
# pipeline config files
/etc/logstash/conf.d
# jvm config, heap config
/etc/logstash/jvm.options
# log config
/etc/logstash/log4j2.properties
# logstash config
/etc/logstash/logstash.yml
# pipeline config
/etc/logstash/pipelines.yml
# startup options
/etc/logstash/startup.options

# download premade pipeline
wget -O /etc/logstash/conf.d/apache.conf https://github.com/linuxacademy/content-elastic-log-samples/raw/master/apache.conf 

# start logstash
systemctl start logstash
# check status
systemctl status logstash
# check log 
less /var/log/logstash/logstash-plain.log
# verify pipeline started in log
# 'Pipeline started succesfully'

5. Install Filebeat and sample files on master
# switch to root
sudo su - 
# make fake apache dir
mkdir /var/log/apache2
# add sample log data
wget -O /var/log/apache2/access.log https://github.com/linuxacademy/content-elastic-log-samples/raw/master/access.log
# determine line count of log data
wc -l /var/log/apache2/access.log
# d/l filebeat
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.2.3-x86_64.rpm
# install filebeat
rpm --install filebeat-6.2.3-x86_64.rpm
# enable on startup
systemctl enable filebeat

# filebeat config file
vim /etc/filebeat/filebeat.yml
# default log path
# - /var/log/*.log
# additional fields example
# fields:
#  application: app1
# multiline pattern
# java stacktrace example
# match on 4 digit year, 2 digit month, 2 digit day on the log line
# multiline.pattern: ^[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}
# only match the above, don't exclude the above
# multiline.negate: true
# include the lines after the pattern match line
# multiline.match: after

# modules are just prepackaged prospector configs
# outputs are defaulted to elasticsearch, localhost:9200

# connect to ES cluster
# install index templates
# install ingest node pipeline
# tries to connect to local kibana to install visualizations/dashboards for apache and fails
# adds logstash template config to filebeat config file
filebeat setup

# config filebeat to send to logstash instead of elasticsearch
vim /etc/filebeat/filebeat.yml
# comment out elastic search output lines
# uncomment logstash output lines
output.logstash: 
 hosts: ["localhost:5044"]

# enable apache2 filebeat module
filebeat modules enable apache2

# start filebeat
systemctl start filebeat

# filebeat log file
less /var/log/filebeat/filebeat

# tail registry file
tail /var/log/filebeat/registry

# verify new shards
curl localhost:9200/_cluster/health?pretty=true


6. Install Kibana on Master
# switch to root
sudo su - 
# d/l kibana
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.3-x86_64.rpm
# install kibana
rpm --install kibana-6.2.3-x86_64.rpm
# enable kibana service
systemctl enable kibana

# kibana config
vim /etc/kibana/kibana.yml
# default port
# server.port:5601
# default ES
# elasticsearch.url: "http://localhost:9200"

# start kibana
systemctl start kibana
# check status
systemctl status kibana

# see kibana logs in stdoutput
# should see 'Status changed from yellow to green - Ready'
less /var/log/messages

ps -ef | grep kibana

7. access kibana via ssh tunnel from local

ssh user@<master publicip> -L 5601:localhost:5601
54.152.166.140
- putty
- hostname: user@<master publicip>
- Connection -> SSH -> Tunnels
- Add new forwarded port
- Source port: 5601
- Destination: <master publicip>:5601
- Destination: Local
- Destination: Auto
- Click Add

http://localhost:5601/app/kibana

http://54.152.166.140:5601/app/kibana

20:38

vim /etc/kibana/kibana.yml
server.host: "0.0.0.0"
systemctl restart kibana




Windows 10, firewall on, no proxy config for browser needed.
Open PuTTY.
Left Nav -> Session
Host Name: user@<public ip>
Left Nav -> Connection -> SSH -> Tunnels
Source Port: 5601
Destination: 127.0.0.1:5601
Destination: Local
Destination: Auto
Click Add button
Left Nav -> Session
Click Open button
Putty terminal window appears
Enter password for user and hit enter
Leave this window open.
Open browser
Navigate to "localhost:5601/app/kibana"
Profit