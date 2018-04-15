Docker Compose
==============

With InfraBox you cannot only run a single container as a job, but also use docker-compose to run multiple containers in a single job. For this use the **"type": "docker-compose"** in your job definition:

```json
{
    "version": 1,
    "jobs": [{
        "type": "docker-compose",
        "name": "test",
        "resources": { "limits": { "cpu": 1, "memory": 1024 } },
        "docker_compose_file": "infrabox/test/docker-compose.yml"
    }]
}
```

The job will be finished as soon as one of the containers stops. The return code of this container determines if the job failed (rc != 0) or succeeded (rc == 0).

[Caching](/caching), [Transfering Data](/transfer_data), [Uploading Testresults](/upload_testresults) are working the same as in the regular *docker* job. But be careful the same directory is mounted into all containers. So writing to the same file from different containers is undefined behaviour.

See the [Docker Job Documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md#job-docker-compose) for a detailed explanation about the options of a docker-compose job.
