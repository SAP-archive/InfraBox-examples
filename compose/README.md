It's also possible to run multipe docker containers within one job. For this we
can specify a path to a *docker-compose.yml* file which describes on how the
different container should be build and run. See https://docs.docker.com/compose/
on how to write a propper *docker-compose.yml*.

As soon as one of the jobs exits all other jobs will be stopped. If the exit
code of the first job is not 0 the job is marked as *failed*.

See the [docker-compose Job Type](https://infrabox.freshdesk.com/support/solutions/articles/23000003365-job-type-docker-compose) for more details.
