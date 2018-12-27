1. Create counterpod.yaml:
```
apiVersion: v1
kind: Pod
metadata:
  name: counter
  labels:
    demo: logger
spec:
  containers:
  - name: count
    image: busybox
    args: [/bin/sh, -c, 'i=0; while true; do echo "$i: $(date)"; i=$((i+1)); sleep 3; done']
```
2. Deploy 
    * `kubectl create -f counterpod.yaml`
3. View/follow current logs
    * `kubectl logs counter -f`
4. View last 10 log lines
    * `kubectl logs counter --tail=10`
5. View scheduler logs
    * `kubectl logs kube-scheduler-donbecker3c.mylabserver.com -n kube-system`
6. View etcd logs
    * `kubectl logs etcd-donbecker3c.mylabserver.com -n kube-system`
7. View kube-api logs
    * `kubectl logs kube-apiserver-donbecker3c.mylabserver.com -n kube-system`
    