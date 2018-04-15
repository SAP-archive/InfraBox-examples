Secrets
=======

Often you need to use some secret values like passwords for deploying your project, connecting to a database or other things. It's always a bad idea to store sensitive data in your repository. To avoid this InfraBox offers the secrets functionality. You may log into the Dashboard, select your project and create a secret with a name and the actual secret value. You may later reference this secret in your job defintion i.e. as environment variable:

```json
{
    "version": 1,
    "jobs":[{
        "type": "docker",
        ...
        "environment": {
            "MY_SECRET_DB_PASSWORD": { "$secret": "SECRET_NAME" },
        }
    }]
}
```

You may use secrets in:

- [Environment variables](/environment_variables)
- [Deployments](/deployments)

If you want to run a job with secret locally have a look at the [infraboxcli documentation](https://github.com/SAP/InfraBox-cli#secrets) about working with secrets locally.

See also the [documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md).
