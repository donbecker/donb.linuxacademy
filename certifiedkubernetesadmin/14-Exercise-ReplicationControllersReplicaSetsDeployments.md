1. Write a replication controller that will have 3 replicas of nginx (nginx-rc.yaml)
```
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-rc
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```
2. Deploy nginx-rc.yaml
    * `kubectl create -f nginx-rc.yaml`
3. Write a replication set that will have 3 replicas of nginx (nginx-rs.yaml)
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-rs
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```
4. Deploy nginx-rs.yaml
    * `kubectl create -f nginx-rs.yaml`
5. Write a deployment that will maintain 3 replicas of nginx (nginx-dp.yaml)
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dp
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
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
6. Deploy nginx-dp.yaml
    * `kubectl create -f nginx-dp.yaml`
