GIT
===

In this example we show you how you can easily access information in git. This example only works if you have a git project.
If you have connected your gerrit/github project to InfraBox then InfraBox will clone your repository. You can access your repo inside a job like you would to it on your local machine. So you can simply use git commands to i.e. find out which files have been changed by the last commit:

```
git diff-tree --no-commit-id --name-only -r HEAD
```

Make sure you copy the entire git repo into your image in your [Dockerfile](Dockerfile):

```
COPY . /my-git-repo
```

- [Dockerfile](Dockerfile): you must install git in your Dockerfile to be able to use it
- [entrypoint.sh](entrypoint.sh): use git commands

Per default InfraBox does not clone the full repository, but only the most recent commits. If you need the entire repository you may configure this in your job definition.
See the [Repository Configuration Documentation](https://github.com/SAP/InfraBox/blob/master/docs/job/repository.md) for a explanation about the options.
