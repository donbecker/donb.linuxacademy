# generate certs

# elevate to root
sudo su - 

# create cert dir
mkdir /etc/elasticsearch/certs

# change to cert dir
cd /etc/elasticsearch/certs

# create certs
/usr/share/elasticsearch/bin/elasticsearch-certutil cert

# change owner of cert
chown elasticsearch /etc/elasticsearch/certs/elastic-certificates.p12

# update elasticsearch config
vim /etc/elasticsearch/elasticsearch.yml

# enable xpack security
# update 
xpack.security.enabled: false
# to
xpack.security.enabled: true

# add lines
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate 
xpack.security.transport.ssl.keystore.path: certs/elastic-certificates.p12 
xpack.security.transport.ssl.truststore.path: certs/elastic-certificates.p12
# end enable xpack security

# enable audit logging
# add lines
xpack.security.audit.enabled: true
# end enable audit logging

# restart elasticsearch
systemctl restart elasticsearch

# update passwords for builtin accounts
/usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive

#User: elastic
#Password: elastic123

#User: kibana
#Password: kibana123

#User: logstash_system
#Password: logstash123

#User: beats_system
#Password: beats123

# reconfig kibana to use kibana user/pass
vim /etc/kibana/kibana.yml

# update
#elasticsearch.username: "user"
#elasticsearch.password: "pass"
# to
elasticsearch.username: "kibana"
elasticsearch.password: "kibana123"

# restart kibana
systemctl restart kibana

# log into kibana via ui, using elastic user above
http://127.0.0.1:5601/app/kibana

# create read only role for bank index
# management > roles > create role
#Name: account_reader
#Index Privileges: bank
#Privileges: read

# create user for new role
# management > users > create user
#Username: test_user
#Password: test123
#Full Name: Test User
#Email: test_user@onlinebank.com
#Roles: account_reader