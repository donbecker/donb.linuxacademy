
==============================================================================================================================================================
Domain 4: High Availability and Elasticity
==============================================================================================================================================================


Question 73 of 80
Multi-answer: Select 2
You manage the operations of a medium size application accepting connections from 1000's of IOT devices. The application uses a number of DynamoDB tables, but one specifically is used by the IOT devices once every 15 minutes to store 'heartbeat' information - consisting of a device_id and a timecode. The table is currently set to 5000WCU to cope with the peak usage of these heartbeat data blobs. The business finance manager has approached you to reduce costs and the heartbeat table is one area you consider. Which options below offer a 'possible' solution to reducing costs (note. each would need to be investigated in detail to confirm, before implementation)

A
Create an EC2 instance which is monitoring the consumed capacity on the table every second. A script on the EC2 instance constantly adjusts the WCU value to more accurately track the consumed capacity and reduce costs.

* B
Create an SQS queue and deploy an application update to the IOT devices to write heartbeat information into the SQS queue. Have an SQS consumer to read the data from the queue over time and write to the DynamoDB table over time - creating a more levelled write profile. Reduce the table WCU value more toward this 'level' value.

C
Create a DynamoDB table per IOT device, and set a lower performance value on each table. WCU is billed in a tier way, so lower values are much cheaper than higher values.

* D
Enable the 'on demand WCU' option on the DynamoDB table which ensures that only WCU that are actually consumer are billed.


Question 71 of 80
Multi-answer: Select 2
Your manager has asked you to find ways to reduce costs a bit. You have determined that you can reduce costs by changing to a smaller, cheaper instance type. Your environment was launched using CloudFormation. How can you implement this change? Choose 2

* A
Update the stack using a CloudFormation template which has the new instance type. https://aws.amazon.com/blogs/aws/new-cloudformation-drift-detection/

B
Delete your Stack. Create a new template containing the new instance type and create a new stack.

* C
Use a CloudFormation Change Set to apply the change. https://aws.amazon.com/blogs/aws/new-change-sets-for-aws-cloudformation/

D
Modify your Launch Configuration with the new instance type.


Question 69 of 80
Single-answer
You have configured an Elastic Load Balancer and have an Auto Scaling Group with a max size of 8 and a min size of 4. You currently have 4 instances in the Auto Scaling Group but your Health Checks are failing. After some investigation, you determine that the instances are not receiving traffic from the Load Balancer. What could be the problem?

* A
The security group associated with the instance does not allow traffic from the load balancer.

B
You have not created a route from the ELB to the instances.

C
You are using TCP for Health Checks instead of HTTP

D
This is not a problem. The ELB sends traffic to the Auto Scaling Group, not to specific instances.


Question 68 of 80
Multi-answer: Select 4
You work for a small web hosting business. One of your clients has historically operated using a single EC2 instance, running MySQL, Apache, PHP and a installation of wordpress operating over HTTPS. The client is about to release a major new product and is expecting 1000x growth in visitors to the site and has asked that you implement modifications to improve the ability of the application to scale in-line with best practices while being as economical as possible. Which options would you suggest... (pick 4)

A
Migrate the media content from the EC2 instance to Amazon Glacier with 'real-time-retrieval' enabled on the glacier instance

* B
Migrate from an on-instance installation of MySQL to Amazon RDS.

* C
Implement a front facing load balancer with the SSL offloading feature enabled.

* D
Modify the deployment to use Launch Configuration, Auto Scaling, CloudFormation and CloudWatch - integrate this with a load balancer. Utilise a small EC2 instance class.

E
Increase the size of the EC2 instance to the maximum available R class instance.

F
Use Elasticache and DAX to improve performance of the application databases

* G
Migrate media content from the EC2 instance to S3 and use static web hosting support to deliver this to customers

H
Implement a multicast VPN solution to allow all EC2 instances to share media content from a master node


Question 66 of 80
Single-answer
You have set up a small web application using one EC2 instance. After running for a week you are noticing heavier than expected traffic during a two hour period each day. What can you do to insure that your application scales appropriately?

A
Add an additional EC2 instance with the application loaded.

B
Set up a Multi-AZ environment.

C
Deploy your environment using CloudFormation.

* D
Creating an Auto Scaling Group for the application that scales using a CloudWatch metric for CPU utilization.


Question 60 of 80
Single-answer
You have configured an Elastic Load Balancer and have an Auto Scaling Group with a max size of 8 and a min size of 4. You currently have 4 instances in the Auto Scaling Group but your Health Checks are failing. After some investigation, you determine that the instances are not receiving traffic from the Load Balancer. You have also determined that the security group associated with the instance allows traffic from the load balancer. What could be the problem?

A
You did not configure the Internet Gateway.

B
You Route Table has a black hole.

* C
The security group of your load balancer in a VPC does not allow traffic to the EC2 instances.

D
You did not give your Load Balancer an Elastic IP address.


Question 59 of 80
Single-answer
You need to resize an instance in your Auto Scaling group, so you stop the instance , make the size change, and then try and restart it. You notice that the instance has now been terminated and replaced. What happened?

* A
Auto Scaling marked the instance as unhealthy and then terminated it to replace it with a healthy instance.

B
You need to create a new Auto Scaling group when you resize instances.

C
You did not make the corresponding changes in your CloudFormation template.

D
The instance size you selected was too large.


Question 58 of 80
Single-answer
You are a member of the operations team for a large social media platform which heavily utilises video. You application runs on 1000's of stateless EC2 instances and relies on a combination of SQS, launch configuration and an autoscaling group to perform watermarking and transcoding of the video to various quality levels and bitrates. All transcoding servers are stateless and store their logs to local volumes to save on costs. Recently you have noticed that encoding job processing has slowed down and you are experiencing higher failure rates.

What would you attempt in order to fix the problem?

* A
Adjust the launch configuration to bootstrap on the CloudWatch logs agent. Use the centralised logging to determine the actual cause of the failures and processing issues. Adjust the products as required once the cause is determined.

B
Adjust the EC2 instance role configured in the Launch Configuration - there must be permissions issues impacting the ability of the instances to process data.

C
Migrate the EC2 processing pipeline to AWS Lambda - this will provide improved logging and scalability

D
Enable the 'auto-queue-retry' feature on the dead letter queue

E
Use kinesis rather than SQS, it's multi shard architecture will allow parallel processing and improve reliability.

F
Change the EC2 instance type to X1 - the application issue is clearly a memory leak and the additional capacity of the X1 instance will rectify this.


Question 57 of 80
Single-answer
The CIO of your business recently attended a workshop and returned with some requirements to add self-healing capability to one of your low usage, but critical applications. The application currently runs on a single EC2 instance in us-east1a. The application utilises PHP for its app layer and PostgreSQL as it's database. What set of actions and AWS products are required to implement self healing and remove single points of failure. Choose one.

A
Run the 'reset-instance-attribute' AWS CLI command and enable the 'az roaming' feature of the EC2 instance. Ensure that all AZ's in the region are selected allowing the instance to migrate freely between AZ's. Enable CloudWatch logging and install the in instance scripts to allow monitoring of Disk Activity, Memory and CPU. At this point the instance will have no single point of failures and will self-heal in the event of an AZ failure.

B
No action is required, EC2 is a region resilient service - the instance can migrate between hosts and availability zones freely as default. The AWS 'reset-instance-attribute' command can be used to allow region roaming for an additional cost. Ensure EBS snapshots are taken to allow the Database to recover.

