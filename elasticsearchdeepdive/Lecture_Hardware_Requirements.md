# Hardware Requirements

* Master Nodes
    * 2GB to 8GB of heap
    * Heap should not exceed 75% of system memory
    * More cores are better than higher clock speeds
* Data Nodes
    * 2GB to 32GB of heap
    * Heap should not exceed 50% of system memory
    * More cores are better than higher clock speeds
    * 90% of clusters are disk IO bottlenecked
    * SSD drives, in possible RAID-0
    * Storage volume should follow heap to storage ratio
    * Avoid NAS storage, lowest latency is critical
* Network Guidelines
    * All nodes in a cluster are assumed equal
    * Ideal is all nodes in same datacenter
        * Replicate data between datacenters
        * Separate clusters one in each datacenter