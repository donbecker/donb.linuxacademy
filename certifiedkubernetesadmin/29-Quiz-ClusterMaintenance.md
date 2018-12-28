1. You need to install a brand new network card into a node in your cluster, called "slowpoke". How do you prepare Kubernetes for the shutdown and outage without affecting the rest of your cluster? One of these commands will keep new pods from being scheduled to the node during the outage. Once the node is back up and running, the other command will allow scheduling to resume. SELECT TWO.

Choose the 2 correct answers:
 kubectl fill slowpoke
 kubectl cordon slowpoke
* (correct) kubectl drain slowpoke
* (correct) kubectl uncordon slowpoke


2. Your colleague is responsible for a Kubernetes cluster and wants to be on the latest version but also wants to disallow any features that are not part of the v1 API. Can this be done? If so, how?

Choose the correct answer:
Yes, but it requires configuring each kubelet on each node with --runtime-config=api/all=false,api/v1=true
* (correct) Yes. He just needs to append --runtime-config=api/all=false,api/v1=true to the command that brings up his apiserver.
No. You can turn off all beta and/or legacy functionality but cannot specify a particular API version.
The features and the version are the same. If he wants to use the v1 API, he needs to install v1.


3. If you want to easily add nodes to your cluster, what mode should it be in?

Choose the correct answer:
* (correct) Node Self Registration Mode
Auto-Add Mode
Master Scan Mode
Node Toad Code Road Mode


4. Ordinarily, you should only use kubectl drain on one node at a time. What happens if you attempt to drain more nodes in parallel when the cluster contains stateful sets?

Choose the correct answer:
As long as the over-commit threshold has not been reached on the remaining nodes, the drain is allowed.
* (correct) Any drains that would cause the number of ready replicas to fall below the specified budget are blocked.
The second and subsequent drains are blocked until the drained node is uncordoned.
The drain is always allowed, which could put your application states in jeopardy, so use with caution!


5. You've used kubeadm to upgrade your cluster from Kubernetes 1.8 to 1.9. Several of the nodes failed because of an accidental shutdown during the upgrade. All nodes are running now, some in the v1.8 state, some in v1.9. What's your next step?

Choose the correct answer:
There isn't much to do to fix this except manually upgrade each of the failed nodes to v1.9 and rejoin them to the cluster.
Shut down the nodes that have successfully upgraded run kubectl upgrade again.
1.8 and 1.9 should work fine together, so it's safe to leave them as they are.
* (correct) Run kubeadm upgrade again. It is idempotent and will move all nodes to the desired state.

