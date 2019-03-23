Question 1 of 6
Multi-answer: Select 2
After creating several EC2 instances in your AWS environment, you want to automatically publish log events to CloudWatch. Which agent do you need to install on the EC2 instances to perform this task?

A: Logs Stream
* `B: CloudWatch Logs Agent
C: Events Agent
* D: CloudWatch Agent


Question 2 of 6
Single-answer
You are configuring CloudWatch in your environment and would like to publish data that is not otherwise supported by CloudWatch. How can you do this?

* A: Generate custom metrics to publish data that is not supported out of the box.
B: A custom API can be created to meet the requirement.
C: This can be accomplished with Perl scripts.
D: It is not possible to publish customized data.


Question 3 of 6
Single-answer
You are architecting your AWS environment. One of your requirements is to have an alarm for when a specific API call is made. How can you best architect a solution?

A: Send your API calls to an SQS queue and create an alarm based on queue size.
B: It is not possible to have an alarm for API calls.
* C: Send CloudTrail events to CloudWatch and alarms can be created for specific API calls.
D: Create a CloudWatch Alarm for the specific API call for which you would like to receive an alarm notification?


Question 4 of 6
Single-answer
You have configured an environment that includes an Elastic Load Balancer, an Auto Scaling Group, and several EC2 instances. Your requirement is to terminate any instances if CPU utilization goes below 20%. How would you do this?

* A: Integrate CloudWatch with the Auto Scaling Group such that CloudWatch sends an alarm notification when CPU utilization is less than 20%. Configure the Auto Scaling Group to terminate the instance when receiving this notification.
B: Set up a CloudWatch alarm for CPU utilization less than 20%. Auto Scaling Groups interact automatically with CloudWatch and no further configuration is needed.
C: Set up a CloudWatch alarm for CPU utilization less than 20%. Send an alarm notification to the Elastic Load Balancer and have the ELB de-register the instance.
D: Set up SNS notification to your support staff when CPU utilization is less than 20%. Support staff can then remove the instance.


Question 5 of 6
Multi-answer: Select 2
What are examples of CloudWatch Namespaces?

A: Server=Prod
B: Server=Beta,Domain=California
* C: AWS/EBS
* D: AWS/ELB


Question 6 of 6
Single-answer
You are using Custom Metrics for CloudWatch to monitor memory usage on your EC2 instances. You are using User Data during bootstrapping to the CloudWatch Logs Agent on your EC2 instances. But you would like to further automate this by using an AWS service to deploy the agent on to your instances. Which of CloudFormation, OpsWorks, and Elastic Beanstalk can you use?

* A: Any of these services will work to deploy the CloudWatch Logs agent on your EC2 instances.
B: CloudFormation and OpsWorks will work, but Elastic Beanstalk is not equipped for this deployment.
C: CloudFormation templates are the only way to do this.
D: OpsWorks is best suited for this situation.


Question 1 of 6
Single-answer
An Elastic Load Balancer is configured in your environment and you would like to use CloudWatch to monitor the EC2 instances registered to your ELB. Which CloudWatch metric can be used to provide the number of unhealthy instances currently registered to the ELB?

A: UnHealthyInstanceCount
B: This would be a custom metric and not configurable out of the box.
C: HealthyHostCount
* D: UnHealthyHostCount


Question 2 of 6
Multi-answer: Select 2
After creating several EC2 instances in your AWS environment, you want to automatically publish log events to CloudWatch. Which agent do you need to install on the EC2 instances to perform this task?

A: Logs Stream
* B: CloudWatch Logs Agent
C: Events Agent
* D: CloudWatch Agent


Question 3 of 6
Multi-answer: Select 2
What are examples of CloudWatch Namespaces?

A: Server=Prod
B: Server=Beta,Domain=California
* C: AWS/EBS
* D: AWS/ELB


Question 4 of 6
Single-answer
You run a multi-tier architecture on AWS with webserver instances running Nginx as a reverse proxy. You'd like to implement logging for these webserver instances so that you can collect log data from the Nginx service and kernel logs. You've just received an alert that users are running into 5XX errors, and you want to filter through your logs to find these errors. How can you implement this quickly and cost-effectively?

A: Reverse proxies do not return 5xx errors so this question does not make sense.
B: Install the CloudWatch Logs agent and send Nginx access log data to CloudWatch. From there, pipe the log data through to a third party logging and graphing tool. Inside the platform, create filters for 5xx errors.
* C: Install the CloudWatch Logs agent and send Nginx access log data to CloudWatch. Then, filter the log streams for 5xx errors.
D: Use a third party tool that grabs log data from your instance and pipes it through a logging and graphing platform. Inside of the platform, create filters for 5xx errors.


Question 5 of 6
Single-answer
You are architecting your AWS environment. One of your requirements is to have an alarm for when a specific API call is made. How can you best architect a solution?

A: Send your API calls to an SQS queue and create an alarm based on queue size.
B: It is not possible to have an alarm for API calls.
* C: Send CloudTrail events to CloudWatch and alarms can be created for specific API calls.
D: Create a CloudWatch Alarm for the specific API call for which you would like to receive an alarm notification?


Question 6 of 6
Single-answer
You have configured an environment that includes an Elastic Load Balancer, an Auto Scaling Group, and several EC2 instances. Your requirement is to terminate any instances if CPU utilization goes below 20%. How would you do this?

* A: Integrate CloudWatch with the Auto Scaling Group such that CloudWatch sends an alarm notification when CPU utilization is less than 20%. Configure the Auto Scaling Group to terminate the instance when receiving this notification.
B: Set up a CloudWatch alarm for CPU utilization less than 20%. Auto Scaling Groups interact automatically with CloudWatch and no further configuration is needed.
C: Set up a CloudWatch alarm for CPU utilization less than 20%. Send an alarm notification to the Elastic Load Balancer and have the ELB de-register the instance.
D: Set up SNS notification to your support staff when CPU utilization is less than 20%. Support staff can then remove the instance.