1. Create configmap via command line
    * `kubectl create configmap my-map --from-literal=school=LinuxAcademy`
2. List the configmap we created
    * `kubectl get cm`
3. Describe the configmap we created
    * `kubectl describe cm my-map`
4. Create pod-config.yaml file
```
apiVersion: v1
kind: Pod
metadata:
  name: config-test-pod
spec:
  containers:
    - name: test-container
      image: busybox
      command: [ "/bin/sh", "-c", "env" ]
      env:
        - name: WHAT_SCHOOL
          valueFrom: 
            configMapKeyRef:
              name: my-map
              key: school
  restartPolicy: Never
```
5. Run the pod
    * `kubectl create -f pod-config.yaml`
6. Show pod is completed
    * `kubectl get pods --show-all`
7. Show logs from pod
    * `kubectl logs config-test-pod`