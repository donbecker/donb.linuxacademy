# linuxacademy.awscertifiedadvancednetworkingspecialty.cloudfrontandssl

* AWS Cert manager certs used with cloudfront MUST be in us-east-1

## Using an image with CDN/cloudfront but hosting static content on server
* EC2 servers hosting static pages
* Load balancers in front of servers for SSL termination
* Images pushed to S3 bucket
* Cloudfront pushes images from S3 bucket to edge locations
* Order of events from client request
    * Client makes request for page
    * address domain name resolves to load balancer
    * load balancer sends request to web server
    * web server sends static page to client
    * static page has CDN address
    * browser on client requests image from cloudfront
    * cloudfront redirects to edge location
    * edge location serves image content to client

## Walkthru
* request ACM cert in us-east-1 for a domain
    * request for the entire domain: `example.com`
    * additional wildcard name: `*.example.com`
* vpc: create endpoint
    * select vpc 
    * select S3 service
    * give private routetable access
    * create endpoint
* verify private routetable has route to endpoint
* ec2: launch instance in subnet of private routetable to be the webserver
* ssh into instance
* install apache/httd
    * `yum -y install httpd`
* edit index file
    * `cd /var/www/html`
    * `vim index.html`
    * file content
        * "I love Linux Academy!"
        * `<img src="https://cdn.example.com/images/penguin.png">`
* end file content
* start webserver
    * `service httpd start`
* enable webserver
    * `chkconfig httpd on`
* verify page locally
    * `curl localhost`
    * should display index.html page
* Create Cloudfront Distribution
    * Cloudfront
    * Create Distribution
    * Web
    * Origin Domain Name: s3 bucket
    * Origin Path (set to root / leave blank)
    * Origin ID (leave default)
    * Restrict bucket access: 'Yes'
    * Origin Access Identity: 'Create a New Identity'
    * Grant Read Permissions on Bucket: 'Yes, Update Bucket Policy'
    * Viewer Protocol Policy: 'HTTPS Only'
    * Allowed HTTP Methods: 'GET, HEAD'
    * Price Class: 'Use Only US, Canada and Europe'
    * AWS WAF Web ACL: 'None'
    * Alternate Domain Names: `cdn.example.com`
    * Custom SSL Certificate: (select the ACM cert)
    * Custom SSL Client Support: 'Only Clients that Support Server Name Indication (SNI)
    * Supported HTTP Versions: 'HTTP/2, HTTP/1.1, HTTP/1.0'
    * Logging: 'On'
    * Bucket for Logs: (s3 bucket)
    * Log Prefix: 'cf-logs'
    * Distribution State: 'Enabled'
    * Create Distribution
* Setup Route53
    * Route53
    * Select Hosted Zone `example.com`
    * Create Record Set
        * Name: 'cdn.example.com'
        * Type: 'A - IPv4 address'
        * Alias: Yes
        * Alias Target: (select cloudfront distribution) 'cdn.example.com'
        * Routing Policy: 'Simple'
        * Evaluate Target Health: 'No'
        * Create
* Validate
    * Chrome
        * `https://cdn.example.com/images/penguin.png`
* Create Load Balancer
    * EC2
    * Load Balancers
    * Create Load Balancer
    * Application Load Balancer
        * Name: 'awsncELB'
        * Scheme: 'internet-facing'
        * IP address type: 'ipv4'
        * Load Balancer Protocol: 'HTTPS'
        * Load Balancer Port: 443
        * Select instance VPC
        * Select at least 2 public subnets in different AZs 
        * Next: Configure Security Settings
        * Choose an existing certificate from ACM
        * Certificate Name: (select ACM certificate)
        * Security Policy: 'ELBSecurityPolicy-2016-08'
        * Next: Configure Security Groups
        * Select public security group
        * Next: Configure Routing
        * Target group: 'New target group'
        * Name: 'awsnctargetgroup'
        * Protocol: 'HTTP'
        * Port: 80
        * Health Check Protocol: 'HTTP'
        * Port: 'traffic port'
        * Healthy threshold: '3'
        * Unhealthy threshold: '3'
        * Timeout: '10'
        * Next: Register Targets
        * Select webserver ec2 instance under 'Instances' and click 'Add to registered'
        * Next: Review
        * Create
* Create WWW record
    * Route53
    * Select Hosted Zone `example.com`
    * Create Record Set
        * Name: 'www.example.com'
        * Type: 'A - IPv4 address'
        * Alias: Yes
        * Alias Target: (load balancer DNS name)
        * Routing Policy: 'Simple'
        * Evaluate Target Health: 'No'
        * Create