* Create `pi-job.yaml` file on master
```
apiVersion: batch/v1
kind: Job
metadata:
  name: pi
spec:
  template:
    spec:
      containers:
      - name: pi
        image: perl
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy: Never
  backoffLimit: 4
```
* Run the job
    * `kubectl create -f pi-job.yaml`
* Show job pod
    * `kubectl get pods`
* Describe pod
    * `kubectl describe pod <name>`
* Show logs 
    * `kubectl logs <name>`
* Write yaml for new job
    * use busybox image
    * have it sleep for 10 seconds
* Create `busybox-sleep-job.yaml` file on master
```
apiVersion: batch/v1
kind: Job
metadata:
  name: busybox-sleep
spec:
  template:
    spec:
      containers:
      - name: busybox-sleep
        image: busybox
        command: ["sleep", "10"]
      restartPolicy: Never
  backoffLimit: 4
```
* Run the job
    * `kubectl create -f busybox-sleep-job.yaml`