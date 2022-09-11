# Image for building a LFS toolchain.
FROM pisi:2.2
MAINTAINER tlyngej@gmail.com

RUN pisi ur
RUN pisi it glibc-devel gconf-devel gcc make cmake
RUN mkdir -p /mnt/lfs
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
VOLUME ["/mnt/lfs"]
ADD run.sh /run.sh
COPY scripts /scripts
CMD "/run.sh"
