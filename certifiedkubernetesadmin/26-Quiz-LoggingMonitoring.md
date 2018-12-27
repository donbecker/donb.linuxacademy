1. Which command will give you stdout of a pod called "to-the-screen"?

Choose the correct answer:
kubectl exec -it to-the-screen -- kube-get-stdout
kubectl get logs po to-the-screen
* (correct) kubectl logs to-the-screen
kubectl logs -f to-the-screen.yaml

2. What's the recommended method for dealing with applications that insist on writing out logs to a file rather than being able to redirect them to stdout?

Choose the correct answer:
* (correct) Find a logging agent that can operate inside the pod and send the logs to a central file store or log aggregator.
Don't use Kubernetes.
Do without logging.
Redirect the log file to ephemeral storage on the host.


3. Is it possible to get the logs back from a dead or evicted pod? If so, how?

Choose the correct answer:
Yes, restart the dead pod in safe mode and extract the file through scp or sftp.
No, once a pod is gone, all of its ephemeral storage is gone.
Yes, if the node is immediately cordoned, you can use the --inspect flag.
* (correct) Yes, add the --previous flag to the kubectl logs command.


4. Where does the Kubernetes key/value store (etcd) log file reside?

Choose the correct answer:
On the host in /etc/kubernetes/etcd.log
* (correct) On the host in /var/log/pods
On the host in /var/syslog
On the host in /var/log/kubernetes/etcd


5. Which log command will show you just the final 8 lines of stdout for a pod?

Choose the correct answer:
* (correct) kubectl logs --tail=8
kubectl logs -8
kubectl logs tail 8
kubectl get logs --tail=8


6. Is it possible to get a shell prompt to a Ubuntu 16.04 based container called "sidecar1" in the pod "star-aaaaaaaaaa-bbbbb"? There are several containers in the pod. If so, how?

Choose the correct answer:
No. This is only possible when there is a single container in the pod.
* (correct) Yes! kubectl exec -it star-aaaaaaaaaa-bbbbb --container sidecar1 -- /bin/bash
Yes! kubectl exec -it star-aaaaaaaaaa-bbbbb/sidecar1 -- /bin/bash
Yes! kubectl run star-aaaaaaaaaa-bbbbb sidecar1 -- /bin/bash


7. Starting with Kubernetes 1.8, there is a new metrics API. This can be accessed directly from the command line with which command?

Choose the correct answer:
* (correct) kubectl top [nodes | pods]
kubectl metrics [nodes | pods]
cadvisor list
heapster get info


8. I have a node called "node8" and I'd like to know what kind of load it's under including the CPU and Memory requests. Which of these commands would give me that information?

Choose the correct answer:
kubeadm status node8
kubectl describe deployments --all-namespaces --with-nodes
* (correct) kubectl describe node node8
kubectl get nodes --status{cpu.requests}&&{memory.requests}


9. What's an easy command to check the health and status of your cluster?

Choose the correct answer:
* (correct) kubectl get nodes
kubeadm k8s-status
kubectl create -f status
kubectl cluster-status


10. I'm troubleshooting an application issue and would love to see the application's logs, which are in a file in the container "appctn" in the pod "apppod-abcdef123-45678" at /var/log/applog. Which of these commands would list that for me?

Choose the correct answer:
kubectl logs apppod-abcdef123-45678
* (correct) kubectl exec apppod-abcdef123-45678 -- cat /var/log/applog
kubectl logs apppod-abcdef123-45678 -c appctn
kubectl logs -c appctn