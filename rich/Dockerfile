# Parent image
FROM python:2.7-slim

# Install dependencies
RUN apt-get update && apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y wget
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y lbzip2
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y zip
RUN apt-get install -y 
RUN pip install numpy
RUN pip install h5py
RUN pip install matplotlib
RUN pip install jupyter

## Creating rich User
RUN adduser --disabled-password --gecos '' rich
USER rich
WORKDIR /home/rich

# Clone repository
RUN git clone https://github.com/bolverk/huji-rich.git

# Install rich
RUN echo `pwd`
RUN echo `ls`
RUN cd huji-rich/ && make set_environ_vars.sh && `cat set_environ_vars.sh` && make && cd tests/ && make

# Diagnostics
EXPOSE 8888