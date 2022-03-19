# Image for building a LFS toolchain.
FROM ubuntu:18.04
MAINTAINER tlyngej@gmail.com

RUN apt-get update
RUN apt-get install -y build-essential wget bison byacc gawk m4 texinfo
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /mnt/lfs
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
VOLUME ["/mnt/lfs"]
ADD run.sh /run.sh
COPY scripts /scripts
CMD "/run.sh"
