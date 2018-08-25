# VPN
* Virtual Private Gateway (VPG)
    * The VPN concentrator on the AWS side of the VPN connection
    * There can only be 5 VPGs per region and 1 VPG per VPC
* Customer Gateway (CG)
    * The physical device or software application on your side of the VPN connection
    * The customer gateway is the initiator of the VPN tunnel
    * The VPN tunnel will not come up until the Customer Gateway has initiated the connection
    * If the customer gateway cannot reach the VPG, the tunnel will never come up
    * Only 50 customer gateways per region
* VPN Connection
    * The tunnel created by the VPG and the CG
    * Only 50 VPN connections per region and 10 VPN connections per VPC/VPG
    * AWS provides 2 tunnels per VPN connection for redundancy. Healthchecks can be used for failover.
* All limits above can be increased

# VPN Routing
* Static
    * Routes are manually configured for the VPN
    * Great for smaller environments
    * Less hardware intensive, can be less cost
    * Openswan is an example of open source VPN app that supports static routing
* Dynamic
    * Uses BGP to propagate routes
    * Allows usage of MED and AS_PATH Prepending BGP routing control methods
    * BGP router typically requires a dedicated routing appliance which can be expensive

# VPN Connection
* If you are using dynamic routing, a BGP ASN is required (private ASN Numbers: 6500, 6501, etc)

# Configuring the VPN
1. Create the Customer Gateway
1. Create the Virtual Private Gateway
1. Attach the VPG to the appropriate VPC
1. Enable route propagation in the route table
1. Update security groups to enable inbound connections
1. Create the VPN connection
1. Configure the Customer Gateway using the config downloaded from AWS

# Troubleshooting
* Overlapping CIDRs
    * Can config a NAT on the VPN appliance to fix
* Connectivity
    * Ensure VPN appliance can reach the internet
    * Ensure interfaces in the VPN subnet are configured to route VPN traffic thru the VPN interface
* Route tables
    * If VPN is dynamic, ensure "Route Propagation" is checked
    * If VPN is static, ensure routes to remote subnets are routed thru the virtual gateway
* Matching Tunnel IP addresses
    * If we get the same tunnel IP address for tunnels connecting to two separate IPs
    * Use Virtual Routing and Forwarding (VRF) by using multiple routing tables
* Ability to set custom inside tunnel IPs, ASNs, and PSKs on AWS side
    * A random PSK is still the most secure option, must be between 8 and 64 characters
    * ASNs must be within the private ASN range: 64512-65636
    * Tunnel addresses cannot be within the following subnets (reserved by aws):
        * 169.254.0.0/30
        * 169.254.1.0/30
        * 169.254.2.0/30
        * 169.254.3.0/30
        * 169.254.4.0/30
        * 169.254.5.0/30
        * 169.254.169.252/30 
    * Other rules: http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html

# Reconfiguring a VPN after creation
* Change PSK
    * Delete the VPN connection, but note the AWS VGW IPs can change
* Change Crypto
    * Change config on device, VPN will renegotiate
* To move VPN to new VPC
    * Detach and attach

# Pricing
* Priced per hour provisioned, whether there is a VPN tunnel connection or not
* AWS data transfer charges