C
Migrate the DB from the EC2 instance to RDS using the PostgreSQL engine. Create an AMI of the EC2 instance or develop a set of automated build steps. Create a LC and ASG, add a load balancer and set the ASG to 1/1/1 for min/max/desired values.

D
Migrate the DB from the EC2 instance to DynamoDB using the PostgreSQL engine. Create an AMI of the EC2 instance or develop a set of automated build steps. Create a LC and ASG, add a load balancer and set the ASG to 1/1/1 for min/max/desired values. Ensure Multi-AZ is enabled on DynamoDB

* E
Migrate the DB from the EC2 instance to RDS using the PostgreSQL engine. Create an AMI of the EC2 instance or develop a set of automated build steps. Create a LC and ASG, add a load balancer and set the ASG to 1/1/1 for min/max/desired values. Ensure Multi-AZ is enabled on the RDS product.


Question 56 of 80
Single-answer
You have an Elastic Load Balancing health check policy that pings port 80 every 20 seconds, and after passing a threshold of 10 successful pings, reports the instance as being InService. If enough ping requests time out, then the instance is reported to be OutofService. What can be used in conjunction with this infrastructure as a cost-effective solution?

A
Set the time interval to 60 seconds and 10 successful pings for aninstance that is InService. For scale-down activities, the load balancer removes the EC2 instance from the pool and drains current connections before they terminate.

B
Used with Auto Scaling Rolling Update, an instance that is OutofService could be replaced if the Auto Scaling policy specifies. For scale-down activities, the load balancer removes the EC2 instance from the pool and drains current connections before they terminate.

C
Set the threshold to 20 successful pings for an instance that isInService. For scale-down activities, the load balancer removes the EC2 instance from the pool and drains current connections before they terminate.

* D
Used with Auto Scaling, an instance that is OutofService could be replaced if the Auto Scaling policy specifies. For scale-down activities, the load balancer removes the EC2 instance from the pool and drains current connections before they terminate.


Question 55 of 80
Multi-answer: Select 3
You work for a local government office and are responsible for managing a driver license registration system. Historically the system has a pretty low load, with customers renewing and registering for licenses equally spread over the entire year. In 3 months, the licenses are being replaced with a new document with an embedded RFID chip, requiring everyone to reapply. You expect the load to be at least 10x the usual levels - which normally consist of 90% reads and 10% writes to the database. The application and database currently run on a single linux server running MySQL, apache and a PHP application. You have been asked to suggest some ideas to allow the system to scale to meet these demands - which options are valid in this scenario (pick all that apply)

* A
Migrate to RDS and Enable Multi-AZ

* B
Add read replicas and configure DB connection strings to point at alternative servers

C
Enable code pipeline to allow the mixed use of PHP and Go for performance reasons.

* D
Develop a automatic build process for the systems software stack. Create a launch configuration, Auto Scaling Group and a Load balancer.

E
Move the MySQL database to RDS (MySQL) and enable the Multi-AZ feature selecting to place a HA node in each availability zone. Reconfigure the application connection string to round robin between those nodes using VPC Route53 and a DNS VPC Endpoint for performance reasons.

F
Migrate from RDS to DynamoDB and utilise a hybrid LSI and GSI strategy to allow SQL to NOSQL migration


Question 50 of 80
Single-answer
Your application runs on EC2 instances behind an Elastic Load Balancer. You are using RDS and read replicas for your read heavy app. What step can you take to make your data tier self-healing?

A
Place your db instances in an auto scaling group

B
Add Elasticache

C
Add sharding instances

* D
Implement a multi-AZ deployment


Question 43 of 80
Single-answer
You need to deploy a new version of your application. You’d prefer to use all new instances if possible, but you cannot have any downtime. You also don’t want to swap any environment URLs. You’re running t2.large instances and you normally need 8 instances to meet capacity. If the update fails, you want to be able to rollback process requiring only terminating your Auto Scaling group.

Which deployment method should you use?

A
Blue/Green

* B
Immutable

C
All at Once

D
Rolling Updates


Question 42 of 80
Multi-answer: Select 2
You are the administrator of a legacy on-premises application written in C++, running its own built-in web server where application state/sessions and data interaction occurs. The software also has a complex set of legacy dependencies. The physical server the application is running on is 15 years old, and constantly operates at 100% resource usage. In addition, the businesses risk team have decided that continuing to operate the software on hardware of that age is an unacceptable risk. They have asked you to produce a plan to migrate the server to AWS and provide it with additional resources. Key considerations are that the software is critical, the business is currently risk and cost conscious and a program of works to migrate out of their physical datacenters in underway. (Select all valid options apply).

A
Use AWS' physical server migration service to migrate the server into AWS.

B
Perform a P2V (physical to virtual) migration as an interim stage to obtain a virtual image of the server.

C
Migrate the virtual machine into AWS, rebuild it with a new operating system automating the build steps, add a load balancer, auto scaling group and launch configuration - configure the platform to scale based on user count.

* D
Migrate the virtual machine into AWS as is. Pick a bigger sized instance and then monitor the load over time. At some future point adjust the instance to an appropriate one based on load. Continue monitoring with cloudwatch resource monitoring, adjusting the size as needed.

* E
Migrate the virtual machine into AWS investigate and automate the build steps, add a load balancer, auto scaling group and launch configuration - set the auto scaling configuration to Min1, Max 1, Desired 1.


Question 38 of 80
Single-answer
You have configured an Auto Scaling Group of EC2 instances behind an Elastic Load Balancer. Health check requests from your load balancer to your EC2 instances are timing out or failing intermittently. What can you do?

A
Install a CloudWatch Log Agent on the instances. Begin monitoring the application logs.

B
Your Auto Scaling Group must be under heavy load. Increase the size of your Auto Scaling Group.

C
Contact Amazon Web Services. Intermittent failures indicate a problem on their end.

* D
Adjust the response timeout settings in your load balancer health check configuration.


Question 36 of 80
Single-answer
You have an application running a specific process that is critical to the application's functionality, and have added the health check process to your Auto Scaling group. The instances are showing healthy but the app has lost functionality. Why could that be?

A
There is a delay in returning the health check status.

B
It is not possible for a health check to monitor a process that involves application functionality.

C
You do not have the time range in the health check properly configured.

* D
The health check is not checking the critical process.


Question 27 of 80
Single-answer
You have an Auto Scaling Group of EC2 instances. You have some instances failing Health Checks. You need to troubleshoot but the instances are being terminated before you can complete troubleshooting. What can you do to give you some time to troubleshoot the instances?

A
Keep an SSH connection open to the instances to allow as much time as possible to troubleshoot.

B
Create a Lifecycle Hook to hold the instance in a terminating:proceed state to give you extra time to troubleshoot.

C
Create a Lifecycle Hook to hold the instance in a pending:wait state to give you extra time to troubleshoot.

* D
Create a Lifecycle Hook to hold the instance in a terminating:wait state to give you extra time to troubleshoot.


Question 20 of 80
Single-answer
You have decided to perform a rolling deployment with Elastic Beanstalk. Elastic Beanstalk detached all instances in the batch from the load balancer, deployed the new application version, and then reattached the instances. None of your instances are receiving traffic. What happened?

A
The instances needed to be reattached before the new application version was deployed.

B
You did not set the BatchSize and BatchSizeType options to configure the size of each batch.

* C
Elastic Load Balancing waits until instances pass a minimum number ofElastic Load Balancing health checks (the Healthy check count threshold value), and then starts routing traffic to them.

D
The load balancer should have never been detached and caused the deployment to fail.


