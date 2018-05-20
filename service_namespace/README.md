Kubernetes Namespace Service
============================

If you build an application which is supposed to run on kubernetes then at some point in time  you would also do some testing directly on a kubernetes clusters. With InfraBox this is extremely easy, because InfraBox itself runs on kubernetes and can therefore easily provide a separeted kubernetes namespace for your tests. To provision a kubernetes namespace for your job add it to your resource request of your job definition:

```json
{
    "version": 1,
    "jobs": [{
        "type": "docker",
        "name": "hello-kubernetes",
        "build_only": false,
        "docker_file": "Dockerfile",
        "resources": {
            "limits": { "cpu": 1, "memory": 1024 },
        },
        "services": [{
            "apiVersion": "namespace.service.infrabox.net/v1alpha1",
            "kind": "ClusterNamespace",
            "metadata": {
              "name": "my-namespace"
            }
        }]
    }]
}
```

The [Namespace Service](https://github.com/SAP/InfraBox/tree/master/src/services/namespace) has to be installed.
