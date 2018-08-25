sudo su - 

ll /usr/share/elasticsearch/bin

cd /etc/elasticsearch

ll

mkdir certs

cd certs

# generate certs for all ES nodes
/usr/share/elasticsearch/bin/elasticsearch-certutil cert --multiple

# install unzip
yum install unzip -yum

# unzip certs
unzip certificate-bundle.zip

# move data certs to temp
mv data* /tmp

cd /tmp

chown user:user data*

exit

cd /tmp/

scp data1/data1.p12 user@<privateip>:/tmp

# delete certs
rm -rf data*

sudo su -

cd /etc/elasticsearch

mv master/master.p12 .

rmdir master

mv master.p12 ./certs
mv certificate-bundle.zip ./certs


### on each data node
sudo su -

mkdir /etc/elasticsearch/certs

mv /tmp/data* /etc/elasticsearch/certs

chown root:elasticsearch /etc/elasticsearch/certs/data*

### end on each data node

## on master node

# verify 30d trial avail
# should return "eligable_to_start_trial":true
curl localhost:9200/_xpack/license/trial_status

# start trial
curl -X POST 'localhost:9200/_xpack/license/start_trial?acknowledge=true'

vim /etc/elasticsearch/elasticsearch.yml

# append to config
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate
xpack.security.transport.ssl.keystore.path: certs/master.p12
xpack.security.transport.ssl.truststore.path: certs/master.p12xpack.security.enabled: true


### on each data node
sudo su -

vim /etc/elasticsearch/elasticsearch.yml

# append to config
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate
xpack.security.transport.ssl.keystore.path: certs/data4.p12
xpack.security.transport.ssl.truststore.path: certs/data4.p12xpack.security.enabled: true

### end on each data node

# restart master node, then all other nodes
systemctl restart elasticsearch

# reset passwords for users
# on master
/usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto

elastic, kibana, logstash_system, beats_system

vim /kibana/kibana.yml

# set es creds
elasticsearch.username: "kibana"
elasticsearch.password: "pass"

# restart kibana
systemctl restart kibana

