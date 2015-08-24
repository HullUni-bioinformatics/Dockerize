# bless-docker
Docker context for BLESS image

The Docker image is a self-contained Linux environment (Debian 8.1) set up to run the BLESS error correction tool.

For more information on BLESS see the [BLESS paper](http://bioinformatics.oxfordjournals.org/content/30/10/1354.long) or the [BLESS wiki](http://sourceforge.net/p/bless-ec/wiki/Home/).


To run the image you will need [Docker](https://www.docker.com/).

Installing Docker on Ubuntu should be as easy as:

```
sudo apt-get install docker.io
```

The BLESS image can then be used interactively, e.g. like so:
```
WORKING_DIR=$(pwd) #specify working directory - in this case current directory
sudo docker run -i -t -v $WORKING_DIR/:/home/working chrishah/bless /bin/bash
```
