New project with one job
========================

This example shows a very basic project structure with only one job.
The job is supposed to compile our simple C++ program and run the tests.
Our program only contains some simple gtest examples. This could also be any
other program written in other languages. This serves just as a simple demonstration.

- [infrabox/build-and-test](/simple_project/infrabox/build-and-test): Dockerfile and scripts to build and run the tests
- [src](/simple_project/src): contains the c program
- [infrabox.json](/simple_project/infrabox.json): contains the job definition

The docker context of each *docker build* is the *root* of a project. This is the
same directory where the *infrabox.json* file is stored. So all *COPY*
commands in a *Dockerfile* should use the full path starting from the root
of the project.

See the [Docker Job Documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md) for a detailed explanation about the options of a docker job.