Question 16 of 80
Single-answer
You have configured a Classic Elastic Load Balancer. You set the Health Check to be HTTP on Port 80. You launch an instance but the instance fails the health check. What is a likely cause?

* A
You need to configure a target page (index.html) on the instance.

B
You also need to add a Health Check for HTTPS on Port 443.

C
You can use Port 80 for the Health Check but it needs to be TCP.

D
You need to add a Lifecycle Hook to insure that the instance bootstrapping has completed.


Question 6 of 80
Single-answer
A startup has developed a new restaurant-rating application for mobile devices. The application has recently increased in popularity; which has resulted in a decrease in performance of the application due to the increased load. As Chief Architect of that startup, you've noticed that users are spending less time on the application which is driving down revenue, and you're in charge of solving this issue.

The application has a two-tier architecture with a PHP application tier running in an Auto Scaling group, and a MySQL RDS instance deployed with AWS CloudFormation. The Auto Scaling group has a min value of 4 and a max value of 8 instances. The desired capacity is now at 8 because of high CPU utilization of the instances.

Instead of increasing the max capacity of the Auto Scaling group, you realize that switching to a different instance type with more CPU resources would solve the performance problem at a cheaper cost.

How can you change instance types while minimizing downtime for end users?

A
Copy the old launch configuration, and create a new launch configuration with the C3 instances. Update the Auto Scaling group with the new launch configuration. Auto Scaling will then update the instance type of all running instances.

* B
Update the launch configuration in the AWS CloudFormation template with the new C3 instance type. Add an UpdatePolicy attribute to the Auto Scaling group that specifies an AutoScalingRollingUpdate. Run a stack update with the updated template.

C
Update the existing launch configuration with the new C3 instance type. Add an UpdatePolicy attribute to your Auto Scaling group that specifies an AutoScaling RollingUpdate in order to avoid downtime.

D
Update the AWS CloudFormation template that contains the launch configuration with the new C3 instance type. Run a stack update with the updated template, and Auto Scaling will then update the instances one at a time with the new instance type.


==============================================================================================================================================================
Domain 3: Security, Governance, and Validation
==============================================================================================================================================================


Question 41 of 80
Multi-answer: Select 2
You are in charge of security for the company development team. Each member of the team will need to access AWS resources programmatically. Which types of credentials are used for programmatic access to APIs? Choose 2 answers.

A
MFA

B
username/password

* C
Access Keys

* D
MFA for API calls


Question 35 of 80
Single-answer
You need to securely store your RDS database credentials. The credentials need to be accessible by the applications on your EC2 instances with security being the most important requirement. How can you do this?

A
Store the credentials in your application code.

B
Store the credentials in your code repository. Have a job which copies the files to your instances.

* C
Attach an IAM Role to your EC2 instances granting read access to an S3 Bucket. Store the credentials in the S3 Bucket and use S3 server-side encryption on the credential files.

D
Store the files on your RDS instance. Have a script on each instance pull the credentials from RDS.


Question 34 of 80
Single-answer
Your finance manager has set a budget for AWS services for your project of $2500. What is a simple way to know you hit this threshold?

* A
Utilize CloudWatch combined with a Billing Alarm.

B
Use AWS CLI tools to get month-to-date total.

C
Use AWS CloudWatch Events with API calls and then an SNS notification.

D
Stream the data into Amazon Elasticsearch in near real-time with CloudWatch Logs subscriptions .


Question 32 of 80
Single-answer
You have been asked by your CIO to diagnose a permissions issue occurring on your EC2 instances. A group of 3 EC2 instances runs a shell script which periodically parses an S3 bucket, collating metadata on a huge number of objects and entering that information into a DynamoDB table for searching and manipulation by your companies data scientists. The scripts have recently started to fail - they are unable to read the object metadata from S3 and are unable to write the data into DynamoDB.

You have checked your configuration management system - and can see that a previous operational engineer configured the system to inject authentication information onto the instance. You have also verified that the EC2 instance has a role assigned AND the role has sufficient permissions to perform the tasks.

You are asked to review some suggestions from junior team members and suggest the most likely reason for further investigation.

A
The EC2 instance is configured to assume the permissions of an IAM user with insufficient permissions

* B
There is a problem with the access keys injected via the configuration management system.

C
There is a problem with the EC2 role - it must be configured incorrectly and is processed with more preference than the injected authentication information

D
The IAM policy is configured for interactive usage only - it will work when tested on your local workstation, but not when used inside a script


Question 31 of 80
Multi-answer: Select 2
You have been tasked to ensure costs are managed within your businesses AWS account. The business have provided two requirements, first that it should be easy to determine the AWS costs for each team or business unit, and practical limits can be placed on those teams and business units. Which options below are valid solutions to this business need.

A
Add all team/business unit members into AWS IAM Groups and apply cost limits to those groups. From within the AWS account options, enable 'IAM Group Billing' support to produce daily, weekly & monthly billing reports broken down into those groups.

* B
Implement organisation & IAM policies to encourage and enforce cost tagging on resources in the AWS account. Use the built in AWS tools to allow bills to be broken down based on these tags.

* C
Use the AWS Budgets feature to define budgets based on TAGS. Ensure a TAG exists for each business unit or team.

D
Use AWS Kinesis and firehose to pipe billing information in EMR for real-time cost visualisation.


Question 30 of 80
Single-answer
You have decided to create IAM Roles for your applications to make API requests. You need to assign a member on your team to work with IAM Roles and Policies. What format should your team member have some familiarity with when creating Policies?

A
Python

B
PHP

C
YAML

* D
JSON


Question 29 of 80
Single-answer
You are creating IAM Roles and Instance Profiles. You want the Instance Profile associated with an IAM Role to have different names. How would you do this?

* A
Create the IAM Role and the Instance Profile from the CLI.

B
Run a python script to change the Instance Profile name after creation.

C
Create the IAM Role and Instance Profile in the AWS Management COnsole.

D
You can't. The IAM Role and its associated Instance Profile must have the same name.


Question 26 of 80
Single-answer
You have a mobile application which stores photos for thousands of end users. You will store photos in S3. How can you authorize access to these photos?

* A
The users authenticate at the app level, and an STS token can be used to grant access to S3.

B
Use an IAM Role to grant access to the S3 Bucket.

C
Give each user their own S3 Bucket which is configured as a static web site. Have the user authenticate to the bucket.

D
Use Cross-Account Access.


Question 24 of 80
Multi-answer: Select 2
Under the Shared Responsibility model, what is the customer responsible to secure? Choose 2 answers

A
Facilities

* B
Data at rest

C
Network Infrastructure

* D
Data in transit


Question 23 of 80
Multi-answer: Select 2
You are implementing the security model for a large scale e-health application. Your company manufactures internet connected devices such as body composition scales, blood pressure monitors and smart wearables. You devices will be used by 10's of millions of customers and you need to design a security implementation that will protect individual customers data while scaling within the limits of AWS IAM and DynamoDB which will store your products data. Which of the following represent possible options.

* A
Use AWS cognito to provide access to certain ITEMS within DynamoDB based using "dynamodb:LeadingKeys"

B
Syncronize 3rd party ID databases en-mass and in advance with the IAM data store. Use the "dynamodb:UseSyncedCredentials" condition to allow selection of the ProxyID of the identity to use.

C
Create an IAM user per application user and embed the credentials into the application using AWS Cognito to sync the security context across all devices.

* D
Utilise Identity federation and a 3rd party identity store such as twitter, facebook, google or OpenID to supply identities.

E
Add the federated identities into an IAM group, and allow this group to login to an IAM role to obtain the access rights required to read and write to DynamoDB.


