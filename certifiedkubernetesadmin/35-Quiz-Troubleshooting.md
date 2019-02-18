1. kubectl logs returns what?

Choose the correct answer:
/var/log/messages from the target container and/or pod.
/var/log/syslog from the target container and/or pod.
* stdout and stderr from the target container and/or pod.
Any log specified from the target container and/or pod.


2. How can you run the command /usr/bin/id inside of the pod called "superman"?

Choose the correct answer:
kubectl run superman -- /usr/bin/id
kubectl exec -it superman -- /bin/bash to get a shell, then execute the command. There's no way to do it in a single command.
kubectl exec -c superman -- /usr/bin/id
* kubectl exec superman /usr/bin/id


3. You suspect that one of your nodes might be having some difficulty. What is a good command to get an overview of the current status of your cluster?

Choose the correct answer:
kubectl cluster-info
kubectl top pods
kubectl get metrics
* kubectl get nodes -o wide


4. What is a way for containers to write information about fatal events to a location, where it can be easily retrieved and surfaced by tools like dashboards and monitoring software, called?

Choose the correct answer:
Node logs
Custom logs
Annotations
* Termination Messages


5. When troubleshooting a particular pod, which of these commands is likely to give you the most detailed information?

Choose the correct answer:
kubectl get pods.
kubeadm describe.
kubectl get deployment.
* kubectl describe pod.