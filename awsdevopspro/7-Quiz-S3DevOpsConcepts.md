Question 1 of 5
Single-answer
Your application requires long-term storage for backups and other data that you need to keep readily available but with lower cost. Which S3 storage option should you use?

A: S3 Standard
B: Reduced Redundancy Storage
C: Glacier
* D: Amazon S3 Standard - Infrequent Access


Question 2 of 5
Single-answer
You have data stored in Amazon Glacier. Your requirements changed and you now need to access this data more frequently. How can you transition the data back to other storage classes?

A: Set up a lifecycle rule to transition back to S3, then you can transition the data to whatever storage class you choose.
B: Set up a lifecycle rule to transition back to S3 IA.
C: Contact Amazon to enable this Lifecycle Rule.
* D: There is no lifecycle rule to move data from Glacier. But you can do a restore from the S3 console.


Question 3 of 5
Single-answer
Your company has two AWS accounts, one for Dev and one for Prod. You dev team needs access to a bucket in the prod account. What is the best way to give this access?

* A: Create a cross-account role and bucket policy.
B: They will have access since the accounts are within the same company.
C: Change your prod bucket permissions to allow access to everyone.
D: Duplicate your dev users in the prod account.


Question 4 of 5
Single-answer
You have enabled Access Logs for your Elastic Load Balancer. Now you are creating a Bucket Policy to allow the logs to be stored in an S3 Bucket. One of the entries when creating the Bucket Policies is Principal. What do you need to put in the Principal field?

A: Global Elastic Load Balancing Account ID
B: Account ID of the owner of the Load Balancer
C: An Admin User Account
* D: Elastic Load Balancing Account ID for the Region


Question 5 of 5
Single-answer
You work for an accounting firm and need to store important financial data for clients. During the tax season, you need to access data frequently. After tax season, the data is archived. What is the most cost-effective way to do this?

A: Store all data in a private S3 bucket.
* B: After tax season, use lifecycle management to move data to Glacier.
C: Use lifecycle management to store all data in Glacier and when needed during tax season move to S3.
D: Store all data in a Glacier.


Question 1 of 5
Single-answer
Which item is a mandatory step when exporting Load Balancer log data to S3?

A: Set up a CloudWatch Alarm for Access Logs
B: You can not store access logs in S3
C: Enable Access Logs on your S3 Bucket
* D: Enable Access Logs on your Load Balancer


Question 4 of 5
Single-answer
You are working on enabling your ELB access log data to be sent to S3. What do you need to configure on the S3 side to allow this?

A: A Listener for the Access Logs
B: Security Group
* C: Bucket Policy
D: Enable Access Logs