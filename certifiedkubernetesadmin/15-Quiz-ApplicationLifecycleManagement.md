1. Which parameter is used to increase or decrease the number of pods that make up a deployment?

Choose the correct answer:
* Replicants
* Nodes
* Syncs
* (correct)Replicas

2. Which of the following are valid 'restart policies' for Kubernetes Pods (SELECT ALL THAT APPLY)?

Choose the 3 correct answers:
* (correct) Always
* (correct) Never
* (correct)  OnFailure
* OnReboot

3. Is it possible to configure an application in a container from Kubernetes? If so, how is this accomplished?

Choose the correct answer:
* Yes, through the use of annotations. Annotations are key/value pairs used by the applications in the service.
* Yes, through the use of Network Policies. While originally intended to be the traffic cops of the network, developers often use them "off label" to configure applications.
* (correct) Yes, through the use of environment variables. These can be set in the YAML file for the appropriate pod.
* No, this is not possible at this time but is planned for a future release.

4. You are writing YAML for a pod, and want to limit its CPU utilization to one quarter of the CPU. Which of the following lines will most likely be in your final YAML file? (Ignore whitespace)

Choose the correct answer:
* (correct) cpu: "250m"
* cpu: "1:4"
* cpu: "0.250m"
* cpu: "25"

5. I have a deployment called "healer" running on my cluster. I look at the pods on a node and notice that there are two pods running there -- "healer-xxxxxxxx-yyyy" and "healer-xxxxxxxx-yyyz". What will happen if I issue the command "kubectl delete pod healer-xxxxxxxx-yyyz"?

Choose the correct answer:
* Kubectl will issue an error message, as this pod is in use. Adding the --force flag will allow you to complete this action.
* (correct) The pod will be deleted, but the deployment will immediately spin up another pod to replace it, possibly on another node.
* The pod will be deleted. If there is an Ingress or Service Load balancer pointing to that pod, those requests will time out.
* Nothing. The pod is protected by the deployment it runs in.

6. Which of these is a difference between annotations and labels in Kubernetes?

Choose the correct answer:
* Labels allow a wider variety of characters to be used in their names than annotations.
* They are the same thing.
* Annotations use a key/value pair config map.
* (correct) Labels are used to select and identify objects. Annotations are not.

7. Which of these is the correct hierarchy of related Kubernetes API objects?

Choose the correct answer:
* Pods run services, which in turn are managed by deployments.
* Pods, services, and deployments refer to the same level of hierarchy in K8s.
* (correct) Pods make up deployments. Services point to deployments.
* Services point to pods. Pods are made up of deployments.

8. There are many ways to assign a pod to a particular node, but they all involve the use of what?

Choose the correct answer:
* annotations
* kubectl
* (correct) labels
* affinity or anti-affinity

9. Which of these is the best use case for a DaemonSet?

Choose the correct answer:
* A monitoring back-end that only needs intermittent network access.
* A stateless web-head that will be load-balanced among many nodes.
* (correct) A CNI container that needs to run on every node in order to function properly.
* A MariaDB/Galera cluster that must autoscale depending on CPU utilization.

10. Which of these commands would scale up a deployment called "soup" from 3 pods to 5?

Choose the correct answer:
* kubectl scale --current-replicas=3 --replicas=5 ds/soup
* (correct) kubectl scale --replicas=5 deployment/soup
* kubectl scale --replicas=3 soup
* kubectl scale --current-replicas 3 --replicas 5 ds soup