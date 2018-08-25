# JVM Heap

## Compressed Ordinary Object Pointers (Compressed OOPs)
* Compresses memory pointers to ref up to 32GB of heap
* ES heap should therefore not exceed 32GB as we will then not have COOPs
* Min and Max heap should be the same value to reduce garbage collections
    * Xms and Xmx should be the same
* Heap should be at *MOST* 50% of System Memory
* Other 50% of system memory will be used by Lucene for filesystem cache
* Full Garbage collections pause the JVM
* GC collection time increases with heap size
* Keep ES heap as small as possible/sized per load/use case
* Prevent ES heap from caching to disk
* Enable memory locking in JVM
    * Set `bootstrap.memory_lock` in elasticsearch.yml
        * `sudo su -`
        * `vim /etc/elasticsearch/elasticsearch.yml`
        * update  
        `#bootstrap.memory_lock: true`
        * to   
        `bootstrap.memory_lock: true`
    * Override system limits for the elasticsearch service
        * create override
            * `systemctl edit elasticsearch`
        * override file   
            `[Service]`  
            `LimitMEMLOCK=infinity`
        * verify override  
            `cat /etc/systemd/system/elasticsearch.service.d/override.conf`
        * reload  
            `systemctl daemon-reload`
    * Restart Elasticsearch  
        * `systemctl restart elasticsearch`
    * Verify log file
        * `less /var/log/elasticsearch/<clustername>.log`
        * Heap size and compressed oops
            * ex: `heap size [1015.6mb], compressed ordinary object pointers [true]`
    * Verify bootstrap memory locking on all nodes
        * `curl -u elastic 'localhost:9200/_nodes?pretty&filter_path=**.mlockall'`
            * ex: `"mlockall" : true`