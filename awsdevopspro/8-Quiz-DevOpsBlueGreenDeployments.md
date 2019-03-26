Question 1 of 5
Multi-answer: Select 2
What are the capabilities provided by Blue/Green deployments? Choose two

* A: Rollback Capabilites
* B: Near zero downtime
C:In-place updates
D: Cost optimization


Question 2 of 5
Single-answer
You have an Auto Scaling Group behind an Elastic Load Balancer. You are planning a Blue/Green deployment but have some concerns about DNS and do not want to use it for the deployment. What other options can you use?

A: Update Auto Scaling Group Launch Configurations
B: Move Elastic IP Addresses from the blue instances to the green instances.
C: Cross-Account access from your Blue environment to the Green environment.
* D: Swap the Auto Scaling Group Behind Elastic Load Balancer


Question 3 of 5
Multi-answer: Select 2
Which are key services in implementing Blue/Green deployments.

* A: Elastic Load Balancing
* B: Route 53
C: CloudTrail
D: AWS Config


Question 4 of 5
Multi-answer: Select 2
You want to perform a Blue/Green deployment by updating DNS routing with Route 53. What needs to be present to do this? Choose 2 answers

A: Internet Gateway
B: Encryption Key
* C: IP Address
* D: DNS name


Question 5 of 5
Multi-answer: Select 2
What common Risks can Blue/Green deployments mitigate? Choose 2

* A: Rollback Capability
B: Latency
C: Cost
* D: Downtime


Question 2 of 5
Single-answer
You are considering a Blue/Green deployment on your OpsWorks stack. What's the best way to accomplish this?

* A: Clone a Stack in AWS OpsWorks and Update DNS.
B: Swap urls in the OpsWorks Console.
C: You can't do Blue/Green deployments with OpsWorks.
D: Add a new Auto Scaling Group (green), gradually scale it up while deregistering instances in the old ASG (blue).


Question 4 of 5
Single-answer
What is it called when you send a small amount of test traffic or production traffic to your green environment to validate it before promoting to production?

A: beta testing
B: weighted routing
C: Functional Testing
* D: Canary Testing


Question 4 of 5
Single-answer
If you have created both a blue and green environment in Elastic Beanstalk, how can you perform the Blue/Green deployment?

* A: swap the environment URLs
B: Use Weighted routing in Route 53 to shift traffic to the new environment.
C: Go to Route 53 and change the alias record.
D: You can't do Blue/Green deployments in Elastic Beanstalk.