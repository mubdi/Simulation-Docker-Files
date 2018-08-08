# Download Base Image: Ubuntu 18.04
FROM ubuntu:18.04

# Update Ubuntu Software repository
RUN apt-get update

# Getting required packages
RUN apt-get install -y build-essential gfortran csh gfortran  git

# Create a user, log in as that user and change to home directory
RUN adduser --disabled-password --gecos '' phantom
USER phantom
WORKDIR /home/phantom

# Clone Phantom git repository
RUN git clone https://bitbucket.org/danielprice/phantom

# Change into Phantom directory
WORKDIR /home/phantom/phantom

# OpenMP stacks can get big
ENV OMP_STACKSIZE=4G

# Environment variable telling Phantom what compiler to use
ENV SYSTEM=gfortran
