1. Write yaml to deploy a DaemonSet using an nginx image
```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: my-ds
spec:
  selector:
    matchLabels:
      daemon: "pod"
  template:
    metadata:
      labels:
        daemon: pod
    spec:
      tolerations:
      - key: node-role.kubernetes.io/master
        effect: NoSchedule
      containers:
      - name: nginx
        image: nginx
```

2. Verify it gets deployed on every node
* `kubectl get ds`

3. Delete DaemonSet
* `kubectl delete ds my-ds`