Question 22 of 80
Single-answer
After a recent audit you have been tasked with ensuring that account activity is logged and can be tested for validity.

Which of the below options is a valid way to meet this requirement.

A
Ensure AWS CloudTrail is enabled and correctly configured for the AWS Account. Store CloudTrail logs in an S3 bucket in a isolated read-only AWS account. Use the "validate-logs" CLI command from a machine with AWS account access whenever validation is required.

B
Ensure AWS CloudTrail is enabled and correctly configured for the AWS Account. Store CloudTrail logs in an S3 bucket and use the "validate-logs" CLI command from an 'air gapped or offline' machine whenever validation is required.

C
Configure CloudTrail to store logs on S3 and notify operations staff via AWS SES whenever log changes occur.

* D
Ensure AWS CloudTrail is enabled and correctly configured for the AWS Account. Store CloudTrail logs in an S3 bucket and use the "validate-logs" CLI command from a machine with AWS account access whenever validation is required.


Question 21 of 80
Single-answer
A development team within your business is using a docker pipeline for their development and application delivery. They intend to use the AWS Elastic Container Service (ECS) to host their containers in production and the service will host many containers performing different functions and needing different permissions. How will you advise the development team to deliver authentication information into the containers as needed, while using the least permissions possible.

A
Provide all containers with permissions hard coded into the applications using access keys/secret - containers in ECS cannot be provided with permissions using IAM roles.

B
Configure the individual containers to login to an IAM role using it's ECA username and password attribute. This ensures keys are rotated automatically by the IAM service.

* C
Containers can make use of IAM roles via task roles, OR, they can utilise roles applied to the ECS container instance

D
Base permissions can be provided with Instance roles applied to the ECS instance - and more granular permissions can be hard coded into the applications using access keys/secret - containers can only use instance role permissions or be provided with specific permissions via keys.


Question 17 of 80
Single-answer
After doing a code review with your dev team, you have expressed concern about the practice of hard coding AWS credentials in code. What should your team do to address this issue?

A
Encrypt your credentials

* B
Create an IAM Role to attach to your instances. Update your application to use secure API requests.

C
Store your credentials in a Configuration Management system.

D
Create an IAM Policy


Question 13 of 80
Single-answer
Your company has a hybrid infrastructure with legacy on-premises systems as well as an AWS account.Many of your team members with accounts in the on-premises system need access to AWS resources. How can you give them this access?

A
IAM Roles for EC2.

B
Cross-Account Access

C
Create separate accounts for your users in AWS.

* D
Identity Federation


Question 12 of 80
Single-answer
You are responsible for an application that uses the Amazon SDK on EC2 instances to store and fetch data from Amazon S3 and DynamoDB. The EC2 instance is using an IAM role to have access to both S3 and DynamoDB. The data is critical to business operations and must be kept as secure as possible. Your superior is concerned that you are not following security best practices for securing this data, and has asked you to implement a new solution and then give him a report. More specifically, he has outlined these requirements: credentials should rotate and not be older than 3 months, and the system implementing this rotation should return a report acknowledging that the action successfully completed.

Which option will satisfy these requirements the best?

A
Update the application itself to make periodic calls to IAM via the SDK in order to rotate access keys, and then email a report.

B
Have the configuration management rotate keys automatically every 2 and half months, and then send an email report.

C
Create a script that queries the IAM list-access-keys API to get an instance's access key creation dates, and if they are older than 3 months, rotate them. Then email the report of this rotation.

* D
Explain to your superior that IAM role credentials are already automatically rotated on a frequent basis and that no further steps are necessary


Question 10 of 80
Single-answer
You are delegating work to your dev team and have decided to give them permission to launch an instance with an IAM role. How would you grant this permission to your developers?

A
Create a policy containing iam:UseRole

* B
Create a policy containing iam:PassRole

C
Give cross-account access to your account.

D
They will have this capability if they can create instances.


Question 9 of 80
Single-answer
You have a CloudFormation template with various resources, including an EC2 instance which your supervisor has instantiated with permissions. You are attempting to delete a CloudFormation stack but the stack deletion keeps failing and is stuck in DELETE_FAILED. What could be a possible explanation?

A
Because your supervisor instantiated the EC2 instance with the appropriate permissions, he will need to be the one to delete the stack.

* B
You do not have the necessary IAM permissions for the EC2 instance you did not provision. You need to use a parameter called ͞retain͟ in the DeletionPolicy and specify the EC2 instance. The stack will delete all resources except for that EC2 instance.

C
You need to add a statement allowing permissions to that EC2 instance in your template, then you need to use a parameter called ͞retain͟ in the PurgePolicy and specify the EC2 instance. The stack will delete all resources except for that EC2 instance.

D
You do not have the necessary IAM permissions for the EC2 instance you did not provision. You need to use a parameter called ͞retain͟ in the PurgePolicy and specify all resources expect that EC2 instance. The stack will delete all resources except for that EC2 instance.


Question 5 of 80
Single-answer
You work in the DevOps team within a hosting business. Your company manages 1000's of customer environments each provisioned and managed using CloudFormation templates. Recently the business has grown significantly and you have formed a service desk team with the responsibility for Adds, Moves and Changes to customer environments. You need to decide on a way to provide the servicedesk team with enough access rights via IAM to perform adjustments to client environments - but not enough to be able to modify / delete or add infrastructure outside these client environments. Which method is the most suitable, in that it can provide the service desk team the required abilities, but do so with as least permissions granted as possible. (select the best answer)

A
Apply the Administrator managed policy to the service desk group within IAM.

B
Provide the service desk team with the iam permissions to Update stacks.

C
Grant the servicedesk team iam:CloudFormationOperator permissions in addition to Create, Update and Delete cloud formation permissions.

* D
Ensure your DevOps team have the iam:PassRole permission. When cloud formation stacks are created use the iam:PassRole permissions. Provide the service desk team with the iam permissions to Update stacks.


Question 3 of 80
Multi-answer: Select 3
You have created IAM Roles and begin attaching them to instances. When can you attach a role to an instance? Choose 3 answers

A
When an instance is terminated.

* B
When an instance is stopped.

* C
When an instance is running.

* D
When launching an instance.


Question 2 of 80
Single-answer
You have a group of web server EC2 instances in an Auto Scaling Group behind a Load Balancer. The instances are all performing SSL encryption but you would like to take this burden from the instances. How can you do this?

* A
Put an HTTPS Listener on the Load Balancer.

B
Encrypt your data at the database level.

C
Create a Bastion Host in front of the instances to perform encryption and decryption.

D
You can't. The data has to be encrypted by the instances.


==============================================================================================================================================================
Domain 2: Monitoring, Metrics, and Logging
==============================================================================================================================================================

Question 70 of 80
Single-answer
You are doing frequent releases on an application that needs to be highly available. Your team has determined to analyze the application logs after each deployment to insure everything is working properly. Which technique would enable your team to view the application logs in near real-time?

A
Stream the logs to CloudWatch and set up an SNS notification to email personnel when the logs are available.

B
Send the logs to S3 and use EMR to analyze the logs hourly.

* C
Stream the logs to Kinesis and have the logs analyzed in real-time.

D
Stream the logs to Redshift and set up data analysis on Redshift.


Question 67 of 80
Single-answer
Your supervisor has requested a way to analyze traffic patterns for your application. You need to capture all connection information from your load balancer every 10 minutes. Pick a solution from below.

A
Use a CloudWatch Logs Agent.

B
Use AWS CloudTrail with your load balancer.

C
Create a custom metric CloudWatch filter on your load balancer.

