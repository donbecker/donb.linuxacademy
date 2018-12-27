1. Assuming OS has been wiped on node and it needs to rejoin the cluster
2. List existing tokens
    * `sudo kubeadm token list`
3. Generate a new token
    * `sudo kubeadm token generate`
4. Show join command to use on node
    * `sudo kubeadm token create <token> --ttl 3h --print-join-command`
5. Run join command on node 