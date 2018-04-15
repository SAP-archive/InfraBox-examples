Transfer Data
=============

In the previous example we have seen how to define dependencies between jobs. We can also use these dependencies and transfer data from one job to the other. Data can be transfered from a *producer* job to the *consumer* job. Yoy may have multiple *consumers* for the same *producer*. The *consumer* jobs are the ones with the *depends_on* in their job definitions. So if you have a job B which *depends_on* A then A is the *producer* and B the *consumer*.

To produce data every job can simply put some files into _/infrabox/output_. The content of this directory will be made available to all *consumer* jobs. The *consumers* may access the data in */infrabox/inputs/<producer_job_name>/*. I.e. job *A* creates file *hello.txt* in */infrabox/output* and job B *depends_on* *A* it can access the file as */infrabox/inputs/A/hello.txt*.

See the [Docker Job Documentation](https://github.com/SAP/InfraBox/blob/master/docs/doc.md) for a detailed explanation about the options of a docker job.
