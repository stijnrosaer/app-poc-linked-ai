# POC - Linked AI

This project contains several services that show the possible workings of AI algorithms with linked data. I intended
this not to be a final project, but to demonstrate the possible functionality of all created services. Offered
functinalities are

- Converting a csv file or SPARQL query to a structured data format, suitable to load
  into [Pandas](https://pandas.pydata.org/)
- Creating jobs, defining the algorithm that should be executed
- Automatically loading the job and job-data to start the algorithm

The code has been structured based on the [semantic.works](semantic.works) microservices stack.

## Services

| Serviece  | Description  | Link |
|---|---|---|
| data-import  | The dataconvert service handles the loading and converting of data in both csv as SPARQL format. Depending on the data-source, the data is converted to a uniform datastructures that is easily usable for AI algorithms. If the source is a csv file, the file is loaded and parsed. In the case of a SPARQL query, the query is executed on a triple store after which the data is converted to the same format. | [https://github.com/redpencilio/ai-data-importer-service](https://github.com/redpencilio/ai-data-importer-service) | 
| jobs | The jobs service offers the possibility to create jobs that have to be executed based on a specific naming of source, task and description | [https://github.com/redpencilio/ai-job-service](https://github.com/redpencilio/ai-job-service) | 
| label-trainer | A docker container for training an AI model using a neural network for labeling text. Executes a job, defined by the jobs service | [https://github.com/redpencilio/ai-label-trainer-service](https://github.com/redpencilio/ai-label-trainer-service) |
| label-predictor | A docker container for labeling text with an AI model trained with the label-trainer. | [https://github.com/redpencilio/ai-label-predictor-service](https://github.com/redpencilio/ai-label-predictor-service) |



## Extra Packages

### job_run_loop

The job-run-loop pakcage is used to fetch all jobs from a triple store with a specific task.

Available at: [https://github.com/stijnrosaer/job-run-loop](https://github.com/stijnrosaer/job-run-loop)

#### Environment variables

The following environemtn variables should be defined in the service that uses the run-job-loop package

- `TASK`: string task that should start this job

- `MU_SPARQL_ENDPOINT` is used to configure the SPARQL endpoint.

    - By default this is set to `http://database:8890/sparql`. In that case the triple store used in the backend should
      be linked to the microservice container as `database`.
      
### sparql_helper

The python sparql helper contains helper functions as defined in
the [mu-python-template](https://github.com/mu-semtech/mu-python-template). These functions allow for typed escaping for
sparql queries, querying, updating, ... . All necessary documentation is available in the project repository.

Available at: [https://github.com/mu-semtech/mu-python-sparql-helpers](https://github.com/mu-semtech/mu-python-sparql-helpers)

Note that this library is specify build to work with the [mu.semte.ch](https://mu.semte.ch) microservices stack, but
could be adapted in order to be more generic.