# Custom Jenkins Dockerized

This is a custom Jenkins image I'm using for my build pipeline at home. Right now it has the following features:

- Built from official Docker image
- NodeJS 10.x with NPM pre-installed

## Run the container

Most probably you want to run the container in detached mode so that you can close the terminal while keep it running in background.

To run a container in detached mode, use the `-d` flag.

    $ docker-compose up -d

This will create a container named `custom-jenkins-dockerized_jenkins_1`. The number at the end depends on how many containers you had started in parallel.

It will also create a volume named `jenkins_home`. If there's already a volume with this name, the existing one will not be over-written but used as it is.

The container will now:

- run in background
- restart automatically if it has crashed or the system was restarted

## First startup

At first startup Jenkins needs to be configured. You can do this via the web interface, that is accessible at `localhost:8080`.

To make sure that the configuration is done by an autorized user, Jenkins will ask for an initial admin password. This password is stored inside the docker volume.

The easiest way to get is is to open a shell inside the container and read the file as you would do on any other computer.

    $ docker exec -it custom-jenkins-dockerized_jenkins_1 /bin/bash

You are now inside the container and can use the bash as usual.

    $ cat /var/jenkins_home/secrets/initialAdminPassword

Copy the output and paste it into the input field on the web interface.

## Stop the container

To stop the container run

    $ docker-compose down

## Re-build the container

If you want to re-build the image before starting it, use the flag `--force-recreate`

    $ docker-compose up --force-recreate -d

This will not affect your data stored in the volume `docker_home`.

## Upgrade or install software inside the container

Inside the container you won't be able to use `sudo`, so you have to enter the container with root privileges:

    $ docker exec -it -u root custom-jenkins-dockerized_jenkins_1 /bin/bash

Now you can run

    $ apt update
    $ apt upgrade
    $ apt install <package>
