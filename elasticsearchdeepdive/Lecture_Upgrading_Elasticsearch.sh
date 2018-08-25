# Rolling Upgrades: Zero-Downtime Procedure:
# 1. Ensure cluster is green
curl localhost:9200/_cat/health?v
# 2. Update cluster "allocation.enable" to "new_primaries"
curl -X PUT localhost:9200/_cluster/settings?pretty -H 'Content-Type: application/json' -d'
{
    "persistent": {
        "cluster.routing.allocation.enable": "new_primaries"
    }
}'
# 3. Check log to verify #2
less /var/log/elasticsearch/linux_academy.log
# 4. Stop Elasticsearch on node
systemctl stop elasticsearch
# 5. Upgrade Elasticsearch
yum update elasticsearch -y
# 6. Upgrade Elasticsearch plugins
# 7. Start Elasticsearch
systemctl start elasticsearch
# 8. Update cluster "allocation.enable" to "null" (all) to reenable balancing
curl -X PUT localhost:9200/_cluster/settings?pretty -H 'Content-Type: application/json' -d'
{
    "persistent": {
        "cluster.routing.allocation.enable": null
    }
}'
# 9. Check log to verify #8
less /var/log/elasticsearch/linux_academy.log

# Full Cluster Restart Upgrades (full downtime/cluster offline)
# 1. Change allocation to none
# 2. Stop indexing
# 3. Stop Elasticsearch on all nodes
# 4. Upgrade Elasticsearch on all nodes
# 5. Upgrade Elasticsearch plugins on all nodes
# 6. Start Elasticsearch on all nodes
# 7. Wait for yellow cluster state
# 8. Set allocation to all
# 9. Wait for green cluster state
# 10. Resume indexing

# Upgrades and Migrations
# Rolling Upgrades
* 5.x to 5.y
* 5.6 to 6.x
* 6.x to 6.y

# Full Cluster Restart Upgrades
* (5.0 thru 5.5) to 6.x

# Older Versions
* Must delete or re-index all indexes
* Upgrade + Migration