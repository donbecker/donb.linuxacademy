1. Create bit-of-nothing.yaml:
```
apiVersion: apps/v1beta2
kind: Deployment
metadata:
  name: bit-of-nothing
spec:
  selector: 
    matchLabels:
      app: pause
  replicas: 2
  template: 
    metadata:
      labels:
        app: pause
    spec:
      containers: 
      - name: bitty
        image: k8s.gcr.io/pause:2.0
```
2. Create deploy
    * `kubectl create -f bit-of-nothing.yaml`
3. Create busybox-pod.yaml: 
```
apiVersion: v1
kind: Pod
metadata:
  name: busybox
  namespace: default
spec:
  containers: 
  - name: busybox
    image: busybox:1.28
    command: 
      - sleep
      - "3600"
    imagePullPolicy: IfNotPresent
  restartPolicy: Always
```
4. Create deploy
    * `kubectl create -f busybox-pod.yaml`
5. Verify that busybox cannot resolve to bit-of-nothing (no service exposed)
    * `kubectl exec -it busybox --nslookup bit-of-nothing-service`
6. Expose service for bit-of-nothing
    * `kubectl expose deploy bit-of-nothing --type=ClusterIP --name=bit-of-nothing-service --port 80`
7. Verify that busybox can resolve bit-of-nothing-service
    * `kubectl exec -it busybox -- nslookup bit-of-nothing-service`
    