FROM jenkins/jenkins:lts

USER root

# upgrade system
RUN apt update && apt upgrade -y

# install necessary tools
RUN apt update && apt install curl
RUN apt update && apt install lftp

# install latest nodejs with npm
RUN wget -qO- https://deb.nodesource.com/setup_10.x | bash -
RUN apt install nodejs

# check installed versions
RUN nodejs -v
RUN npm -v

USER jenkins
