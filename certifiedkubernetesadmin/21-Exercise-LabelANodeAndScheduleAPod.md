1. Label node
    * `kubectl label node <nodename> nodetype=favorite`
2. Create favoritepod.yaml
```
apiVersion: v1
kind: Pod
metadata: 
  name: busybox
  namespace: default
spec:
  containers:
  - name: busybox
    image: busybox
    command: 
      - sleep
      - "300"
    imagePullPolicy: IfNotPresent
  restartPolicy: Always
  nodeSelector: 
    nodetype: favorite
```
3. Deploy
    * `kubectl create -f favoritepod.yaml`

