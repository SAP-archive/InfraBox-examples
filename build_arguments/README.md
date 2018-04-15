Build Arguments
===============

Some Dockerfiles require you to set build arguments. You may set them in your job definition like this:

```json
{
    "version": 1,
    "jobs":[{
        "type": "docker",
        ...
        "build_arguments": {
            "ARG1": "some value",
            "SOME_OTHER_ATH": "some other value"
        }
    }]
```

See also the [documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md#build-arguments) for build arguments.
