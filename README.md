# InfraBox Examples
[![Build Status](https://infrabox.ninja/api/v1/projects/21dc2924-f6b6-400f-aac2-b57833ef9787/state.svg)](https://infrabox.ninja/dashboard/#/project/ib-examples)

## Prerequisites

To be able to run the examples locally you should install *infraboxcli*. See
[How to install infraboxcli](https://github.com/InfraBox/cli) for instructions.

## Run examples
To run jobs locally cd into a directory which contains a *infrabox.json* file.
Now simply run

```bash
$ infrabox run
```

This will now run all the jobs defined in *infrabox.json*. If you want to run only a single job use:

```bash
$ infrabox run <job-name>
```

For more details on how to run jobs see the *infraboxcli* [documentation](https://github.com/InfraBox/cli)

## Use InfraBox playground
Instead of running the examples on your local machine you may also use the InfraBox playground at https://infrabox.ninja.
You can use it for free with up to 1 CPU and 1024MB per job.

Quickstart Guides:

- [Connect your github repository](https://github.com/InfraBox/infrabox/blob/master/docs/guides/connect_github.md)
- [Upload a workflow (you don't need a git repository)](https://github.com/InfraBox/infrabox/blob/master/docs/guides/upload.md)

## Examples

1. [Hello World](/hello_world): Run you first hello world job on InfraBox
2. [A simple C++ project](/cpp_example): Compile and test a simple C++ program
3. [Upload your testresult](/upload_testresult): If you run tests in your job you can get the results visualized by InfraBox
4. [Create custom badges](/badges): An easy way of creating <img src="https://img.shields.io/badge/custom-badges-green.svg"> for your jobs
5. [Docker build arguments](/build_arguments): Set Docker build arguments for your jobs
6. [Caching](/caching): Cache data between runs to speed up your builds
7. [Timeouts](/timeout): Set timeouts for your jobs
8. [Environment Variables](/environment_vars): Set environment vars for your jobs
9. [Secrets](/secrets): How to handle passwords and other sensitive data
10. [Deploy](/deploy): Deploy your docker containers to a registry
11. [Job Dependencies](/dependencies): Run multiple jobs with dependencies
12. [Transfer data](/transfer_data): Transfer data between your jobs
13. [Docker Compose](/docker_compose): Use docker compose in your job to run multiple containers
13. [Workflows](/workflows): Split up your job graph into multiple workflows
14. [GIT Workflows](/git_workflows): Included external workflows into your build
15. [Kubernetes Support](/kubernetes): Use the built-in kubernetes support for your e2e testing
16. [Dynamic Workflows](/dynamic_workflows): Modify your job graph at runtime for full flexibility

## External Service Integrations
1. [Slack](/slack): Report your build status

See also [Job Definitions](https://infrabox.ninja/docs/) for documentation about using all the different job types.

## Best practice
Please have a look at the [Docker Best Practice Guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/).
It contains several useful tips on how to write good Dockerfiles.

In general it's a good idea to keep your containers small. So only install the
libraries and components to really need. If possible use _alpine_ images, because
they are much smaller then the _ubuntu_ images. This saves you time, because less
data has to be downloaded for every job.
