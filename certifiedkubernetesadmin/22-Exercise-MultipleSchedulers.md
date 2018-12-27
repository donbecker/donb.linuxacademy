1. Update yaml to use a scheduler called "custom-scheduler" 
```
apiVersion: v1
kind: Pod
metadata: 
  name: annotation-default-scheduler
  labels:
    name: multischeduler
spec:
  schedulerName: custom-scheduler
  containers:
  - name: pod-container
    image: k8s.gcr.io/pause:2.0
```