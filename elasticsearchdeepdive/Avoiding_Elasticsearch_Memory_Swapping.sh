
# elevate to root
sudo su - 

# enable memory locking
vim /etc/elasticsearch/elasticsearch.yml

# update
#bootstrap.memory_lock: true
# to 
bootstrap.memory_lock: true

# override system memory limit
systemctl edit elasticsearch

# override file contents
[Service]
LimitMEMLOCK=infinity

# reload systemd and restart elastic search
systemctl daemon-reload
systemctl restart elasticsearch

# verify memory locking 
# shoud be: "mlockall" : true
curl -X GET "localhost:9200/_nodes?filter_path=**.mlockall&pretty"