#!/bin/bash

# Script to start a jupyter notebook from within a docker container
jupyter notebook --port=8888 --ip=* --no-browser
