# Getting Started With Pyspark
Materials for Getting Started With PySpark, a class taught on Safari Books Online platform.


## Setup

The notebooks in this repo are designed to be run in a docker container - this allows all the installations and setup to be pre-configured and to not interact with anything else on your machine. The only thing you need to install is docker itself. To do so, find your operating system in the left bar [here](https://docs.docker.com/install/) and follow the instructions for downloading docker. Once that is completed, running the command docker-compose --version on your command line should print out a version number.

## Running Notebooks

Once docker is set up and you have cloned the github repo, navigate into newly created folder (it should be called `getting_started_with_pyspark`). In the top level of this directory run the command `docker-compose build`. This command will build the provided container, and this step will take a few minutes. Once the build is finished you can start the container with `docker-compose up`, and at any time you can stop the container by typing CTRL-C.

Once the container is running, open a browser window and go to `http://localhost:8888`

You should get a password prompt - by default the password is `pyspark`, and that can be changed in the `jupyter_notebook_config.py` file. After entering the password you should see a jupyter notebook directory!

## Accessing the Spark UI

When you create a spark session in one of these notebooks, spark also has a user interface window that let's you see a bunch of information about the running jobs. To access it, go to `http://localhost:4040`. If you have multiple spark sessions running at once, the Spark UIs will be accessible on increasing ports - so the second one you start up will be available at `http://localhost:4041`.

## Data

This class uses taxi trip data from the Chicago City Data Portal. The sample of data needed for the class is provided in this repo - the full dataset can be downloaded from the data portal [here](https://data.cityofchicago.org/Transportation/Taxi-Trips/wrvz-psew). For more information about the collection of the data and privacy measures, see [release notes](https://digital.cityofchicago.org/index.php/chicago-taxi-data-released/).