* D
Enable access logs on the load balancer.


Question 65 of 80
Single-answer
After an audit you have been given specific requirements for storing your log files. Log files need to be retained for 5 years. But you need to be able to quickly access any logs within the last 6 months. How can you meet these requirements?

A
Install the CloudWatch Logs agent on your instances and stream the data to CloudWatch. Create a job to backup the data to Glacier after 180 days.

B
Archive your log files using EBS snapshots.

C
Store your log files in S3, archive to S3-IA after 30 days, then archive to Glacier after 180 days.

* D
Store your log files in S3 and archive to Glacier after 180 days.


Question 64 of 80
Single-answer
After receiving multiple complaints that your web application is crashing, you determine that your code is causing a memory leak. This application is built using CloudFormation. The architecture is a group of EC2 instances in an Auto Scaling Group with a back-end RDS MySQL database. Your team is working on a code fix. But what can you do to detect such memory related issues and have your personnel notified as soon as a problem arises?

A
Create a CloudWatch Alarm on memory usage and trigger an SNS notification when usage becomes too high.

B
Install the CloudWatch Logs agent on your EC2 instances during bootstrapping. Stream this log data to CloudWatch. Configure CloudWatch to send an SNS notification to your personnel when a memory usage event occurs.

* C
Create a custom CloudWatch metric to capture your memory usage. Create a CloudWatch Alarm that will trigger an SNS notification to your personnel when memory usage becomes a problem.

D
Configure a CloudFormation Intrinsic Function to capture memory usage statistics and store this information in an SQS queue. Subscribers to the queue will have on-demand access to this information.


Question 62 of 80
Single-answer
You recently added a new feature to your start-up app which has increased traffic tremendously and now customers are complaining that the site has a slow response time. How can you determine what is causing this?

A
Use custom metrics to monitor CPU utilization.

B
Review the HTTPCode_Backend_2XX metric from your Elastic Load Balancer which was pushed to CloudWatch

* C
Create custom CloudWatch metrics with more specific information regarding your app to see how many requests are coming in and how many are in queue.

D
Examine the CloudTrail log file.


Question 61 of 80
Multi-answer: Select 2
You are placed in charge of managing your company OpsWorks Stacks. You need to design an effective strategy to monitor your OpsWorks Stacks. Whcih AWS services can you use to monitor your OpsWorks Stacks? Choose 2 answers.

A
SNS

* B
CloudTrail

* C
CloudWatch Logs

D
AWS Config


Question 54 of 80
Multi-answer: Select 3
You have an Auto Scaling Group of Web Servers and are using CloudWatch to monitor your applications. What tools and techniques can you use to capture 404 errors and notify on-call personnel who are trying to pinpoint a specific problem? Choose 3 answers

A
Configure CloudTrail to capture these errors.

* B
Create a CloudWatch Alarm which uses SNS to email personnel when errors occur.

* C
Create a CloudWatch Logs Group and define metric filters for 404 errors.

D
Enable AWS Config to send notifications when the errors occur.

* E
Pre-Bake your AMis with the CloudWatch Logs Agent.


Question 53 of 80
Single-answer
You have noticed some suspicious activity in your environment. After a meeting with your Security Lead, you decide to monitor the activities related to a particular API call. How can you configure this?

A
Use AWS Config to monitor API calls and create an SNS notification when the specific API call is made.

* B
Create an alarm in CloudWatch and receive notifications of particular API activity as captured by CloudTrail. Create an SNS notification to email security personnel when the alarm occurs.

C
Install the CloudWatch Logs Agent on your instances and stream the logs to CloudWatch. Also create a CloudWatch Log Group and set up a metric for the API call. These metrics can be viewed in CloudWatch.

D
Use CloudTrail to monitor the API call. Stream the API event to an SQS queue. Create an Auto Scaling Group to consume the queue and send an email noticiation.


Question 52 of 80
Single-answer
You work for a medium sized web hosting business utilising AWS. You have been asked to look at cost optimisations for the environment and are starting with an isolated pocket of infrastructure for a legacy client. The clients infrastructure consists of multiple environments, 50 in total, each using a N-tier architecture with a dedicated public facing AWS classic load balancer. The infrastructure was deployed into AWS approximately 4 years ago and has remained untouched since. The environments use SSL for secure client -> server connectivity, with the SSL certificates hosted on the load balancers. Which option below offers a good reduction in costs with little risk and no extensive infrastructure changes.

A
Merge the 50 classic load balancers into a single application load balancer which is capable of hosting multiple environments and multiple SSL certificates.

* B
Merge the 50 classic load balancers into a smaller number of five application load balancers - each of which is capable of using multiple SSL certificates and SNI.

C
Merge the 50 classic load balancers into a single classic load balancers capable of servicing all environments.

D
The environment is optimised in its current form - further cost savings are not possible.


Question 46 of 80
Single-answer
You are receiving complaints from customers that your web application is experiencing poor response times during certain times of the day. After analyzing your metrics, you verify the poor response times and notice that your Auto Scaling Group reaches its maximum during these times and response times are still poor. What can you do to improve response times most cost-effectively?

A
Add a Log Group to your EC2 instances allowing metrics to be streamed to CloudWatch faster.

* B
Increase the maximum size of your Auto Scaling Group

C
Increase the maximum size of your Auto Scaling Group and change to larger instances.

D
You can increase the granularity of your CloudWatch metrics to allow the Auto Scaling Group to scale up faster.


Question 44 of 80
Single-answer
How can you send all of your log information (operating system and application logs) to be viewed in CloudWatch?

A
Create cross-account access from the EC2 instances to CloudWatch and create a job to transfer the logs.

B
Use Kinesis Stream to stream the logs to CloudWatch.

C
Set up a Code Pipeline to stream the logs to CloudWatch.

* D
Create a CloudFormation template which creates a CloudWatch Logs LogGroup, and use the CloudWatch Logs agent to stream the logs to CloudWatch.


Question 40 of 80
Multi-answer: Select 2
You are the DevOps Engineer for an AWS optimized organization and have built an application with one parent EC2 instance and several child instances. Your application requires you to have 10 instances deployed at all time. Each slave instance handles 20 concurrent builds. You have created a custom CloudWatch metric which shows you how many builds are running. What is a cost-effective solution to have 100 builds running at the same time? Select two answers.

A
Put your child instances in an Auto Scaling group. Create a new CloudWatch alarm which triggers a scaling policy to scale in or scale out based on running builds, and then launches or terminates larger size instances.

* B
Put your child instances in an Auto Scaling group. Create a new CloudWatch alarm which triggers a scaling policy to terminate EC2instances when there are less than 90 builds running for more than a period of 10 minutes.

* C
Put your child instances in an Auto Scaling group. Create a new CloudWatch alarm which triggers a scaling policy to launch addition EC2 instances when there are more than 90 builds running for more than a period of 10 minutes.

D
Create another CloudWatch alarm that sends an alert when there are more than 90 builds running at the same time.


Question 39 of 80
Single-answer
You have been given a requirement to perform analysis of the logs on the instances in your Auto Scaling Group. You have a 3rd party log analysis application and your major requirement is that you need to perform the analysis in near real time. How can you do this?

A
Use the CloudWatch Logs agent to stream the data directly to EMR and have your Log Analysis App subscribe to EMR.

B
Use the CloudWatch Logs agent to stream the data directly to your Log Analysis app.

C
This can not be done in near real-time.

* D
Send the logs to a Kinesis Stream, and use the Kinesis Client Library to connect your log analysis app to the Kinesis Stream.


