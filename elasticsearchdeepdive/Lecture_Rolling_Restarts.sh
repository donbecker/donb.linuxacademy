# If we simply 'systemctl restart' on every node, 
# the master will rebalance the cluster when we offline the node
#
# So instead, we set the "allocation.enable" to "new_primaries"
# This prevents rebalancing during the rolling restart while allowing new primary shards if an index rollover occurs during the rolling restart

# Zero-Downtime Procedure:
# 1. Ensure cluster is green
# 2. Update cluster "allocation.enable" to "new_primaries"
# 3. Check log to verify #2
# 4. Restart Elastic search on node
# 5. Update cluster "allocation.enable" to "null" (all) to reenable balancing
# 6. Check log to verify #5

# SSH into node 2 (data only)

# switch to root
sudo su -

# check status
curl localhost:9200/_cat/health?v


curl -X PUT localhost:9200/_cluster/settings?pretty -H 'Content-Type: application/json' -d'
{
    "persistent": {
        "cluster.routing.allocation.enable": "new_primaries"
    }
}'

# verify set
# should show "updating [cluster.routing.allocation.enable] from [all] to [new_primaries]"
less /var/log/elasticsearch/linux_academy.log

# restart ES
systemctl restart elasticsearch

# increase shard allocation
curl -X PUT localhost:9200/_cluster/settings?pretty -H 'Content-Type: application/json' -d'
{
    "persistent": {
        "cluster.routing.allocation.enable": null
    }
}'

# verify set
# should show "updating [cluster.routing.allocation.enable] from [new_primaries] to [all]"
less /var/log/elasticsearch/linux_academy.log

# check cluster state, should be green
curl localhost:9200/_cat/health?v