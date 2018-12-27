1. List all nodes
    * `kubectl get nodes`
2. Label a node
    * `kubectl label node <nodename> net=gigabit`
3. Verify node is labeled
    * `kubectl get nodes -l net=gigabit`
4. Create a deployment with .template.spec.nodeSelector
```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: specificnode-deploy
spec:
  replicas: 1
  selector: 
    matchLabels:
      run: specificnode
  template:
    metadata:
      labels:
        run: specificnode
    spec:
      containers: 
      - image: nginx
        name: specificnode
        ports:
        - containerPort: 80
          protocol: TCP
      nodeSelector:
        net: gigabit
```
5. If the pod isn't working, check out error why
    * 'kubectl describe pod 