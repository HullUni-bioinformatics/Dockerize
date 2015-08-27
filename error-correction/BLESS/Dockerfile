# Using the Debian image
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
ENV PATH $PATH:/src/bless/v1p02
RUN echo 'alias bless="/src/bless/v1p02/bless"' > ~/.bashrc
RUN . ~/.bashrc
ADD docker_helper.sh /src/bless/v1p02/
#

WORKDIR /home/working
VOLUME /home/working
RUN chmod -R a+rw /home/working

ENTRYPOINT ["/src/bless/v1p02/docker_helper.sh"]
#ENTRYPOINT ["/src/bless/v1p02/bless"]
CMD [""]