Question 28 of 80
Single-answer
One of the lambda functions you business utilises for a business critical real-time security process has stopped working. It's a new function that was implemented by a staff member who has left the business. In an attempt to diagnose the problem you look for the logs of the lambda function but cannot locate any logging for the function which has been deployed to production for 3-4 weeks. You need to understand why the function isn't operating as expected. What could be the reason for the lack of logging, and what is a suitable corrective action (select 1)

A
The lambda function is configured to log directly to S3 - rather than using CloudWatch logs, add code within the function to log to CloudWatch Logs

* B
The role assigned to the Lambda function has insufficient permissions to write to CloudWatch logs - correct this and it will begin logging on the next invocation.

C
There are too many lambda functions running at once - there is a rate limit for writing to CloudWatch logs and the most recently creation function gets the lowest priority. Adjust the priority manually, or log a support ticket to increase CloudWatch rate limits.

D
The previous engineer didn't configure a valid log configuration within AWS Cloud Watch for the lambda function. Create the log stream and the function will begin logging.


Question 19 of 80
Multi-answer: Select 3
You have decided to set the threshold for errors on your application to a certain number and once that threshold is reached you need to alert the Senior DevOps engineer. What is the best way to do this? Choose 3.

A
Pipe data from EC2 to the application logs using AWS Data Pipeline and CloudWatch.

* B
Once a CloudWatch alarm is triggered, use SNS to notify the Senior DevOps Engineer.

* C
Set the threshold your application can tolerate in a CloudWatch Logs group and link a CloudWatch alarm on that threshold.

* D
Use CloudWatch Logs agent to send log data from the app to CloudWatch Logs from Amazon EC2 instances.


Question 18 of 80
Single-answer
After a major bug brought your web application down, a review determined that it took way too long to pinpoint the problem in log files. Which AWS service can you use to quickly analyze and search on log data?

A
CloudTrail

* B
AWS Elasticsearch

C
AWS EMR

D
AWS Redshift


Question 11 of 80
Single-answer
You have been asked to operationally assist with a serious environmental problem. You business has a large scale web application which utilises dynamoDB. A single table in your environment has over a TB of data and billions of rows. A previous administrator made a mistake and set the RCU value to 40,000 when its nominal value is 500. The RCU value was recently changed back to 500 but reads of the table were much slower than before then change. You have been asked to suggest a solution to return the performance of the table to previous levels without having to leave the RCU at 40,000 which is placing significant costs on the business.

A
Create an EC2 instance, and use a DynamoDB 'migrate data' command to migrate data from the existing table to a new table with appropriate RCU's set.

* B
Use AWS Datapipeline to export the data, delete the table and recreate it, set appropriate RCU and WCU values and then import the data. If outage time is an issue, export the data to a new table using datapipeline and adjust the application.

C
Log an AWS support request to consolidate the table partitions to a level which provides the desired performance.

D
Use the 'consolidate-partitions' command and reduce the number of DynamoDB partitions to normal levels. Return the RCU to 500 and performance will return to normal.


Question 8 of 80
Multi-answer: Select 3
Once we have our logs in CloudWatch, we can do a number of things such as: Choose 3.

A
Record API calls for your AWS account and delivers log files containing API calls to your Amazon S3 bucket

* B
Send the log data to AWS Lambda for custom processing or to load into other systems.

* C
Stream the log data into Amazon Elasticsearch in near real-time with CloudWatch Logs subscriptions.

* D
Stream the log data to kinesis.


Question 4 of 80
Single-answer
Your Manager has approached you about unexpected AWS charges and wants to know when charges reach a certain dollar amount for the month. How can you accomplish this?

A
Send billing logs to an SQS queue, use EMR to analyze the logs and email the manager when a threshold is exceeded.

B
This can only be done manually. Review the Billing Dashboard daily.

* C
Enable Billing Alerts, Create a billing alarm, set the dollar amount for the alarm, and set up an SNS notification to email the manager.

D
Write a Lambda function to retrieve billing information each morning and email the manager when the billing threshold is reached.


Question 1 of 80
Single-answer
We have an Amazon SQS queue. Worker nodes poll our queue for jobs. When they find jobs, they pull down the information locally to then process those jobs. The number of jobs fluctuates depending on many unpredictable factors. However, the more jobs there are, the more instances we need to process those jobs in a timely manner. How can we implement a system for this?

A
Implement CloudWatch monitoring that checks the size of the queue and triggers a custom script to scale out or scale in event depending on the size of the queue. The bigger the breach, the more instances we add(and vice versa).

* B
Implement CloudWatch monitoring that checks the size of the queue and triggers an Auto Scaling scale out or scale in event depending on the size of the queue. The bigger the breach, the more instances we add (and vice versa).

C
Using CloudFormation, configure a CloudWatch Logs group with a custom metric coupled with an alarm to send an SNS notification to a topic.

D
Implement CloudTrail monitoring that checks the size of the queue and triggers an Auto Scaling scale out or scale in event depending on the size of the queue. The bigger the breach, the more instances we add (and vice versa).


==============================================================================================================================================================
Domain 1: Continuous Delivery and Process Automation
==============================================================================================================================================================


Question 7 of 80
Single-answer
Consider an Auto Scaling group with a lifecycle hook that supports a custom action at instance launch. When the application experiences an increase in demand, Auto Scaling launches instances to add capacity. Because there is a lifecycle hook, the instance is put in the Pending:Wait state, which means that it is not available to handle traffic yet. When the instance enters the wait state, other scaling actions are suspended. After some time, the instance state is changed to Pending:Proceed, and finally InService where it can serve traffic. With this setup, you've noticed that instances are finished bootstrapping long before the state is changed to Pending:Proceed.

How can you change the state as soon as the instance is finished bootstrapping instead of waiting for the timeout?

* A
Use the complete-lifecycle-action call to complete the lifecycle action. Run this command against the API from within the UserData script once all other commands successfully complete and return a zero exit-status

B
Use the complete-lifecycle-action call to complete the lifecycle action. Run this command against the API from within another EC2 instance that keeps track of all instance's bootstrapping process.

C
You can't change the state manually, you have to wait for the timeout to expire, at which point the health check will determine whether the instance is ready to serve traffic or not.

D
Use the complete-lifecycle-action call to complete the lifecycle action. Run this command against the API from within the UserData script once all other commands successfully complete and return a non-zero exit-status


Question 14 of 80
Single-answer
Our team is tasked with migrating an existing application running on a custom application server to AWS. The application also has custom dependencies, and so we’re afraid it won’t work properly. What is a possible solution?

A
Package the application in multiple Docker containers and deploy with CloudFormation.

B
Store the code in a Git repository and develop custom package repository managers for each application's dependencies.

* C
We can package the application and dependencies with Docker, and deploy the Docker container with Elastic Beanstalk.

D
Use the CloudFormation Docker import service to migrate the application.


Question 15 of 80
Single-answer
A recent audit identified serious issues with your businesses backup regime within AWS. You have been asked to implement a backup solution which is resilient and able to scale in a cost-effective way within AWS, the system needs to offer fast restoration in the event of a major failure. Which option offers the BEST solution.

* A
Add backup tags to your EC2 instances defining how often backups should occur and what retention is required. Have a AWS Lambda function which runs periodically, parsing tags within the account, enumerating attached volumes and running EBS snapshots. Have another lambda function which runs, pruning snapshots beyond the retention requirements of the instances.

B
Install a commercial backup system within your on premises datacenter. Connect this to your AWS environment via a DirectConnect dedicated link. Utilise AWS CloudFormation to deploy a backup agent to all EC2 instances within your account and perform backups as required by policy.

