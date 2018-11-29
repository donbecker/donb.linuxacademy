1. Examine the current status of your cluster. Are all the nodes ready? How do you know?
    * `kubectl get nodes` shows all nodes as having a status of ready
2. Are there any pods running on node 2 of your cluster? How can you tell?
    * Yes. `kubectl describe node donbecker2c.mylabserver.com` shows two 'Non-terminated Pods'
3. Is the master node low on memory currently? How can you tell?
    * No. `kubectl describe node donbecker3c.mylabserver.com` shows MemoryPressure=False
4. What pods are running in the kube-system namespace? What command did you use to find out?
    * `kubectl get pods --namespace kube-system` or `kubectl get pods -n kube-system`