# LibTIFF Docker
FROM sschmittner/ubuntu_updated:latest

LABEL  version="0.0.1"
LABEL  description="LibTIFF from source"

ENV  DEBIAN_FRONTEND noninteractive

MAINTAINER  Sebastian Schmittner (stp.schmittner@gmail.com)

RUN  apt-get install -y \
     libjpeg-dev \
     liblzma-dev \
     liblz-dev \
     zlib1g-dev \
     make \
     g++ \
     cvs
     
RUN mkdir -p /source/ && \
    cd /source/ && \
    export CVSROOT=:pserver:cvsanon@cvs.maptools.org:/cvs/maptools/cvsroot && \ 
    cvs login && \ 
    cvs checkout libtiff && \
    cvs checkout libtiff-lzw-compression-kit && \
    cd libtiff && \
    ./configure && \
    make 
  
VOLUME ["/source/libtiff"]


