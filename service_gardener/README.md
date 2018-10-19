Gardener Cluster support
========================

If you build an application which is supposed to run on kubernetes then at some point in time  you would also do some testing directly on a kubernetes clusters. InfraBox offers a Service which can provision a Gardener Cluster for your job. This can be extremely useful if you wan to run end-to-end tests and require an empty cluster for it. This provisioned cluster is not shared with any other job. So you can create non-namespaced objects without risking any collision with other jobs in the cluster.

```json
{
    "version": 1,
    "jobs": [{
        "type": "docker",
        "name": "hello-kubernetes",
        "build_only": false,
        "docker_file": "infrabox/hello-kubernetes/Dockerfile",
        "resources": {
            "limits": { "cpu": 1, "memory": 1024 }
        },
        "services": [{
            "apiVersion": "gardener.service.infrabox.net/v1alpha1",
            "kind": "ShootCluster",
            "metadata": {
                "name": "my-cluster"
            },
            "spec": {
                "diskSize": 100,
                "machineType": "m4.xlarge",
                "enableAutoscaling": false,
                "maxNodes": 1,
                "minNodes": 1,
                "zone": "eu-central-1a",
                "clusterVersion": "1.10"
            }
        }]
    }]
}
```

The [Gardener Service](https://github.com/SAP/InfraBox/tree/master/src/services/gardener) has to be installed.
