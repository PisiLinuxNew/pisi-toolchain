# Linux From Scratch build scripts

An easy way to build an Linux From Scratch system, done through Docker.

This repository handles the tool-chain build.

## You do not have to clone/download this repository
Everything in this repository is also to be found in the Docker images itself,
so unless you need to build the image your-self there is no need to download
anything. You can head straight to the `Compile the tool-chain` section, in
this document.

Simply put, a Docker container, with all necessary tools, needed for compiling
the system, installed, will handle the build through a series of scripts.

## Build the Docker image, used as the container (optional).
To build the Docker image, that will used in the container, you can issue this
command. You can also skip this step an use the pre-build image provided by me
on the [Docker Hub](https://hub.docker.com/r/tlyngej/lfs-toolchain-builder/).
```
docker build -t tlyngej/lfs-toolchain-builder:8.3 .
```

## Compile the tool-chain.
To build the entire tool-chain, run the following commands:
```
mkdir /tmp/lfs
docker run --rm -v /tmp/lfs/lfs:/mnt/lfs tlyngej/lfs-toolchain-builder:8.3
```

## I'm done compiling the "stuff". What's next?
What you have just compiled is what you need to compile the actual LFS
base system. This is an even longer process of more compiling. But there is also
a Docker image that can handle that for you.

Head over to this [GitHub repository](https://github.com/TLyngeJ/lfs-base-system)
to read more about how to finish build the rest.
