# Astrophysical Simulation Dockerfiles

Docker files for astrophysical fluid simulations for the University of Toronto Astro-Hydro-Code Seminar. 

## Building Instructions

To build a docker image from this repo, cd into your chosen directory, and run

```bash
docker build -t <<IMAGENAME>> . 
```

## Running Instructions

To run a docker image from this repo, run the following:

```bash 
docker run -it <<IMAGENAME>> bash
```
which will start `bash`

To run with a host directory mounted in the image: 
```bash 
docker run -it -v /path/to/host/directory:/path/to/image/directory <<IMAGENAME>> bash
```

To run with a port opened between the host and the image (for a jupyter notebook, for instance): 
```bash 
docker run -it -p <<hostport>>:<<imageport>> <<IMAGENAME>> bash
```
