Kubernetes support
==================

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
            "limits": { "cpu": 1, "memory": 1024 }
            "kubernetes": { "limits": { "cpu": 1, "memory": 1024 } }
        }
    }]
}
```

InfraBox will then create a kubernetes namespace and a corresponding service account for the job. It will also delete the namespace again after your job has finished.

To access the namespace use the credentials store at _/var/run/secrets/kubernetes.io/serviceaccount/_. They are the same as if you would run a POD with a service account on a regular kubernetes cluster.
See [entrypoint.sh](infrabox/hello-kubernetes/entrypoint.sh) for an example how to access the namespace with kubectl.

You may now use the credentials to deploy your application run some tests and report your results.
