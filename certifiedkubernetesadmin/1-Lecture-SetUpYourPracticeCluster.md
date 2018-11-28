* Create 3 new servers
    * Distribution: Ubuntu 18.04 Bionic Beaver LTS
    * Zone: North America
    * Size: Small
    * Name
        1. Kube Master
        1. Kube Node 1
        1. Kube Node 2
* Connect to each server and run the following
    * Add Docker repo
        1. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
        1. `sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
    * Add K8s repo
        1. `curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`
        1. ```
            cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
            deb https://apt.kubernetes.io/ kubernetes-xenial main
            EOF
           ```
    * Install Docker, Kubeadm, Kubelet and Kubectl 
        1. `sudo apt-get update`
        1. `sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.12.2-00 kubeadm=1.12.2-00 kubectl=1.12.2-00`
        1. `sudo apt-mark hold docker-ce kubelet kubeadm kubectl`
    * Enable net.bridge.bridge-nf-call-iptables
        1. `echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf`
        1. ``
* On the Kube Master server only
    * Init the cluster and configure kubectl
        1. `sudo kubeadm init --pod-network-cidr=10.244.0.0/16`
        1. `mkdir -p $HOME/.kube`
        1. `sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`
        1. `sudo chown $(id -u):$(id -g) $HOME/.kube/config`
    * Install Flanne CNI
        1. `kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml`
    * Capture the `kubeadm join` command from the output of `kubeadm init` above
* On both Kube Nodes
    * Run the `kubeadm join` command prefixed with sudo
        1. `sudo kubeadm join IP:6443 --token mytoken --discovery-token-ca-cert-hash sha256:myhash`
        1. Should see `This node has joined the cluster`
* On master verify we can list nodes
    1. `kubectl get nodes`