* Scheduling (5%)
    * How do you label a pod?
    * How do you label a node?
    * How do you schedule a specific pod to a specific node?
    * What is a daemonset and how are they used? 
    * What if a pod is requesting more resources than available, what happens? 
    * How do you specify wich scheduler a pod should use, if there are multiple schedulers? 
    * If there is no scheduler, can you still deploy a pod? 
    * How can you take a look at the events log from a scheduler? 
    * By default, which node runs the scheduler? 
* Logging & Monitoring (5%)
    * What are the components of the cluster, and where do they run? 
    * How do you monitor the components of the cluster? 
    * How can you check on individual services, deployments and pods? 
    * How can you grab the output of stdout from a particular pod? 
    * What about other logs that might be written to an individual container? 
    * What are some of the strategies for dealing with disperate logs in different applications? 
* Application Lifecycle Management (8%)
    * How would you update a deployment to use a new version of the nginx image? 
    * What is the main way for kubernetes to configure an application? 
    * How does a piece of information get from the command line (yaml), to the container, and ultimately the application? 
    * How can you manually scale up a deployment? 
    * How can you manually scale down a deployment? 
    * What does self-healing mean in relation to kubernetes? 
    * How does kubernetes enable self-healing? 
* Cluster Maintenance (11%)
    * How do you evict all pods from a node prior to maintenance? 
    * How do you put a node back into service?
    * How do you backup and restore a node? 
* Security (12%)
    * How do you configure authentication on a server? 
    * How do you change how a user is logging into the cluster? 
    * What's the default security state of pod networking? 
    * How can the default security state of pod networking be changed? 
    * How are pods selected for a network security policy to be applied to them? 
    * What's the process for creating and replacing TLS certificates for cluster components? 
    * Where should your cluster images come from, and why? 
    * What is a security context and how do you define one? 
    * What does kubernetes use for it's key value store and how do you secure it? 
    * How do you define a new role and apply it to a particular user or service account? 
* Storage (7%)
    * How do you allocate persistent storage volumes? 
    * What's a storage class and why are they important? 
    * What are the three main access modes for persistent volumes? 
    * What is the difference between a persistent volume claim and a persistent volume? 
    * What is the lifecycle between a persistent volume claim and a persistent volume and how are they linked? 
    * How can you provide an application with persistent storage in a pod? 
* Troubleshooting (10%)
    * What components would you check if an application in a deployment wasn't working correctly? 
    * What would you do if the API wasn't responding? 
    * What would you do if a node wasn't responding? 
    * How can you determine if the network is working correctly? 
* Core Concepts (19%)
    * What are the kubernetes API primitives? 
    * What's the difference between a pod, deployment and a service?
    * What's the difference between a pod and a node? 
    * What's a network policy? 
    * Which component accepts requests on behalf of the cluster? 
    * Which component directs traffic around the cluster? 
    * Which component orchestrates the containers on the worker nodes? 
    * Which component provides name resolution for the pods? 
* Networking (11%)
    * What is the networking model that kubernetes uses and how is it implemented? 
    * How many IP addresses does a pod get? 
    * Does the number of IP address a pod has change due to the number of containers in the pod? 
    * How do you create a service? 
    * What are the types of services? 
    * What are ingress rules? 
    * What is required for an ingress rule to be enforced? 
    * How is name resolution handled inside of a pod? 
    * What is the point of CNI? 
* Installation, Configuration, & Validation (12%)
    * What is needed to run kubernetes? 
    * What technology is used to make sure cluster communications are secure? 
    * What are the components of kubernetes that you need to make it highly available? 
    * Where would you grab the kubernetes binaries from? 
        * A: kubernetes.io
    * What packages are used to install kubernetes? 
    * What CNIs are available? 
    * If you are running the cluster on GCE, what are the e2e tests for? 