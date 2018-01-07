Slack integration
=================

As shown in the [git workflows](/git_workflows) example you can include a sub-workflow from an external git repository. We will use this feature to add slack notifications to our build. All you have to do is to include our slack workflow:

```json
{
    "version": 1,
    "jobs": [{
        "type": "docker",
        "name": "test",
        "resources": { "limits": { "cpu": 1, "memory": 1024 } },
        "build_only": false,
        "docker_file": "Dockerfile"
    }, {
        "type": "git",
        "name": "external",
        "clone_url": "https://github.com/InfraBox/slack.git",
        "commit": "master",
        "depends_on": [{"job": "test", "on": ["*"]}]
    }]
}
```

Also create a [secret](/secrets) with the name *SLACK_WEBHOOK_URL* and set the value to your slack webhook url. That's it you should now receive slack messages for each of your build.

Tip: It makes most sense to have the slack job running as the very last job. To achieve that it even runs if the parent jobs failed we use the **depends_on** with the __\*__ (any) condition on the parent states.
