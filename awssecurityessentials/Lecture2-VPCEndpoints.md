* Allow for private connection to AWS services, without using public internet
* Traffic does not leave the VPC network
* VPC Endpoints are scalable, redundant and highly available automatically
* Two types
    * Interface (AWS PrivateLink)
        * ENI w/private IP address
            * Supported by
                * ELB's
                * EC2 API
                * Kinesis Streams
                * EC2 Systems Manager
                * Service Catalog
    * Gateway
        * A target for a route table route
            * Supported by
                * DynamoDB
                * S3
* Limitations
    * Same region only, no cross region support
    * IPv4 only, no IPv6 support
    * Cannot be accessed thru VPN or VPC peering connection
    * Only will work thru Direct Connect in a hybrid environment
    
