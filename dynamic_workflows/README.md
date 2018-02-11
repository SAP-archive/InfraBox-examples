Dynamic Workflows
=================

So far all build definitions have been quite static. You define one or multiple infrabox.json files and use them in you project. This of course has some limitations. In some situations it is helpful to define the jobs dynamically. Let's say you don't want to run all your tests if you only changed the documentation of your project. Or you would like to have some special keywords in your commit message to trigger more/less tests. Or other scenarios where a statically defined workflow is just not sufficient.

For this InfraBox supports dynamic workflows. Every job in a build may create child jobs at runtime. All you have to to is to create a `infrabox.json` file with the jobs you would like to run as children of your current job and save it to `/infrabox/output/infrabox.json`. The jobs will automatically depend on your current job. So you don't have to explicitly add it to `depends_on`.

The Dockerfile of the parent to create a child a runtime (indented for readability):

```
FROM alpine

CMD echo '{
    "version":1,
    "jobs": [{
        "name": "dynamic-child",
        "type": "docker",
        "build_context": "../..",
        "build_only": false,
        "resources": {"limits": {"cpu": 1, "memory": 1024}},
        "docker_file": "infrabox/dynamic-child/Dockerfile"
    }]
}' > /infrabox/output/infrabox.json
```

Feel free to write more complicated logic to generate your workflows.
