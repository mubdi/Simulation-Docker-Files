# Download Base Image: Ubuntu 18.04
FROM ubuntu:18.04

# Update Ubuntu Software repository
RUN apt-get update

# Getting required Ubuntu packages
RUN apt-get install -y build-essential gfortran csh libhdf5-serial-dev \
gfortran openmpi-bin libopenmpi-dev mercurial wget

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

## Getting Enzo
RUN hg clone https://bitbucket.org/enzo/enzo-dev
