1. List nodes
    * `kubectl get nodes`
2. Label nodes with a color tag
    * Master should be black
        * `kubectl label node <nodename> color=black`
    * Node 2 should be red
        * `kubectl label node <nodename> color=red`
    * Node 3 should be green
        * `kubectl label node <nodename> color=green`
3. Label running nginx pods
    * `kubectl label pods -l app=nginx running=before`
4. Create Alpine deployment
    * `alpine-deploy.yaml`
```
apiVersion: apps/v1
kind: Deployment
metadata: 
  name: alpine-deployment
  labels:
    app: alpine
spec:
  replicas: 1
  selector: 
    matchLabels:
      app: alpine
template: 
  metadata:
    labels:
      app: alpine
      running: after
spec:
  containers: 
  - name: alpine
    image: alpine
    command: ["sh", "-c", "sleep 60"]
  restartPolicy: Always
```
5. Deploy
    * `kubectl create -f alpine-deployment.yaml`
6. List all running pods that have label running=before
    * `kubectl get pods -l running=before`
7. Label all pods in the default namespace with the label tier=linuxAcademyCloud
    * `kubectl label pods -n=default tier=linuxAcademyCloud --all`
8. List all pods in the default namespace with the label tier=linuxAcademyCloud
    * `kubectl get pods -n=default -l tier=linuxAcademyCloud`


