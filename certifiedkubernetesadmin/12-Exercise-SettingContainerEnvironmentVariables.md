1. Create yaml for job to run busybox image, print environment vars and shut down.
busybox-envprint.yaml
```
apiVersion: batch/v1
kind: Job
metadata:
  name: busybox-envprint
spec:
  template:
    spec:
      containers:
      - name: busybox-envprint
        image: busybox
        command: ["env"]
        env: 
          - name: STUDENT_NAME
            value: "Don Becker"
          - name: SCHOOL
            value: "Linux Academy"
          - name: KUBERNETES
            value: "is awesome"
      restartPolicy: Never
  backoffLimit: 4
```
2. Run the job
    * `kubectl create -f busybox-envprint.yaml`
3. Locate pod name
    * `kubectl get pods`
4. Verify the env variables were added
    * `kubectl logs <podname>`