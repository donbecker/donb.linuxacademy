* Elasticsearch
    * The heart of the elastic stack
    * Distributed, RESTful search and analytics engine
    * Highly scalable and fault tolerant
    * Near real time (NRT)
    * Common use cases
        * Product searching with autocomplete for websites
        * Mining log or transaction data for trends, statistics or anomalies
        * Quickly investigating, analyzing, visualizing, and asking ad-hoc questions on huge datasets
    * Important Terms
        * Cluster
            * Collection of one or more nodes (servers)
            * Federated searching and indexing across all nodes
            * Identified by a unique name
        * Node
            * Single server in the cluster
            * Identified by a unique name
        * Index
            * Collection of documents
        * Document
            * Basic unit of information
            * Expressed in JSON
        * Shard
            * Piece of an index
            * Horizontally splits an index for scalability
            * Replication via replica shards: 
                * Replicas are never allocated on the same node as the primary shard
                * Allows for fault tolerance
                * Scale search throughput
    * Cluster States
        * Green
            * All primary shards are allocated
            * All replica shards are allocated
        * Yellow
            * All primary shards are allocated
            * One or more replica shards are unallocated
        * Red
            * One or more primary shards are unallocated
    * Node Types
        * Master-Eligable Node: 
            * Responsible for cluster management
                * Creating/Deleting indexes
                * Tracking cluster members
                * Shard allocation
        * Data Node: 
            * Contains shards
            * Handles CRUD, search and aggregation operations
        * Ingest Node: 
            * Executes pre-processing pipelines
        * Coordinating-Only Node: 
            * Smart load balancer:
                * Routes requests
                * Handles search reducing
                * Distributes bulk indexing
        * Machine Learning Node: 
            * X-Pack Machine Learning Plugin
            * Runs machine learning jobs
            * Handles machine learning API requests
                    