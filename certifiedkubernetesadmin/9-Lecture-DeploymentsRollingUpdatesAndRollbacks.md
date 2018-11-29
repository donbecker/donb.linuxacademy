1. Create nginx-deployment.yaml file
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
    * `kubectl create -f nginx-deployment.yaml`
3. List all Deployments
    * `kubectl get deploy`
4. Describe the nginx deployment
    * `kubectl describe deploy nginx-deployment`
5. Update image for deployment from command line
    * `kubectl set image deployment/nginx-deployment nginx=nginx:1.8`
6. Check status of deployment
    * `kubectl rollout status deployment/nginx-deployment`
7. Change the nginx-deployment.yaml file to use nginx:1.9.1
8. Apply change
    * `kubectl apply -f nginx-deployment.yaml`
9. Check deployment
    * `kubectl rollout status deployment/nginx-deployment`
10. Deliberately misspell nginx-deployment.yaml file to use nginx:1.91
11. Verify deployment rollout is hung
    * `kubectl rollout status deployment/nginx-deployment`
12. List deployment status
    * `kubectl get deploy nginx-deployment`
13. Check events in deployment
    * `kubectl describe deploy nginx-deployment`
14. Show deployment history
    * `kubectl rollout history deployment/nginx-deployment`
15. Show last deployment
    * `kubectl rollout history deployment/nginx-deployment --revision=4`
16. Check that prior to last deploy is what we want to roll back to 
    * `kubectl rollout histroy deployment/nginx-deployment --revision=3`
17. Undo last rollout, rolling back to prior
    * `kubectl rollout undo deployment/nginx-deployment --to-revision=3`
18. Verify rollback in description events
    * `kubectl describe deploy nginx-deployment`