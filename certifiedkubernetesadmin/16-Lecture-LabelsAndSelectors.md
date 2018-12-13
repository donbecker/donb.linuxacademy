1. Deploy
    * `kubectl create -f nginx-deployment.yaml`
2. List all Deployments
    * `kubectl get deploy`
3. List pods
    * `kubectl get pods`
4. Label first pod
    * `kubectl label pod <pod1name> mykey=nginx1`
5. Label second pod 
    * `kubectl label pod <pod2name> mykey=nginx2`
6. List first pod via label
    * `kubectl get pod -l mykey=nginx1`
7. List second pod via label
    * `kubectl get pod -l mykey=nginx2`
8. Overwrite label on first pod
    * `kubectl label pod <pod1name> mykey=nginx1update --overwrite`
9. Overwrite label on second pod
    * `kubectl label pod <pod2name> mykey=nginx2update --overwrite`
10. Describe pod via label
    * `kubectl describe pod -l mykey=nginx1update`
11. Get both pods with same label
    * `kubectl get pods -l app=nginx`
12. Label both pods with same label
    * `kubectl label pod -l app=nginx env=test`
13. Get both pods with same new label
    * `kubectl get pod -l env=test`
