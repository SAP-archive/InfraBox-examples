GIT Workflows
=============

The [workflow](/workflows) example has showed you how you can included sub-workflows into your build and by this form a bigger job graph. But this was limited to files in the same repository/project. With the **git** job type  you can included a sub-workflow from a remote git repository. This can be very useful if your project consists of several repositories or if you want to include an external workflow like shown in the [slack integraion](/slack) example.

To make use of it define a job like this:

```json
{
    "version": 1,
    "jobs": [{
        "type": "git",
        "name": "external",
        "clone_url": "https://github.com/InfraBox/cli.git",
        "commit": "master"
    }]
}
```

This example would now clone the [infraboxcli](https://github.com/infrabox/cli) repo and include it as workflow. For this to work the included repo must have an *infrabox.json* file in its root directory.

See the [Docker Job Documentation](https://infrabox.ninja/docs/) for a detailed explanation about the options of a git job.