C
Add backup tags to your EC2 instances defining how often backups should occur and what retention is required. Create a EC2 instance running a script which polls the AWS account using API's, parses tags, and performs backups to AWS Glacier in a alternative region as required.

D
Install a commercial backup system on an EC2 instance within an AZ in your most resilient region. Connect any VPC's together using VPC peering. Utilise AWS CloudFormation to deploy a backup agent to all EC2 instances within your account and perform backups as required by policy.


Question 25 of 80
Multi-answer: Select 2
Your CIO has asked you to move your server build automation towards a 'desired state' style architecture. Which options below would potential meet that requirement.

A
Use the AWS Config service to control the state of EC2 instances configure its 'state remediation' feature to add desired state to EC2 instances as required

* B
Move your EC2 and environment build processes to CloudFormation and use the "UserData" and Fn:base64 function to install a 3rd party configuration management agent into all EC2 instances.

* C
Move your EC2 and environment build processes to CloudFormation and use, cfn-init and the 'AWS::CloudFormation::Init' directive.

D
Move your EC2 and environment build processes to CloudFormation and use the "UserData" and Fn:base64 function to pass desired-state config into EC2 instances at startup.


Question 33 of 80
Single-answer
You're in charge of implementing an automated data backup solution for your application instances that run on Amazon EC2 with Amazon EBS volumes and in an Auto Scaling group. You want to use a distributed data store for your backups to avoid single points of failure and to increase the durability of the data. Your daily backups should be retained for 15 days so that you can restore data within an hour if you need to.

How can this be implemented through a script that a scheduling daemon runs daily on the application instances?

A
Write the script to call the ec2-create-volume API, tag the volume with the current date-time group, and use the ec2-copy-snapshot API to back up data to a new EBS volume. Use the ec2-describe-snapshot API call to list existing backup volumes. Then, delete EBS volumes that are older than 15 days with the ec2-delete-snaphot API call.

B
Write the script to call the ec2-create-volume API, tag the volume with the current date-time group, and copy backup data to another EBS volume. Use the ec2-describe-volumes API to list existing backup volumes. Call the ec2-delete-volume API to delete backup volumes that are tagged with a date-time group older than 15 days.

* C
Write the script to call the ec2-create-snapshot API, and tag the EBS snapshot with the current date-time group. Then, use the ec2-describe-snapshots API to list existing EBS snapshots. Call the ec2-delete-snapshot API to delete snapshots that are tagged with a date-time group older than 15 days.

D
Write the script to call the Amazon Glacier upload archive API in order to get distributed data storage, and tag the backup archive with the current date-time group. List the vaults to enumerate existing backup archives. Delete backup archives that are tagged with a date-time group older than 15 days


Question 37 of 80
Single-answer
You work for a business which performs Microsoft Sharepoint installations for small, medium and large businesses. recently the company has started to install these environments into AWS for clients and after much success is ramping up that area of the business. The sales team have asked you, as the operations engineer to develop a automated processes for creating demonstration environments for use during sales meetings. The sales team have indicated that their requirements, in order of priority are :-

the environments should be fast to provision - sales meetings are 45 minutes to 1 hour, they would like to begin the provisioning at the start of the meeting and have an environment available at the half way point.
the environments should be as economical as possible and removed at the end of the meeting
Some customisation should be possible - but this isnt a priority and cannot come at the cost of requirement #1 and #2.
In planning the automation, which option do you believe will meet the requirements the best.

A
Deploy the Sharepoint environment using elastic beanstalk using the enterprise sized environment option.

* B
Perform a generic installation of Sharepoint into a Windows Server image. Take an AMI of the EC2 instance. Create a CloudFormation template which uses this custom AMI and provisions it within an environment. Create a web interface allowing the sales team to apply the template, create a stack and access the resources in the sales meeting.

C
Use an OPSWORKS template to provision the environment by locating the SharePoint image in the OPSWORKS marketplace.

D
Run thought a manual installation of SharePoint, listing all build steps. Create a CloudFormation Template which uses 'userdata' or 'cfn-init' to perform the install into a AWS provided windows server AMI. Create a web interface allowing the sales team to apply the template, create a stack and access the resources in the sales meeting.


Question 45 of 80
Single-answer
You are in a meeting with a junior developer in the business. She has been asked to write a number of scripts for a project she is working on. The developer has heard of something called a 'provider chain' which is how the AWS CLI locates and preferences authentication details it's provided with. She has asked you to confirm the order in which the CLI selects credentials to use. Which option below is the correct order :-

A
Instance profile credentials -> Environment variables -> The AWS credentials file -> The CLI configuration file -> Container credentials

B
The AWS credentials file -> The CLI configuration file -> Container credentials

C
Instance profile credentials -> Environment variables -> The AWS credentials file

* D
Environment variables -> The AWS credentials file -> The CLI configuration file -> Container credentials -> Instance profile credentials


Question 47 of 80
Single-answer
You have been asked to implement a blue/green deployment procedure for one of your applications running within an elastic beanstalk environment. Which option below represents the correct way to implement this objective with elastic beanstalk.

A
Create two seperate Elastic Beanstalk applications, each with their own environment and use cloud formation together with route 53 and its health checks to implement weighted round robin.

B
Ensure you have a single environment, prepare a new app version, deploy this using a rolling update style deployment with the blue/green deployment pause option enabled.

C
Elastic Beanstalk is not capable of blue/green deployments, an alternative product should be used.

* D
Create a secondary environment, deploy a new application version to this environment, test, and then swap environment URL's using the CLI/API or Console.


Question 48 of 80
Single-answer
You are part of a development team of 5. You are using OpsWorks to deploy apps and cookbooks to each new instance from a remote repository. Each developer is working on separate branches and the app is deployed using the master branch. Your boss notices that there are instances serving different application versions with code that was not approved by QA. What happened?

A
Someone on the team committed their code to their separate branch and OpsWorks launched a new instance.

B
A rollback command was issued.

C
Updated custom cookbooks were automatically deployed to online instances.

* D
Someone on the team committed their code directly to the master branch and OpsWorks launched a new instance.


Question 49 of 80
Single-answer
After much consideration, based on the requirements of your deployment, you have decided to use CloudFormation instead of OpsWorks or Elastic Beanstalk. Unfortunately, you have discovered that there is a resource type that is not supported by CloudFormation. How can you solve this?

* A
Create a custom resource type using template developer, custom resource template, and CloudFormation.

B
Specify the custom resource by separating your template into multiple templates by using nested stacks.

C
Specify more mappings and separate your template into multiple templates by using nested stacks.

D
Use a configuration management tool such as Chef, Puppet, or Ansible.


Question 51 of 80
Single-answer
You have multiple similar three-tier applications and have decided to use CloudFormation to maintain version control and achieve automation. How can you best use CloudFormation to keep everything agile and maintain multiple environments while keeping cost down?

A
Create multiple templates in one CloudFormation stack.

B
Use CloudFormation custom resources to handle dependencies between stacks.

C
Combine all resources into one template for version control and automation.

* D
Create separate templates based on functionality, create nested stacks with CloudFormation.


Question 63 of 80
Single-answer
You are currently running an application on EC2 instances which are inside of an Auto Scaling group. You've implemented a system that automates deployments of configurations and the application to newly launched instances. The system uses a configuration management tool that works in a standalone configuration, with no master node. Because the application load is unpredictable, new instances must be brought into service within three minutes of the launch of the instance operating system. The deployment stages take the following times to complete:

