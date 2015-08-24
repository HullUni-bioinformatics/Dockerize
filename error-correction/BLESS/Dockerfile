# Using the Ubuntu image
FROM debian:8.1

MAINTAINER Christoph Hahn <chrisi.hahni@gmail.com>

# Make sure apt is up to date
RUN apt-get -y update --fix-missing
RUN apt-get install -y wget
RUN apt-get install -y build-essential
RUN apt-get install -y mpich libmpich-dev

RUN mkdir /home/working
RUN mkdir /src

#fetching bless
RUN mkdir /src/bless
RUN wget -P /src/bless/ http://sourceforge.net/projects/bless-ec/files/bless.v1p02.tgz
WORKDIR /src/bless
RUN tar xvfz bless.v1p02.tgz
WORKDIR /src/bless/v1p02
RUN make
RUN ln -s /src/bless/v1p02/bless /usr/bin
#

WORKDIR /home/working
VOLUME /home/working
RUN chmod -R a+rw /home/working
