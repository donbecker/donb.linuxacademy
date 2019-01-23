What is the lifecycle of PVs and PVCs?

Choose the correct answer:
Provision, Use, Reclaim
It depends on whether or not the resource is dynamically provisioned.
* Provision, Bind, Use, Reclaim
Bind, Provision, Use, Reclaim


What are the access modes that can be requested for a volume?

Choose the correct answer:
ReadOnly, ReadWrite, ReadWriteMany
Single, Multi, ROX
Read, Write, ConcurrentWrite
* ReadWriteOnce, ReadOnlyMany, ReadWriteMany


A PersistentVolume is a cluster storage resource, but what is a PersistentVolumeClaim?

Choose the correct answer:
* A user request for a storage resource
A non-durable cluster storage resource
A dynamically allocated cluster storage resource
A user request for a non-durable storage resource


PersistentVolumes (PVs) are cluster storage resources. How do they access different kinds of physical storage from different vendors?

Choose the correct answer:
Kubernetes only supports ephemeral storage
Local node storage available as host filesystems
* Plug-ins
NAS supporting the KNS protocol


What is ephemeral storage?

Choose the correct answer:
Scratch space in a Ceph cluster or other object store
Storage that can be requested through PVCs
* Local storage on the node used for containers. Its contents are removed when the pod is deleted.
Magnetic spinning disk storage on a local host — it may not be SSD


Which of the following is true about a volume?

Choose the correct answer:
Volumes must reside on a cluster host.
The storage class argument is used to specify a PersistentVolumeClaim's requested access mode.
Volumes must be statically allocated by the administrator before a user can request one.
* Regardless of which access modes a volume supports, it can only support one at a time.