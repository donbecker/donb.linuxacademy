1. Create new Ubuntu 16 server
    * Ubuntu 16.04 Xenial LTS
    * Small (1 VCPU, 2GB Mem)
    * Tag: NFSUbuntu
2. Connect to NFSUbuntu, update password
3. Update and install NFS
    * `sudo apt update`
    * `sudo apt install nfs-kernel-server`
4. Create directory to share with pods
    * `sudo mkdir /var/nfs/general -p`
5. Verify owner/group on directory
    * `ls -al /var/nfs/general`
6. Change owner/group to nobody and verify
    * `sudo chown nobody:nogroup /var/nfs/general`
    * `ls -al /var/nfs/general`
7. Update the NFS exports file to include the other servers' private IPs
    * `sudo nano /etc/exports`
    * `/var/nfs/general 172.31.34.21(rw,sync,no_subtree_check) 172.31.100.34(rw,sync,no_subtree_check) 172.31.42.78(rw,sync,no_subtree_check)`
8. Restart NFS service to load changes
    * `sudo systemctl restart nfs-kernel-server
9. Install NFS Common on all nodes
    * `sudo apt install nfs-common`
10. On master, create pv.yaml
```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: lapv
spec: 
  capacity:
    storage: 1Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Recycle
  nfs:
    path: /var/nfs/general
    server: 
    readOnly: false
```
11. Update pv.yaml `server` with private IP of NFS server
    * `server: 172.31.34.219`
12. Create PV via file
    * `kubectl create -f pv.yaml`
13. Create pvc.yaml
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-pvc
spec:
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
```
14. Create PVC via file
    * `kubectl create -f pvc.yaml`
15. Create nfs-pod.yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: nfs-pod
  labels:
    name: nfs-pod
spec:
  containers:
  - name: nfs-ctn
    image: busybox
    command: 
      - sleep
      - "3600"
    volumeMounts: 
    - name: nfsvol
      mountPath: /tmp
  restartPolicy: Always
  securityContext:
    fsGroup: 65534
    runAsUser: 65534
  volumes: 
    - name: nfsvol
      persistentVolumeClaim:
        claimName: nfs-pvc
```
16. Create pod via file
    * `kubectl create -f nfs-pod.yaml`
17. Shell into pod to confirm mount, create file
    * `kubectl exec -it nfs-pod -- sh`
    * `ls -al /tmp`
    * `touch hellofrompod`
18. Confirm file appears on NFS server
    * `ls -al /var/nfs/general`
