1. Create nginx-deploy.yaml file
```
apiVersion: apps/v1beta2
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```
2. Deploy 
    * `kubectl create -f nginx-deploy.yaml`
3. Which nodes are the pods running on?
    * `kubectl get pods -l app=nginx -o wide`
4. Update deployment to nginx:1.8 and deploy
    * `kubectl apply -f nginx-deploy.yaml`
5. Verify image version and list nodes pods are on 
    * `kubectl describe deploy nginx-deployment`
    * `kubectl get pods -l app=nginx -o wide`
6. Update deployment to nginx:1.9.1 and deploy
    * `kubectl apply -f nginx-deploy.yaml`
7. Verify image version and list nodes pods are on
    * `kubectl describe deploy nginx-deployment`
    * `kubectl get pods -l app=nginx -o wide`
8. List rollout history 
    * `kubectl rollout history deploy nginx-deployment`
9. Verify 1.9.1 and 1.8 rollout numbers
    * `kubectl rollout history deploy nginx-deployment --revision=3`
    * `kubectl rollout history deploy nginx-deployment --revision=2`
10. Rollout undo to version 1.8
    * `kubectl rollout undo deploy nginx-deployment --to-revision=2`
11. Describe to verify rollback to 1.8
    * `kubectl describe deploy nginx-deployment`
12. Delete the deployment
    * `kubectl delete deploy nginx-deployment`