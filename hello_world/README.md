Hello World
===========

This examples shows you a very simple hello world job. All we want to do is to run a docker container on InfraBox which prints "Hello World".

- [infrabox.json](infrabox.json): contains the job definition
- [Dockerfile](Dockerfile): Builds a simple container to print "Hello World"

As you can see in [infrabox.json](infrabox.json) you can set resource limits like max CPU and memory the job should use. InfraBox will set the limits on kubernetes/Docker so you can be sure to always have the resources you require for your task. On the other hand you can set the limits as low as you need them to make better use of your hardware by allowing to run more jobs in parallel on your hardware.

The docker context of each *docker build* is the *root* of a project. This is the same directory where the *infrabox.json* file is stored. So all *COPY* commands in a *Dockerfile* should use the full path starting from the root of the project.

See the [Docker Job Documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md#job-docker) for a detailed explanation about the options of a docker job.
