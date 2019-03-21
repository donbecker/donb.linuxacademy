Question 1 of 6
Single-answer
You have configured an Elastic Load Balancer for your AWS environment and have created an S3 Bucket to store the ELB Access Logs. After a few days you go to your S3 Bucket to view the access logs but there are no log files in your bucket. Which selection would you need to perform for the Access Logs to show up in the S3 Bucket ?

A: You need to set up cross-account access to the bucket.

B: It takes 5 days for the first set of access logs to be placed in your bucket.

* C: You have not enabled access logs for your Elastic Load Balancer.

D: You did not create an IAM Role to access the S3 bucket.

Question 2 of 6
Single-answer
You are working with Auto Scaling Lifecycle Hooks. Your instance goes into the pending:Wait state. How long is the default lifecycle wait state?

* A: 60 minutes

B: 20 minutes

C: 10 minutes

D: 5 minutes

Question 3 of 6
Single-answer
You are deploying an application on an architecture that includes an Elastic Load Balancer, EC2 instances, EBS volumes, and data that will be stored in S3. Your application's data will flow end to end through all of these services. The data is highly sensitive customer financial information and is protected under security and compliance regulations, and must be protected both at rest and in transit. Which configuration satisfies these security and compliance regulations?

* A: Use SSL load balancing, an SSL listener on EC2 instances, EBS encryption on volumes that contain the private information, and Amazon S3 server-side encryption.

B: Use TCP load balancing on the load balancer, an SSL listener on EC2 instances, and Amazon S3 server-side encryption.

C: Use TCP load balancing on the load balancer, an SSL listener on EC2 instances, EBS encryption on volumes that contain the private information, and Amazon S3 server-side encryption.

D: Use SSL load balancing, EBS encryption on volumes that contain the private information, and Amazon S3 server-side encryption.

Question 4 of 6
Single-answer
Where are Elastic Load Balancing logs stored?

A: Kinesis

* B: S3

C: CloudWatch

D: Glacier

Question 5 of 6
Single-answer
You are creating a CloudFormation template to deploy a new environment. This environment will include an Elastic Load Balancer with ELB Health Checks. You need to store the Elastic Load Balancer logs cheaply and to enable quick retrieval of those logs. Where would you store your ELB logs?

A: CloudWatch

B: Kinesis

* C: S3

D: Glacier

Question 6 of 6
Single-answer
You are using CloudFormation to deploy your environment which includes an Elastic Load Balancer. You have decided to configure your access logs with a publishing interval of 5 minutes and need to know the details being reported. Which fields are reported for Elastic Load Balancer access logs?

A: timestamp, backend:httpcode_5xx, backend_processing_time, request_processing_time, received_bytes

B: timestamp, backend:connection_errors, latency, availability_zone, backend_processing_time

C: timestamp, backend:httpcode_5xx, backend:httpcode_4xx, latency, request_processing_time

* D: timestamp, backend:port, backend_processing_time, request_processing_time, received_bytes