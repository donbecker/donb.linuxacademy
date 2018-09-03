# create user
sudo useradd elasticsearch
# install dir
sudo mkdir -p /opt/elasticsearch/node1
# set owner
sudo chown -R elasticsearch:elasticsearch /opt/elasticsearch/
# switch user
sudo su - elasticsearch
# switch dir
cd /opt/elasticsearch/node1/
# download es
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz
# untar
tar -xzf elasticsearch-6.2.4.tar.gz
# change dir
cd elasticsearch-6.2.4
# run es locally from command line (will fail due to missing java)
./bin/elasticsearch
# search for available jdk
yum search jdk
# exit elasticsearch user
exit
# install jdk
sudo yum install java-1.8.0-openjdk -y
# switch user
sudo su - elasticsearch
# switch dir
cd /opt/elasticsearch/node1/elasticsearch-6.2.4
# run es locally from command line
./bin/elasticsearch
# exit service
CTRL+Z
# run in background
bg
# verify running
pgrep -u elasticsearch
# get version info on http endpoint
curl localhost:9200







