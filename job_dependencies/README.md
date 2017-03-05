Step 2 - Extend with second job
===============================

We use the project structure from [simple_project](/simple_project) and split up our job into two parts
namely *build* and *test*. Our first job will compile our test program
and copy it to */infrabox/output*. Everthing which is stored in there can be access
by other jobs.

The test job can access the compiled program by defining a dependency in the
*infrabox.json* file. Testbox will then make the output of the *parent* job
availble in */infrabox/inputs/<parent_job_name>*. In our case the *test* job will
find the compiled program in */infrabox/inputs/build/*.

See [Handling Job Input/Output](https://infrabox.freshdesk.com/support/solutions/articles/23000003380-access-input-output-cache-files) for more details.