Installing the configuration management agent: 2mins
Configuring the instance with artifacts: 3mins
Installing the application framework: 15mins
Deploying the application code: 1min
What process should you use to automate the deployment using this standalone agent configuration?

A
Configure the Auto Scaling launch configuration with a UserData script that installs the agent, pulls configuration artifacts and application code from an Amazon S3 bucket, and then executes the agent to configure the infrastructure and application.

* B
Bake a custom AMI that has all the components pre-installed, including the agent, configuration artifacts, application frameworks, and code. Then, have a startup script that executes the agent to configure the system on startup.

C
Configure an extra instance to poll the Amazon EC2 API to check for new instances launched in the Auto Scaling group. When it finds a new instance, it executes a remote script via SSH to install the agent, copy the configuration artifacts and application code, and then finally runs the agent to configure the new instance.

D
Bake a custom AMI that has all the components pre-installed, including the agent, configuration artifacts, application frameworks, and code.



Question 72 of 80
Single-answer
You have decided you need to change the instance type of your instances in production. You currently have 8 instances in production. You cannot have any interruption in service and need to ensure 4 instances are always running during the update. You need to make sure your customers have a seamless experience with your application during the update. Which policy should you use?

A
AutoScalingReplacingUpdate

B
AutoScalingScheduledAction

* C
AutoScalingRollingUpdate

D
AutoScalingIntegrationUpdate


Question 74 of 80
Single-answer
In your last deployment of your Windows application there was a major bug. Your DevOps team spent a whole day trying to rollback to the previous deployment when everything was working correctly. What should you do in the future to enable quicker roll backs from failed deployments?

A
Use CloudFormation and update the stack with the previous template.

B
Use OpsWorks and re-deploy using rollback feature and set the limit to 6.

* C
Use Elastic Beanstalk and re-deploy using Application Versions.

D
Use S3 to store each version and then re-deploy with Elastic Beanstalk.


Question 75 of 80
Single-answer
Your application is running on EC2 in an Auto Scaling group. Bootstrapping is taking 20 minutes to complete. You find out that instances are shown as InService although the bootstrapping has not completed. How can you make sure that new instances are not added until the bootstrapping has finished?

A
Increase the number of instances in your Auto Scaling group.

B
Create a CloudWatch alarm with an SNS topic to send alarms to your DevOps engineer.

C
Create a lifecycle hook to keep the instance in standby state until the bootstrapping has finished and then put the instance in pending:proceed state.

* D
Create a lifecycle hook to keep the instance in pending:wait state until the bootstrapping has finished and then put the instance in pending:proceed state.


Question 76 of 80
Single-answer
You work for a large software development company who produce a HR application. The business traditionally installs this application into customer premises but is looking to utilise AWS to host customer applications within their AWS environment. The business has a requirement for systems automation using CloudFormation to allow the application environment to be deployed. The business has a single large VPC defined which contains shared development, QA and monitoring systems. You have been asked to automated the deployment of instances of the application into their OWN VPC. You need to ensure that each application VPC operates with a seperate non overlapping CIDR to ensure VPC peering can be configured if required.

A
Use a CloudFormation template for each application environment, create a new stack for each environment. The template should create the VPC, subnets, networking config, and deploy application servers. Don't supply CIDR information to the VPC or Subnets and allow CloudFormation to automatically populate those values.

B
Use AWS Config to manage the configuration of IP range resources within the account VPC's. Configure event integration between CloudFormation and AWS config and use DynamoDB to maintain table of allocated ranges within the environment.

* C
Create a DynamoDB table to store IP range information. Use CloudFormation & CustomResources backed by AWS Lambda to consult the IP range table during every CREATE, UPDATE or DELETE operation and allocate, update or delete a set of IP ranges for the stack to use. The lambda function would ensure that IP ranges are non overlapping, and are allocated and de-allocated as stacks are created and deleted.

D
Use a CloudFormation template for each application environment, create a new stack for each environment. The template should create the VPC, subnets, networking config, and deploy application servers. Ask for the CIDR information as a CloudFormation parameter.


Question 77 of 80
Multi-answer: Select 2
You work for a small start-up and have decided to use Elastic Beanstalk to deploy your application. You are using EBS to store important data and it needs to be available on all your EC2 instances. How can you configure Elastic Beanstalk to make sure the data is always on the EC2 instances during each deployment? Choose 2.

* A
Create a .ebextensions directory and add commands to the config file .

* B
Add a ͞BlockDeviceMappings͟ option to your launch configuration.

C
Create a custom Chef recipe that mounts the EBS volume to each instance in the launch.

D
Use option_settings key to modify the Elastic Beanstalk configuration and define variables that can be retrieved from your application using environment variables.


Question 78 of 80
Single-answer
A development team within your business is using AWS Elastic Beanstalk to deploy and manage environments for a number of small applications. As the operations engineer you have been asked for a method of defining additional components within the elastic beanstalk environments. What would you tell the team?

* A
Define one or more .config files and place those within a .ebextensions folder in the root of your source bundle. Define the additional components as you would a Cloud Formation template. The .config file is valid in JSON or YAML.

B
SSH into the ElasticBeanstalk environment using the SSH key provided in the AWS KMS. Within the environment, obtain ARN of the EB resource master and use this within additional Cloud Formation stacks to integrate with the Elastic beanstalk environment.

C
In order to extend the functionality of Elastic Beanstalk and add additional components you need to deploy the EB environment via Opsworks. During deployment select the Elastic Beanstalk AMI, and set CloudFormation support to 'true' on all layers where the new components are required.

D
Define one or more .config files and place those within a .ebextensions folder in the root of your source bundle. Define the additional components as you would a Cloud Formation template. You can only use JSON, YAML is not yet supported in .config files within .ebextensions


Question 79 of 80
Single-answer
Your team is currently using a custom application server to run a custom application in rented racks at a local data center. After analyzing costs and flexibility, you realize that moving to the AWS platform will not only cut costs, but also increase performance and flexibility. However, you are worried with compatibility issues and you're not sure how to migrate the application over to AWS.

Which of these options should you choose to migrate over to AWS?

A
Use a CloudFormation template that provisions an Auto Scaling group with EC2 instances, and deploy the application and its dependencies to those instances via an archive hosted on Amazon S3.

B
Use a CloudFormation template that provisions an Auto Scaling group with EC2 instances, and deploy the application and its dependencies to those instances via an archive hosted on Amazon S3.

C
Use a Docker container that has the custom application and its dependencies installed on it, and use AWS OpsWorks to deploy that container to EC2 instances.

* D
Use a Docker container that has the custom application and its dependencies installed on it, and deploy that container with Elastic Beanstalk.


Question 80 of 80
Single-answer
While you would like to start building out parts of your infrastructure with CloudFormation, you are still receiving requirements for certain parts of the environment. This environment is quite complex. It involves networking components, policies, and multiple three-tier applications. Unfortunately you're not sure exactly how many more components there will be. How can you configure this solution?

A
Create multiple separate templates for each logical part of the system, and provide the outputs from one to the next using an Amazon Elastic Compute Cloud (EC2) Instance running the Python SDK for finer control.

* B
Create multiple separate templates for each logical part of the system, creating nested stacks in AWS CloudFormation and maintaining these separate templates in version-control.

C
Separate the networking layer (a VPC) into a separate CloudFormation template, then stick all other parts in one template. This is better since the VPC does not often change, while the other resources can change more often.

D
Create a single template by hand to encompass all resources that you need for the system, so you only have a single template to version-control. Once new requirements emerge, you can simply update the stack.


==============================================================================================================================================================