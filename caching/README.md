Caching
=======

Often jobs can be speed up by caching certain data between builds. This could be your node_modules directory, ccache or other data. Caching in InfraBox is very simple. Just put all the data you want to be cached into _/infrabox/cache_. The next run of the same job will have the same cache. You may also delete the cache from the InfraBox Dashboard.

If you run the example for the first time it should print:

```
Cache does not exist, creating it
```

The second run should print:

```
Cache exists
```

See also the [documentation](https://infrabox.ninja/docs/#build-arguments) for how to use the cache.
