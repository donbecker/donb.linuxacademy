1. What is required to specify a service type of "LoadBalancer"?

Choose the correct answer:
A pod to check the health of the other pods.
Three or more pods in a deployment.
Nothing -- it's built in.
* (correct) A cloud provider that supports Kubernetes-provisioned load balancers.

2. What is an Ingress as it relates to Kubernetes?

Choose the correct answer:
* (correct) An API object that manages external access to the services in a cluster, usually HTTP.
An API object that creates a services load balancer to access services in the cluster from alternate nodes.
A port on the master where containers are mapped to pods.
A method of routing control-plane instructions to the master node.

3. For a user to be able to request an Ingress resource, what must the cluster have?

Choose the correct answer:
An iSCSI volume to store configuration information.
A DaemonSet of redis for storing configuration information.
A CNI that supports Ingress.
* (correct) An Ingress controller compatible with available and appropriate service providers like load balancers.

4. What handles inter-pod communication?

Choose the correct answer:
VLANs
GRE tunnels
* (correct) The CNI
Host networking

5. Think about the YAML for a network policy. If you had to create one, what is the pattern?

Choose the correct answer:
* (correct) Preamble, podSelector, ingress, and/or egress rules
Preamble, podSelector, hosts, ingress rules, egress rules
Preamble, host, podSelector, ingress, and/or egress rules
Preamble, ingress rules, host(s), egress rules, host(s)

6. If an Ingress request is made with no associated rules, what happens?

Choose the correct answer:
All traffic is forbidden in the namespace.
* (correct) All traffic is sent to a single host.
All traffic is forbidden in the namespace except to the named host.
The request fails and no Ingress is created. Rules are required.

7. What determines how a set of pods are allowed communicate with one another and other network endpoints?

Choose the correct answer:
PVCs
Ingress
* (correct) Network Policies
RBACs

8. Ingress is fairly new to the Kubernetes stack. What version number was the first one to include it?

Choose the correct answer:
1.0
* (correct) 1.1
1.5
1.8

9. When a service type of "ClusterIP" is used, what is the result?

Choose the correct answer:
A port on the node where the pod resides, usually above 30000.
* (correct) A single IP address within the cluster that redirects traffic to a pod (possibly on a different node) serving the application (the pod).
An single IP address external to the cluster that is drawn from a pool of available public addresses.
An IP address in a specialized bridge network that links the external network to the internal cluster network.

10. If a service called "web-head" is exposed in the default namespace, then other pods can resolve it using all of these hostnames except which?

Choose the correct answer:
web-head
All of these will resolve properly.
web-head.default
* (correct) web-head.local

