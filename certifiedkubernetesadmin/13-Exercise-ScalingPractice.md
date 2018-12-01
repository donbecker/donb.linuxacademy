1. Create nginx-scale.yaml file
```
apiVersion: apps/v1beta2
kind: Deployment
metadata:
  name: nginx-scale
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
        image: nginx
        ports:
        - containerPort: 80
```
2. Create the deployment
    * `kubectl create -f nginx-scale.yaml`
3. Scale the deployment to 4 pods without editing the yaml
    * `kubectl scale --replicas=4 -f nginx-scale.yaml`
4. Edit the yaml to 3 replicas and deploy
    * `replicas: 3`
    * `kubectl apply -f nginx-scale`