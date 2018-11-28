1. What is the difference between a Docker volume and a Kubernetes volume?

Choose the correct answer:
* Back-end Drivers. Docker supports more block storage types than Kubernetes does.
* (correct) Volume lifetimes. In Docker, this is loosely defined. In Kubernetes, the volume has the same lifetime as its surrounding pod.
* Size: Docker volumes are limited to 3TB. Kubernetes volumes are limited to 16TB.
* Proximity: In Docker, volumes can reside on the same host with their containers. In Kubernetes, they must reside on separate metal for resiliency.

Correct answer
Volume lifetimes. In Docker, this is loosely defined. In Kubernetes, the volume has the same lifetime as its surrounding pod.

Explanation
Docker volumes are not used in conjunction with Kubernetes at this time.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

2. Which of these are not inherently created by Kubernetes?

Choose the correct answer:
* Pods
* Controllers
* (correct) Nodes
* Services

Correct answer
Nodes

Explanation
Nodes are added to a cluster, and a Kubernetes object is created to reflect them, but Kubernetes itself doesn't create them.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

3. Containers are run on which of these?

Choose the correct answer:
* Controllers
* (correct) Nodes
* Services
* None of these

Correct answer
Nodes

Explanation
Nodes run the pods.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

4. In Kubernetes, a group of one or more containers is called:

Choose the correct answer:
* A swarm
* A selector
* A minion
* (correct) A pod

Correct answer
A pod

Explanation
A pod is usually one container but can be a group of containers working together.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

5. Which of these components mount volumes to containers?

Choose the correct answer:
* kube-scheduler
* (correct) kubelet
* fluentd
* kube-proxy

Correct answer
kubelet

Explanation
The kubelet which runs on nodes handles moment-to-moment management of the pods on its node.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

6. If memory is running low on a running node, which of these keys will return "True"?

Choose the correct answer:
* (correct) MemoryPressure
* Warning
* OOM
* LowMemory

Correct answer
MemoryPressure

Explanation
MemoryPressure and DiskPressure return true as a node starts to become overcommitted.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

7. Unique IP addresses are assigned to:

Choose the correct answer:
* (correct) Pods
* Container Hosts
* NAT is used extensively, so unique IP addresses are irrelevant
* Containers

Correct answer
Pods

Explanation
A pod gets assigned a single IP address, regardless of how many containers make it up. This is analogous to many services running on a single virtual machine.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

8. The connection between the apiserver and nodes, pods and services:

Choose the correct answer:
* (correct) Is unencrypted and therefore unsafe to run over public networks.
* Is currently encrypted with IPSec with plans to allow other encryption plugins later.
* Is always encrypted with IPSec.
* Is always encrypted using the method configured in the .kube file.

Correct answer
Is unencrypted and therefore unsafe to run over public networks.

Explanation
It's a fairly simple process to encrypt the streams using TLS.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

9. What does a pod represent in a Kubernetes cluster?

Choose the correct answer:
* (correct) A running process
* All the containers in the cluster
* A set of rules for maintaining high availability
* Conditions under which applications will autoscale

Correct answer
A running process

Explanation
Pods are the running containers in a Kubernetes cluster.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

10. Usually, when submitting a Kubernetes API call, data is sent in which format? (Select all that apply)

Choose the 2 correct answers:
* (correct) YAML
* XML
* (correct) JSON
* DOC

Correct answer
JSON, YAML

Explanation
If using a direct API call in an application, JSON is used. If using kubectl to submit a request, it takes YAML.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

11. In a typical deployment, the Kubernetes Master listens on what port number?

Choose the correct answer:
* 22
* 80
* 3001
* (correct) 443

Correct answer
443

Explanation
The API server, by default, listens on port 443, the secure HTTP port.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

12. Communications between the apiserver and the kubelet on the cluster nodes are used for all but which of the following?

Choose the correct answer:
* Attaching (through kubectl) to running pods
* Providing the kubelet's port-forwarding capability
* Fetching logs for pods
* (correct) Keep-alive xml packets

Correct answer
Keep-alive xml packets

Explanation
Communications between the apiServer and the Kubelet are constantly communicating for a variety of purposes.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

13. Kubernetes changed the name of cluster members to "Nodes." What were they called before that?

Choose the correct answer:
* Workers
* Cogs
* (correct) Minions
* Slaves

Correct answer
Minions

Explanation
A lot of documentation and tutorials online still refer to worker nodes this way.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

What controls a Kubernetes cluster?

Choose the correct answer:
* minikube
* kubelet
* (correct) The Master
* kube-proxy

Correct answer
The Master

Explanation
The master node contains the Kubernetes api server, which controls what the cluster does.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155

15. Which of these is a list of common Kubernetes primitives?

Choose the correct answer:
* pod, swarm, namespace, network
* service, deployment, replicaset, etcd
* (correct) pod, service, persistentVolume, deployment
* containers, vms, hypervisors, daemons

Correct answer
pod, service, persistentVolume, deployment

Explanation
There are many others, but those are the ones you'll likely work with most often.

Further Reading
https://linuxacademy.com/cp/courses/lesson/course/1412/lesson/1/module/155