#####################################
# Dockerfile
#
# Software:             MIRA
# Software Version:     4.9.6
# Description:          Basic MIRA image (development version 4.9.6)
# Websites:             https://sourceforge.net/p/mira-assembler/wiki/Home/; http://mira-assembler.sourceforge.net/docs/DefinitiveGuideToMIRA.html
# Base Image:           ubuntu:14.04
# Build Cmd:            docker build --rm --no-cache -t chrishah/mira:v4.9.6 .
# Pull Cmd:             docker pull chrishah/mira:v4.9.6
# Run Cmd:              docker run --rm -it -v $(pwd):/home chrishah/mira:v4.9.6 /bin/bash #to enter the container
# Run Cmd:              docker run --rm -it -v $(pwd):/home chrishah/mira:v4.9.6 mira #run as executable
#
#####################################

# Base image
FROM ubuntu:14.04

MAINTAINER Christoph Hahn <chrisi.hahni@gmail.com>

# Make sure apt is up to date
RUN apt-get -y update --fix-missing
RUN apt-get install -y build-essential

WORKDIR /home
ADD static/mira_4.9.6_linux-gnu_x86_64_static.tar.bz2 .
RUN mv mira_4.9.6_linux-gnu_x86_64_static/bin/mira* /bin/
RUN rm -rf mira_4.9.6_linux-gnu_x86_64_static*
RUN chmod -R a+rw /home

