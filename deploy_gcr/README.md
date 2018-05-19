Deploy to GCR
=============

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
		    "type": "gcr",
		    "host": "us.gcr.io",
		    "repository": "my-project/my-repo",
		    "service_account": { "$secret": "GCR_SERVICE_ACCOUNT" }
		}]
	}]
}
```

To be able to push to a GCR you need a GCP Service account and assign it the `Storage Admin` role. Store the downloaded `.json` file as a [secret](/secrets) and use it in your job definition as `service_account`.

See also the [documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md#deployments) for using image registries.
