Hello World
===========

This examples shows you a very simple hello world job. All we want to do is to run a docker container on InfraBox which prints "Hello World".

- [infrabox.json](infrabox.json): contains the job definition
- [Dockerfile](Dockerfile): Builds a simple container to print "Hello World"

The docker context of each *docker build* is the *root* of a project. This is the
same directory where the *infrabox.json* file is stored. So all *COPY*
commands in a *Dockerfile* should use the full path starting from the root
of the project.

See the [Docker Job Documentation](https://infrabox.ninja/docs/) for a detailed explanation about the options of a docker job.
