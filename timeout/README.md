Timeout
=======

Often it's useful to set a timeout on jobs so they will be automatically aborted by InfraBox in case of deadlocks or other hanging situations. You can set a timeout in your job definition like this:

```json
{
    "version": 1,
    "jobs": [{
        "type": "docker",
        "name": "test",
        "resources": { "limits": { "cpu": 1, "memory": 1024 } },
        "build_only": false,
        "docker_file": "infrabox/test/Dockerfile",
        "timeout": 10
    }]
}
```

We set the timeout to 10 seconds, but our container sleeps for 20 seconds so you should see that the container will be aborted by InfraBox. This is currently not supported by infraboxcli so you will only see the it on a real InfraBox instance.

The default timeout is 3600 seconds (1 hour).

See also the [documentation](http://192.168.1.31:30080/docs/#workflow-config).
