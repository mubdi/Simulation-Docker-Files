# Download Base Image: Ubuntu 18.04
FROM ubuntu:18.04

# Update Ubuntu Software repository
RUN apt-get update

# Getting required packages
RUN apt-get install -y build-essential gfortran csh gfortran git libcairo2-dev \
	vim nano

# Create a user, log in as that user and change to home directory
RUN adduser --disabled-password --gecos '' phantom
USER phantom
WORKDIR /home/phantom

# Get Phantom and splash repositories
RUN git clone https://bitbucket.org/danielprice/phantom
RUN git clone https://github.com/danieljprice/splash.git
RUN cd splash; git clone https://github.com/danieljprice/giza.git

# OpenMP stacks can get big
ENV OMP_STACKSIZE=4G

# Environment variable telling Phantom and splash what compiler to use
ENV SYSTEM=gfortran

# Specify location of giza library
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/phantom/splash/giza/lib/

# Compile splash (and giza)
RUN cd splash; make withgiza
