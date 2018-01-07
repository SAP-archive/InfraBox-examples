Workflows
=========

If your project becomes bigger and you run many jobs for a build you may find a single *infrabox.json* file unhandy. For this InfraBox has another job type **workflow**, with which you can split up your build graph into several files and include them. All the files have to follow the same format as for your *infrabox.json* file. You can include them like this:

```json
{
    "version": 1,
    "jobs": [{
        "type": "workflow",
        "name": "flow",
        "infrabox_file": "flow/infrabox.json"
    }]
}
```

You may include multiple sub-workflows or even nest them.

See the [Docker Job Documentation](https://infrabox.ninja/docs/) for a detailed explanation about the options of a workflow.
