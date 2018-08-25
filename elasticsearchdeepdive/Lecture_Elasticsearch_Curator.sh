# Curation runs common maintenance

# elevate to root
sudo su -

# create new yum repo
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

mkdir /etc/curator
# configure config file
vim /etc/curator/config.yml

# file content
# "master_only: true" ensure that curator will only run on the current master in the event you have multiple masters
---
client:
  hosts:
    - localhost
  port: 9200
  master_only: true

logging:
  loglevel: INFO

# configure actions file
vim /etc/curator/actions.yml

# file content
# "ignore_empty_list: true" by default if an action ends up with zero hits, throws error. this setting ignores it.
# "disable_action: false" quick param to flag an action as disabled.
---

actions:
  1: 
    action: delete_indices
    description: delete indices older than 30 days
    options:
      ignore_empty_list: true
      disable_action: false
    filters:
    - filtertype: pattern
      kind: prefix
      value: weblogs-*
    - filtertype: age
      source: field_stats
      field: '@timestamp'
      direction: older
      unit: days
      unit_count: 30
      stats_result: max_value

# execute curator
curator --config /etc/curator/config.yml /etc/curator/actions.yml

# schedule curator to run via cron
crontab -e

# cron content (run every day)
0 0 * * * /bin/curator --config /etc/curator/config.yml /etc/curator/actions.yml

# list cron
crontab -l
