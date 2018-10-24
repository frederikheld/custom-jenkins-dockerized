FROM jenkins/jenkins:lts

USER root

# upgrade system
RUN apt-get update && apt-get upgrade -y

# install necessary tools
RUN apt-get update && apt-get install curl

# install latest nodejs with npn
RUN wget -qO- https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs

# check installed versions
RUN nodejs -v
RUN npm -v

USER jenkins