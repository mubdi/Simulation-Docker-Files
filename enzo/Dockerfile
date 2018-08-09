# Download Base Image: Ubuntu 18.04
FROM ubuntu:18.04

# Update Ubuntu Software repository
RUN apt-get update

# Getting required Ubuntu packages
RUN apt-get install -y build-essential gfortran csh libhdf5-serial-dev \
gfortran openmpi-bin libopenmpi-dev mercurial wget less nano

# Hack since new libc doesn't include xlocale.h
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

## Exposing Port for Jupyter
EXPOSE 8888

## Creating Enzo User
RUN adduser --disabled-password --gecos '' enzo

USER enzo
WORKDIR /home/enzo 

## Installing Miniconda 
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b
RUN rm /home/enzo/Miniconda3-latest-Linux-x86_64.sh
ENV PATH /home/enzo/miniconda3/bin:$PATH
RUN conda install jupyter matplotlib

USER root
ADD startjupyternotebook.sh /usr/bin/
RUN chmod a+x /usr/bin/startjupyternotebook.sh

USER enzo 
## Getting Enzo
RUN hg clone https://bitbucket.org/enzo/enzo-dev
## Updating for Week-of-Code Branch for fixes for gfortran
RUN cd enzo-dev && hg update week-of-code

## Adding Docker Makefile
USER root
ADD Make.mach.linux-docker /home/enzo/enzo-dev/src/enzo/
RUN chmod a+r /home/enzo/enzo-dev/src/enzo/Make.mach.linux-docker
RUN chown enzo:enzo /home/enzo/enzo-dev/src/enzo/Make.mach.linux-docker

USER enzo 

## Building Enzo
RUN cd /home/enzo/enzo-dev && ./configure
RUN cd /home/enzo/enzo-dev/src/enzo && make machine-linux-docker
RUN cd /home/enzo/enzo-dev/src/enzo && make

## Installing yt
RUN conda install -c conda-forge yt