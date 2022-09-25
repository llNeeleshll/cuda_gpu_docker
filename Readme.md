# <u>NVIDIA Rapids environment</u>

This is the docker container for the NVIDIA Rapids environment. 

### **Why we need this?**
We need rapids to make use of GPUs even for the simpler yet complicated operations which previously utilizes CPU cores. For example, manipulating a huge CSV file using `pandas`.

We often use `pandas` to do operations on data set such as manipulation a column, do feature engineering and much more. `Pandas` in its core, utilizes cpus. The operation therefore takes a lot of time to complete as it do not use parallel processing. 

CUDF on the other hand, transform this picture. It enable us to do all the operation which we used to perform on CPU using `pandas`, on the GPUs.

### **How we can use this?**
Rapids, unlike `pandas`, requires a little complex initial setup. Therefore to make things easy to use, I've created this repository. This repository has all the components essential to setup a fully functional, ready to use rapids environment along with `pytorch`.

## Sharing the Datasets from local to container
In the repository which you have cloned, there is a *data* folder. This folder should be mapped to an external folder in your local machine which contains the datasets you are intending to use inside the container.

If you open the *docker-compose.yml* file, you'll see `/mnt/d/Dataset:/usr/app/Data` in line 13. The first part `/mnt/d/Dataset` is the address of your local dataset folder, replace it with your address.

## Sharing the Code from container to local
Another most important part to this is to save your code which you do inside the container. Once the container is down, the code will be deleted automatically. 

To solve this problem, the location of the *jupyter-notebooks* is mapped with the *code_block* folder in the repository. So, whatever notebooks or files you'll create, will automatically be mapped from the container to this folder on your local machine. Later you can copy the files from this location to elsewhere.

## Starting the container
In order to start the container, follow the following steps.
- Clone the repository using the following command: <br/>
`git clone <repository path>`
- Make sure you have docker compose and docker environment setup. If not, then follow this [following link](https://link-url-here.org). Once everything is setup run the following command:<br/>
`docker-compose up --build`
- Once the build is complete, you can use `docker-compose up` to start the container everytime.

**<i>Feel free to make changes in the project as per your requirement and submit it. We'll merge your changes to the main repository.</i>** 

<!-- docker run -p 8888:8888 -v /mnt/d/Dataset:/usr/app/Data --gpus all cudf_docker -->