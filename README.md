# InfraBox Examples
This repo contains examples for [InfraBox](https://github.com/SAP/InfraBox), a continuous integration system.

## Requirements

To be able to run the examples locally you should install *infraboxcli*. See
[How to install infraboxcli](https://github.com/SAP/InfraBox-cli) for instructions.

## Run examples
To run jobs locally cd into a directory which contains a *infrabox.json* file.
Now simply run

```bash
infrabox run
```

This will now run all the jobs defined in *infrabox.json*. If you want to run only a single job use:

```bash
infrabox run <job-name>
```

For more details on how to run jobs see the *infraboxcli* [documentation](https://github.com/SAP/InfraBox-cli)

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
10. Push Images
    - [Push to Docker registry](/deploy): Deploy your docker images to a registry
    - [Push to GCR](/deploy): Deploy your docker images to a GCR
11. [Job Dependencies](/dependencies): Run multiple jobs with dependencies
12. [Transfer data](/transfer_data): Transfer data between your jobs
13. [Docker Compose](/docker_compose): Use docker compose in your job to run multiple containers
13. [Workflows](/workflows): Split up your job graph into multiple workflows
14. [GIT Workflows](/git_workflows): Included external workflows into your build
15. Services
    - [Kubernetes Namespace](/service_namespace): Provision a Kubernetes namespaces for your tests
    - [Kubernetes Cluster (GKE)](/service_gke): Provision a GKE Kubernetes Cluster for your tests
    - [Kubernetes Gardener](/service_gardener): Provision a Gardener Kubernetes Cluster for your tests
16. [Dynamic Workflows](/dynamic_workflows): Modify your job graph at runtime for full flexibility
17. [Build and use Image](/build_and_use_image): In the same build

## External Service Integrations
1. [Slack](/slack): Report your build status

See also [Job Definitions](https://github.com/SAP/InfraBox/blob/master/docs/doc.md) for documentation about using all the different job types.

## How to get support
If you need help please post your questions to [Stack Overflow](https://stackoverflow.com/questions/tagged/infrabox).
In case you found a bug please open a [Github Issue](https://github.com/SAP/InfraBox/issues).
Follow us on Twitter: [@Infra_Box](https://twitter.com/Infra_Box) or have look at our Slack channel [infrabox.slack.com](https://infrabox.slack.com/).

## Best practice
Please have a look at the [Docker Best Practice Guide](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/).
It contains several useful tips on how to write good Dockerfiles.

In general it's a good idea to keep your containers small. So only install the
libraries and components to really need. If possible use _alpine_ images, because
they are much smaller then the _ubuntu_ images. This saves you time, because less
data has to be downloaded for every job.

## License
Copyright (c) 2018 SAP SE or an SAP affiliate company. All rights reserved.
This file is licensed under the Apache Software License, v. 2 except as noted otherwise in the [LICENSE file](LICENSE).
