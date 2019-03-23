Question 1 of 6
Single-answer
Which best describes stack policies?

* A: JSON documents that define which update actions can be performed on which resources and applied to all users who have access to the stack.
B: JSON documents that define which update actions can be performed on which resources and applied to specific users who have access to the stack.
C: JavaScript documents that define which update actions can be performed on which resources and applied to all users who have access to the stack.
D: An IAM Policy which protects CloudFormation Stack resources.

Question 2 of 6
Multi-answer: Select 3
Which of the following best describe what cfn-init can do? cfn-init can:

* A: Install Packages
B: Detect changes in resource metadata and act on those changes
* C: Get and parse metadata from CloudFormation
* D: Enable and start services, as well as pass in configuration files for those services

Question 3 of 6
Single-answer
You’re in charge of changing the instance type of the EC2 instances in your Auto Scaling group. While you’re at it, you can also update the base AMI of those instances which contain a new application version. How can you deploy these changes without causing downtime using CloudFormation?

A: You need to terminate the existing Auto Scaling group and create a new launch configuration with the updated EC2 instance type and base AMI.
B: Use an AutoScalingScheduledAction update. This will update the instances in batches while ensuring that we have a minimum number of instances serving traffic.
* C: Use a rolling update. This will update the instances in batches while ensuring that we have a minimum number of instances serving traffic.
D: Use a replacing update. This will update the instances in batches while ensuring that we have a minimum number of instances serving traffic.

Question 4 of 6
Single-answer
Bootstrapping actions can take a long time to complete, increasing deployment times. How can we speed up the process?

* A: Prebaking AMIs
B: Use a configuration management system
C: Increase the number of instances in your Auto Scaling group
D: Create an Auto Scaling group lifecycle hook to hold the instance in a pending: wait state until your bootstrapping is complete.

Question 5 of 6
Multi-answer: Select 2
Which of the following best describes AWS stack resources?

* A: You can only have one stack policy per stack.
* B: Stack policies can protect specific resources from specific update actions.
C: After you set a stack policy, all of the resources in the stack are allowed by default.
D: Stack policies provide access control for AWS resources and actions.


Question 6 of 6
Single-answer
You have been tasked with managing the CloudFormation Stacks in your organization. In one of the stacks, the instances in an Auto Scaling Group need application updates. Each instance is using cfn-hup which will update the application. But the concern with using cfn-hup is that there is no coordination between the instances in the stack for when these updates will occur. How can you best avoid these coordination issues?

A: Take one instance out of the Auto Scaling Group at a time, update the application, then place the instance back in the auto scaling group.
B: Just allow cfn-hup to handle the update because the risks are minimal.
* C: Add an UpdatePolicy to your CloudFormation Template and use the AutoScalingRollingUpdate.
D: Create a second Auto Scaling Group which launches instances that have the updated application. Take the original Auto Scaling Group out of service.


Question 2 of 6
Single-answer
You deployed an application and its infrastructure via CloudFormation by creating a stack that provisions and configures instances and the application on those instances. You're also using the cfn-hup helper script to perform updates on the instances whenever CloudFormation Init Metadata for the instances is changed. To test this environment, you update a file declared in the Metadata, update the stack with this changed template, and see that the update was successfully applied by CloudFormation.

However, when you check the file on the instance, you notice that it hasn't changed. What went wrong?

A: The cfn-hup daemon does not work with CloudFormation Init Metadata. You have to use the CloudFormation Update Metadata section
B: The cfn-hup daemon does not work with CloudFormation Init Metadata. You have to use the CloudFormation Hup Metadata section
* C: Nothing went wrong. The hup daemon checks for changes in intervals, and it can take up to the interval period before the change is reflected. Check back in a few minutes.
D: You have to be more specific when defining what part of the instance metadata the HUP daemon should watch.


Question 5 of 6
Single-answer
You are setting up a WaitCondition for an on-premises configuration during your deployment. Which CloudFormation Helper Script would you use with a WaitCondition?

A: cfn-hup
* B: cfn-signal
C: cfn-get-metadata
D: cfn-init