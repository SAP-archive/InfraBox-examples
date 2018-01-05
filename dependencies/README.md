Dependencies
============

So far the examples always used a single job, but InfraBox can do a lot more with your jobs. You can define workflows of multiple jobs with dependencies. In this example we create a workflow with two jobs. The *parent* job and the *child* job. If you define dependencies then InfraBox will make sure the jobs are executed in the proper order defined by the dependencies. So in this case the *parent* will be executed first and the *child* second. A dependency can be defined by the *depends_on* option in the job definition like this:

```json
{
    "version": 1,
    "jobs": [{
        "type": "docker",
        "name": "parent",
        "resources": { "limits": { "cpu": 1, "memory": 1024 } },
        "build_only": false,
        "docker_file": "infrabox/parent/Dockerfile"
    }, {
        "type": "docker",
        "name": "child",
        "resources": { "limits": { "cpu": 1, "memory": 1024 } },
        "build_only": false,
        "docker_file": "infrabox/child/Dockerfile",
        "depends_on": ["parent"]
    }]
}
```

A job may have multiple parents. By default a job is only executed if all the parent jobs have been finished successfully. If one of the parent jobs failed the child job is skipped.

In some situations you may want to have more control and execute a job even if its parent has failed. I.e. you have a cleanup job which should run always at the end of your worklfow, or you have a notification job at the end which writes a Slack message or email about the success or failure of your workflow. To achieve this you can also specify the end state of your parent job:

```json
{
    "type": "docker",
    ...
    "depends_on": [{"job": "parent", "on": ["finished", "error"]}]
}
```

In this case the job is execute if the job *parent* ended with *finished* or *error*. Available states are:

- finished
- failure
- error
- \* (equals all previous states -> ["*"] -> ["finished", "error", "failure"])


See the [Docker Job Documentation](https://infrabox.ninja/docs/) for a detailed explanation about the options of a docker job.
