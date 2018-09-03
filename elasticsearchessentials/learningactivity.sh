Install Elasticsearch with default settings:

Install Java:

sudo su -

 yum install java-1.8.0-openjdk -y
Import Elastics GPG key:

 rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
Download the Elasticsearch RPM:

 curl -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.3.rpm
Install Elasticsearch:

 rpm --install elasticsearch-6.2.3.rpm
Enable and start Elasticsearch:

 systemctl daemon-reload
 systemctl enable elasticsearch
 systemctl start elasticsearch

Install Kibana with default settings:

Download Kibana:

 curl -O https://artifacts.elastic.co/downloads/kibana/kibana-6.2.3-x86_64.rpm
Install Kibana:

 rpm --install kibana-6.2.3-x86_64.rpm
Enable and start Kibana:

 systemctl enable kibana
 systemctl start kibana

Install Filebeat with default settings and use the system module:

Download Filebeat:

 curl -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.2.3-x86_64.rpm
Install Filbeat:

 rpm --install filebeat-6.2.3-x86_64.rpm
Edit the system module to convert timestamp timezones to UTC:

In /etc/filebeat/modules.d/system.yml.disabled, change:

 # Convert the timestamp to UTC. Requires Elasticsearch >= 6.1.
 #var.convert_timezone: false
To:

 # Convert the timestamp to UTC. Requires Elasticsearch >= 6.1.
 var.convert_timezone: true
For both the syslog and auth sections.

Enable the system Filebeat module:

 filebeat modules enable system
Install the ingest-geoip filter plugin for Elasticsearch ingest node:

 /usr/share/elasticsearch/bin/elasticsearch-plugin install ingest-geoip
Restart Elasticsearch so it can use the new ingest-geoip plugin:

 systemctl restart elasticsearch
Once Elasticsearch starts up, push module assets to Elasticsearch and Kibana:

 filebeat setup
Enable and start Filebeat:

 systemctl enable filebeat
 systemctl start filebeat