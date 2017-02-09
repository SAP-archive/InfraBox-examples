# Documentation

## Prerequisites

- GIT
- Install docker
    - Windows
    - Linux
- Install CLI
    - how to create auth token

## *infraboxcli*
*infraboxcli* is a command line  tool to execute infrabox jobs locally. It can also be used to
quickly upload a project to infrabox without committin to any repository. So you can use
it to offload work to the *infrabox* servers or integrate in your build environment
if you are not using git.



### Install
Requires Python 2.7.

```bash
$ pip install https://s3.eu-central-1.amazonaws.com/infrabox-cli/infraboxcli.tar.gz
```

### Run jobs
To run jobs locally cd into a directory which contains a *infrabox.json* file.
Now simply run

```bash
$ infraboxcli run
```

This will now run all the jobs defined in *infrabox.json*. If you want to run only a single job use:

```bash
$ infraboxcli run --job-name <job-name>
```

### Upload jobs
If you want to quickly offload work from your local machine to the *infrabox* infrastructure you can
use:

```bash
$ export TESTBOX_CLI_PROJECT_ID=<project-id>
$ export TESTBOX_CLI_TOKEN=<auth-token>
$ infraboxcli push
```

This will compress your code, upload everything to *infrabox* and execute the jobs defined in *infrabox.json*.
For this you don't have to create a git repository on github. Simply create in the *infrabox Dashboard*
and use its ID as *TESTBOX_CLI_PROJECT_ID*.

*TESTBOX_CLI_TOKEN* must be set to one of your auth tokens. You can create one in the *infrabox Dashboard*.


## Tutorial

1. New project with one job
    - How to create a new project
    - How to define jobs
2. Extend with second job
    - How to handle dependencies
    - Generate output
    - upload test results
3. Add a deploy jobs
    - Use jobs to create docker images
4. Have a final job which sends notifications
    - Run jobs even if parent failed
5. docker-compose tests
    - how to make use of the cache

## infrabox.json

The *infrabox.json* must be in the root folder of each project. It instructs *infrabox* which jobs should be executed and how their dependencies are.
An example with three jobs looks like this:
```json
{
    "version": 1,
    "jobs": [{
        "name": "test-server",
        "compose_file": "test/docker-compose.yml",
        "build_only": false,
        "machine_config": "vm_2c_2gb"
    }, {
        "name": "deploy-server",
        "docker_file": "deploy/Dockerfile",
        "build_only": true,
        "machine_config": "vm_2c_2gb",
        "depends_on": ["test-server"],
    }, {
        "name": "final",
        "docker_file": "final/Dockerfile",
        "machine_config": "vm_2c_2gb",
        "build_only": false,
        "depends_on": ["deploy-server"],
        "run_always": true
    }]
}
```

The jobs would be executed according to their dependencies:

    test-server -> deploy-server -> final

### *version*
Format version of *infrabox.json*. Only valid value is 1.

*jobs*: An array of job descriptions.

### *jobs*

#### *name*
A unique name for the job. It may only consist of lowercase letters (a-z), numbers (0-9), underscore (\_) and dash (-).

#### *docker_file*
Each job must either specify a path to a *Dockerfile* or to a *docker-compose.yml* (see also *compose_file*).
The path is relative to the root directory of the project.
It's not allowed to specify *docker_file* and *compose_file* for the same job.

#### *compose_file*
Each job must either specify a path to a *Dockerfile* or to a *docker-compose.yml* (see also *compose_file*).
The path is relative to the root directory of the project.
It's not allowed to specify *docker_file* and *compose_file* for the same job.

#### *build_only*
If *build_only* is set to *true* only *docker build* is executed but not *docker_run*.
Use this if you want to a docker image and just deploy it.

#### *depends_on*
Is an array of job names. The job will only be executed if the parent jobs successfully finished.
In case of an error in any of the parent jobs the job is skipped (see *run_always* if you want to run the job even if a parent job failed).

#### *run_always*
If run_always is set the true the job is executed even if one or multiple of the parent jobs failed.
But it will only be executed after all parents have been finished.
This can be used if you want to send a notification email or some other message even in case if failed builds.

#### *machine_config*
The machine configuration identifier for the jobs. Lookup valid values in the dashboard.

#### *keep*
Default is *false*. It's only applicable for jobs with *dockerfile*, but not with *composefile*.

If set to *true* the container will be kept in the internal docker registry and can be downloaded by *infraboxcli* and executed locally.


## Simple Jobs
If only one docker image is run (*docker_file* is set for the job) Testbox automatically mounts a volume to _/infrabox_.

It contains three folders:
- /infrabox/inputs
- /infrabox/output
- /infrabox/cache

The *cache* directory can be used to cache data between builds. Simply copy everythin in there and it will be reconstructed for the next build.
See *Step 2* from the Tutorial on how to use the cache for storing the *node_modules* directory from *npm* so we don't have to download all the packages every time.

The *output* directory can be used to store data which should be accessible by subsequent jobs. See *Step 2* from the Tutorial for an example.

The *inputs* directory may contain several directory. It contains one for each parent job. These are the jobs named in *depends_on* in *infrabox.json*

So if you have three jobs _A_, _B_ and _C_ and _C_ depends on _A_ and _B_ then */infrabox/inputs* will contain
- /infrabox/inputs/A
- /infrabox/inputs/B

The contents of _A_ and _B_ are the taken from the respective output directory of the jobs. Also see *Step 2* from the Tutorial.

## Docker-Compose Jobs
In contrast to the *Simple Jobs* a *docker-compose* job starts several containers. To be able to use the same *inputs*, *output* and *cache* directories
in the containers you have to explicitly add them to you *docker-compose.yml*. The _TESTBOX\_PATH_ environment variable is set. So you can use variable
substituion in the compose file.

```yml
services:
    server:
        build:
            context: ../../
            dockerfile: docker/server/Dockerfile
        volumes:
            - "${TESTBOX_PATH}:/infrabox"
```

See also the *compose* example.


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

## TODOs
- jobs.json
- Parallelization
- console output ##
