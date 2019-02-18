1. Which of these types of calls should be authenticated and authorized?

Choose the correct answer:
API calls from nodes to the master
API calls from users
* All of these
External service calls from third-party software and devices

2. Security context settings for a pod include all of the following except

Choose the correct answer:
* SecureImage
AllowPrivlegedEscalation
AppArmor
Privileged/Unprivileged

3. How could an administrator limit what a particular user could and could not do in a particular namespace?

Choose the correct answer:
Configure a new cluster role specifying the rules and applying them to the user object.
Configure a network policy with the appropriate permissions and then assign the policy to the user.
* Configure a new role in the user's namespace with the appropriate rules, then bind the role to the user subject.
Configure the user with the correct permission set in the namespace API object.

4. At which levels can you apply security contexts? (Select all that apply)

Choose the 2 correct answers:
 * Pod
 Service
 * Container
 Deployment

 Frank is signed in to his Kubernetes cluster and needs a few additional permissions that he does not currently possess to make his application work. How can he accomplish this?

5. Choose the correct answer:
He can create a new RBAC request to be approved by an administrator with the command kubectl create rolebinding --request
He can add permissions to a role by simply using kubectl update role
* He must seek an administrator that has the permissions he needs to get a role created with those permissions.
He can create a new role with the permissions he needs and bind that to his user and/or application.

What is a Pod Security Policy?

6. Choose the correct answer:
A way to control which pods can communicate with other pods and the network ports on which communication is permitted.
An API object representing the pod's allowed container images.
* A cluster-level resource that controls security sensitive aspects of the pod specification.
A way to control whether or not the pod can be created by certain roles.