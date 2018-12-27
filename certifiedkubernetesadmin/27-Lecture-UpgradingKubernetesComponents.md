1. Check current K8s version on nodes
    * `kubectl get nodes`
    * all show v1.12.2
2. First step is upgrade kubeadm on master
    * `sudo apt upgrade kubeadm`
3. Verify kubeadm version / was upgraded
    * `kubeadm version`
    * v1.13.1
4. Determine upgrade plan on master using kubeadm
    * `sudo kubeadm upgrade plan`
5. Upgrade
    * `sudo kubeadm upgrade apply v1.13.1`    
6. Drain node before upgrading
    * `kubectl drain donbecker1c.mylabserver.com --ignore-daemonsets`
7. On the node to upgrade: 
    * `sudo apt upgrade kubelet`
8. Check kubelet status
    * `systemctl status kubelet`
9. Verify node version has upgraded and it is still cordoned ("Ready,SchedulingDisabled")
    * `kubectl get nodes`
10. Uncordon upgraded node to make available
    * `kubectl uncordon donbecker1c.mylabserver.com`
11. Verify node is now available ("Ready")
    * `kubectl get nodes`