1. Why are annotations particularly important when using multiple or custom schedulers?

Choose the correct answer:
* Because they are the only audit trail available for the scheduler.
* (correct) Because they can remind operators which scheduler was used to place (or fail to place) a pod.
* Because they are how the scheduler is specified.
* Because multiple schedulers are not allowed without annotations because of the security risk.


2. What are taints and what are they applied to?

Choose the correct answer:
* (correct) Taints are used to repel certain pods from nodes and are applied to nodes.
* Taints are used to repel workloads from one another (anti-affinity) and are applied to pods.
* Taints are used to mark a pod as unavailable during an outage and are applied to pods.
* Taints are used to repel workloads with certain labels and are applied to nodes and pods.


3. How can a pod be assigned to a specific node?

Choose the correct answer:
* Set node constraints in the node's YAML.
* The scheduler does not allow for pods to be placed manually.
* (correct) Using a nodeSelector with properly labelled nodes.
* Use the host property in the pod's YAML.


4. What is the scheduler?

Choose the correct answer:
* A subprocess of the CNI.
* A distributed DaemonSet on the cluster.
* (correct) A pod on the master node.
* An isolated, non-containerized process on the master node.


5. If a toleration and a taint match during scheduling, what happens?

Choose the correct answer:
* An error — taints and tolerations cannot be used together in the same namespace.
* The toleration is ignored and the node might be scheduled for uncordon.
* (correct) The taint is ignored and the pod might be scheduled to the node.
* The toleration and taint reinforce one another, further guaranteeing that the pod is not scheduled on the node.


6. When an API request is made to create a pod, which piece determines which node will be used to instantiate the new pod?

Choose the correct answer:
* The API Server itself
* The Kubelet on the target node
* kube-proxy finds a free node
* (correct) The scheduler


7. If a pod requests more resources than is available on any given node, what happens?

Choose the correct answer:
* The scheduler will return an error.
* The pod will get scheduled on the master node.
* (correct) The pod will not be scheduled until a node with the resources becomes available.
* The pod will move into a "NotReady" status.


8. What is podAffinity used for?

Choose the correct answer:
* Preventing two pods from being placed on the same node.
* Ensuring replicated pods in the same deployment are placed on different nodes.
* (correct) Placing two or more pods on the same node.
* Allowing nodes with containers in the same pod access to a higher-speed network.


9. Why might a user desire two pods to have anti-affinity?

Choose the correct answer:
* She wants them to share memory space on a node.
* (correct) She wants them to run on different nodes to avoid sharing failure domains.
* She wants them to run on the same node to speed up networking traffic between them.
* She wants them to be on network adjacent nodes for faster shared disk access.


10. How can a user specify which scheduler a pod should use?

Choose the correct answer:
* By adding a schedulerName=*scheduler* annotation to the metadata.
* By adding a schedule=custom label to the metadata.
* (correct) Through the schedulerName tag in the spec.
* Through the scheduler-name tag in the spec.