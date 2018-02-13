Deploy
======

With InfraBox you can not only build and run containers, but you can also deploy them to an image registry of your choice. As usual this can be configured in your job definition like this:

```json
{
	"version": 1,
	"jobs": [{
		"type": "docker",
		"name": "test",
		"docker_file": "infrabox/test/Dockerfile",
		"build_only": true,
		"resources": { "limits": { "cpu": 1, "memory": 1024 } },
		"deployments": [{
		    "type": "docker-registry",
		    "host": "quay.io/infrabox",
		    "repository": "test",
		    "username": "my_username",
		    "password": { "$secret": "QUAY_PASSWORD" }
		}]
	}]
}
```

You may deploy the same image to several registries. Also note in this example we set "build_only" to true, because we actually don't want to run the container, but just build and deploy it to the registry.

The password needs to be stored as [secret](/secrets).

See also the [documentation](https://infrabox.ninja/docs/#using-image-registries) for using image registries.
