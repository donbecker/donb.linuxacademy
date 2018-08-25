# elevate to root
sudo su -

# check cluster health
curl localhost:9200/_cat/health?v

# reconfig to only allow new shards
curl -X PUT "localhost:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d '
{
  "persistent": {
    "cluster.routing.allocation.enable": "new_primaries"
  }
}'

# stop es on the node
systemctl stop elasticsearch

# verify
systemctl status elasticsearch

# upgrade ES
yum update elasticsearch-6.3.0 -y

# reload service changes
systemctl daemon-reload

# start es on node
systemctl start elasticsearch

# verify
systemctl status elasticsearch

# reconfig to allow cluster shard management
curl -X PUT "localhost:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d '
{
  "persistent": {
    "cluster.routing.allocation.enable": "all"
  }
}'