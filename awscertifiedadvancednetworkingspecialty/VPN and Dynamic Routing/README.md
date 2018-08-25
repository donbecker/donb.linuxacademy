* us-east-2
    * VPC (us-east-2)
        * SiteA
        * 10.111.0.0/16
    * Route Tables
        * Public
            * Routes
                * 10.111.0.0/16 local
                * 0.0.0.0/0 IGW
        * Private
            * Routes
                * 10.111.0.0/16 local
                * 0.0.0.0/0 NAT
    * Subnets
        * Public: 10.111.1.0/24 RT:Public
        * Private: 10.111.2.0/24 RT:Private
        * Private 2: 10.111.3./24 RT:Private
        * Private 3: 10.111.4.0/24 RT:Public
    * IGW: Internets
    * NAT
        * Subnet:Private    
    * Instances
        * Public1-bastion
            * t2.micro
            * Amazon Linux (so ICMP is activated)
            * Public IP
            * Subnet:Public
        * Private1-web
            * t2.micro
            * Amazon Linux (so ICMP is activated)
            * Subnet:Private

    * AMI
        * Course says to use any VyOS AMI made 2016 or later
        * us-east-1: ami-92e86ae8 : 11/17/2017
        * us-east-2: ami-07391762 : 11/17/2017
        * us-west-1: ami-ef9da48f : 11/17/2017

* us-west-1
    * VPC (us-west-1)
        * SiteB
        * 172.31.0.0/16
    * Route Tables
        * Public
            * Routes
                * 172.31.0.0./16 local
                * 0.0.0.0/0 IGW
        * Private
            * Routes
                * 172.31.0.0./16 local

    * Subnets
        * Public: 172.31.1.0/24 RT:Public
        * Private: 172.31.2.0/24 RT:Private
    * IGW: IGW

    * VPN Instance:
        * Name: vyos
        * AMI: VyOS
        * t2.micro
        * Subnet: Public
        * Public IP
        * SSD volume
        * Security Group: vyos
            * SSH 22 0.0.0.0/0
            
    * Create elasticIP, associate to vyos instance

    * Test Instance: 
        * Name: Private Instance
        * Amazon Linux
        * t2.micro
        * Subnet: Private
        * NO public IP
        * Security Group: Private Security Group
            * SSH 22 0.0.0.0/0

* us-east-2
    * Create customer gateway
        * Name: Datacenter
        * Routing: Dynamic
        * IP address: (EIP of vyos instance)
        * BGP ASN: 65000
    * Create virtual private gateway
        * Name: Cloud
        * Attach to SiteA VPC
    * Create VPN Connection
        * Name: Cloud to DC
        * Virtual Private Gateway: Cloud
        * Customer Gateway
            * Existing
            * Datacenter
        * Routing Options
            * Dynamic
    * Download Config
        * Select the VPN Connection
        * Select Download Configuration
        * Choose Vyatta
        * Yes, Download

* From local terminal
* SSH into vyos vpn using public IP and key
    * `ssh-add ~/.ssh/key.pem`
    * `ssh -A vyos@ip`
* Config vyos 
    * `configure`
    