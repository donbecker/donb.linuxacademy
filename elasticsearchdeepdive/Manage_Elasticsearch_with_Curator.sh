# setup curator to trim non-system indexes older than 90 days

# elevate to root
sudo su -

# create curator repo file
vim /etc/yum.repos.d/curator.repo

# file content
[curator-5]
name=CentOS/RHEL 7 repository for Elasticsearch Curator 5.x packages
baseurl=https://packages.elastic.co/curator/5/centos/7
gpgcheck=1
gpgkey=https://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1

# install curator
yum install elasticsearch-curator -y

# create folder
mkdir /etc/curator

# create curator config file
vim /etc/curator/config.yml

# file content
---

client:
  hosts:
    - localhost
  port: 9200

# create curator action file
vim /etc/curator/actions.yml

# file content
---

actions:
1:
  action: delete_indices
  description: delete non-system indexes older than 90 days
  options:
    ignore_empty_list: true
  filters:
  - filtertype: pattern
    kind: prefix
    value: '\.'
    exclude: true
  - filtertype: age
    source: field_stats
    field: '@timestamp'
    direction: older
    unit: days
    unit_count: 90
    stats_result: max_value

# sched curator with cron
crontab -e

# add entry
0 3 * * * /opt/elasticsearch-curator/curator --config /etc/curator/config.yml /etc/curator/actions.yml

# confirm 
crontab -l