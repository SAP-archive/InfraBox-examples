Environment Variables
=====================

You may also set environment variables for your jobs. They will be available es regular environment variables during the run of your container (like `docker run -e MY_VAR=MY_VALUE`). This can be very useful if you want to run a same job with different runtime options. So you may just use the same container but with different environment variables. You can set them like the build arguments in your job definition:

```json
{
    "version": 1,
    "jobs":[{
        "type": "docker",
        ...
        "environment": {
            "ENV_VAR_1": "some value",
            "SOME_OTHER_VAR": "some other value"
        }
    }]
```

If you want to set secrets like passwords or other data you don't want to store in your job definition (because it's cleartext in your repository) check out the [secrets examples](/secrets).

See also the [documentation](https://infrabox.ninja/docs/#build-arguments) for environment variables.
