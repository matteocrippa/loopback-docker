FROM ubuntu:16.04
MAINTAINER Matteo Crippa @ghego20

ENV HOME /root
ENV WORK_DIR /root/loopback
ENV SCRIPT_PATH /root/loopback/bin/www

# Set WORKDIR
WORKDIR ${WORK_DIR}

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y monit
RUN apt-get clean -y
RUN apt-get update

VOLUME ${WORK_DIR}

RUN npm install -g strongloop
RUN npm install -g nodemon

COPY loopback.conf  /etc/init/
COPY monit-loopback.conf  /etc/monit/ 

CMD ${SCRIPT_PATH}
