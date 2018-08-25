# Cluster Sizing

* Dedicated nodes for each type
* 3 master-only nodes are needed for 1-node failover
* 5 master-only nodes are needed for 2-node failover
* Odd number of master nodes to avoid split-brain
* 5 nodes of each type are preferred, as it allows one node to be down, while still supporting one node failover
* With 3 nodes, and one down for maintenance, it is a risk of actual downtime if a node goes down while maintenance is occurring
* Coordinating-Only nodes local to Kibana (and other egress) to act as load balancers
* Coordinating-Only nodes for Logstash (and other ingress) to act as load balancers
* No license cost for coordinating-only nodes 
* Replica count for all indices should be 
    * 1 for 1-node failover
    * 2 for 2-node failover
* Data node count is 1 + number of replicas
* Heap to Storage Ratios
    * General Purpose: 1:32
        * 1GB Heap in Cluster to 32GB storage
    * High Performance Search: 1:8
        * 1GB Heap in Cluster to 8GB storage
    * High Volume: 1:96
        * 1GB Heap in Cluster to 96GB storage
* Shards
    * Have a cost
    * More shards = faster searches
    * Too many shards = increased cluster state latency / decreased performance
    * Shard Sizing
        * Time-based use cases: 20GB to 40GB per shard
    * Shard Number
        * Number per node should stay below 24 shards per GB of heap
        * Node with max heap of 32GB should stay below 750 shards
        * Note that if you are at 750 per node, lose a node and rebalance, you can hit this limit of 750
        * Capacity planning should always be done assuming one or two nodes have failed
* Data Node calculation
    * Spin up single node ES cluster with single index and single shard to determine optimum shard size
    * Determine data per day/week
    * Primary shard count calc
        * `((Expected data volume / optimum shard size)`
    * Minimum Data node count calc
        * `((Expected data volume / optimum shard size) * (number of replicas + 1))/(24 * GBs of heap)`
        * Add failover node count (1 or 2) to minimum