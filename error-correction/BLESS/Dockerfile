# Using the Debian image
FROM debian:8.1

MAINTAINER Christoph Hahn <chrisi.hahni@gmail.com>

# Make sure apt is up to date
RUN apt-get -y update --fix-missing && \
apt-get install -y wget build-essential mpich libmpich-dev

RUN mkdir /home/working && mkdir /src

#fetching bless
RUN mkdir /src/bless
WORKDIR /src/bless
RUN wget -P /src/bless/ http://sourceforge.net/projects/bless-ec/files/bless.v1p02.tgz && \
	tar xvfz bless.v1p02.tgz && \
	cd v1p02 && \
	make && \
	ln -s $(pwd)/bless /bin/ && \
	ln -s $(pwd)/kmc/bin/kmc /bin/

ADD bless_iterate_over_ks.sh /bin/ 
#WORKDIR /src/bless/v1p02
###RUN cp -rf /src/bless/v1p02/* /bin/
###WORKDIR /bin
#RUN make
#RUN ln -s $(pwd)/bless /bin/
#RUN ln -s $(pwd)/kmc/bin/kmc /bin/

#RUN echo "export PATH=${PATH}:/src/bless/v1p02" >> ~/.bashrc && \
#echo "alias bless='/src/bless/v1p02/bless'" >> ~/.bash_aliases && \
#echo "source ~/.bash_aliases" >> ~/.bashrc

#ADD docker_helper.sh /src/bless/v1p02/

#WORKDIR /home/working
#VOLUME /home/working
#RUN chmod -R a+rw /home/working
#ENV PATH="/src/bless/v1p02:${PATH}"

#ENTRYPOINT ["/src/bless/v1p02/docker_helper.sh"]
