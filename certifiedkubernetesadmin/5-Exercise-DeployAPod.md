* Sample yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: alpine
  namespace: default
spec:
  containers:
  - name: alpine
    image: alpine
    command:
      - sleep
      - "3600"
    imagePullPolicy: IfNotPresent
  restartPolicy: Always
```
1. Looking at the yaml, describe what the pod will do 
    * namespace will be default
    * one container, using the alpine image
    * runs the sleep command for 3600 seconds
    * will only pull the image if it is not already present on the node
    * will restart the pod if it fails
2. Run the pod
    * `kubectl create -f alpine-pod.yaml`
3. Delete the pod 
    * `kubectl delete pod <name>`
4. Write yaml for a pod that runs the nginx image
    * nginx-pod.yaml
```

```
5. Run the nginx-pod.yaml file
6. Delete the nginx pod