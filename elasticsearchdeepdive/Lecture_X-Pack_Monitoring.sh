# X-Pack Monitoring is the only X-Pack plugin that is free (version 6.3 onward)
# only self-monitoring is free, remote monitoring requries a license

# xpack.monitoring.collection.enabled: true

# elevate to root
sudo su -
# edit file
vim /etc/elasticsearch/elasticsearch.yml
# add to file
xpack.monitoring.enabled: true
xpack.monitoring.collection.enabled: true

# restart es
systemctl restart elasticsearch