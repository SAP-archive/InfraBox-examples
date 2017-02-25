# InfraBox Examples

## Prerequisites

To be able to run the examples locally you should install *infraboxcli*. See
[How to install infraboxcli](https://infrabox.freshdesk.com/support/solutions/articles/23000003377-install-infraboxcli) for instructions.

## Run jobs
To run jobs locally cd into a directory which contains a *infrabox.json* file.
Now simply run

```bash
$ infrabox run
```

This will now run all the jobs defined in *infrabox.json*. If you want to run only a single job use:

```bash
$ infrabox run --job-name <job-name>
```

For more details on how to run jobs see the *infraboxcli* [documentation](https://infrabox.freshdesk.com/support/solutions/articles/23000003378-run-jobs-locally).

## Upload jobs
If you want to quickly offload work from your local machine to the *infrabox* infrastructure you can use

```bash
$ infrabox push
```

See [Upload a workflow to InfraBox](https://infrabox.freshdesk.com/support/solutions/articles/23000003372-upload-a-workflow-to-infrabox) on how to use it.


## Examples

1. [/simple_project](/simple_project) Shows the most basic project setup you can have. It only contains one simple docker job.
2. [/job_dependencies](/job_dependencies) Extends the first examples and introduces you to the job dependency system in InfraBox.
3. [/compose](/compose) Contains an example which show you how to run docker-compose jobs.

See also [Job Definitions](https://infrabox.freshdesk.com/support/solutions/folders/23000027055) for documentation about using all the different job types.

## Best practice
Please have a look at the [Docker Best Practice Guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/).
It contains several useful tips on how to write good Dockerfiles.

In general it's a good idea to keep your containers small. So only install the
libraries and components to really need. If possible use _alpine_ images, because
they are much smaller then the _ubuntu_ images. This saves you time, because less
data has to be downloaded for every job.

## Improvements
- use cache
- pre-build base images
