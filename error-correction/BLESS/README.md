# BLESS

Docker context for [BLESS image](https://hub.docker.com/r/chrishah/bless/)

The Docker image is a self-contained Linux environment (Debian 8.1) set up to run the BLESS error correction tool for Illumina data.

For more information on BLESS see the [BLESS paper](http://bioinformatics.oxfordjournals.org/content/30/10/1354.long) or the [BLESS wiki](http://sourceforge.net/p/bless-ec/wiki/Home/).

This image was built and pushed with:

```
sudo docker build -t chrishah/bless .
sudo docker push chrishah/bless
```

To run the image you will need [Docker](https://www.docker.com/).

Installing Docker in Ubuntu should be as easy as:

```
sudo apt-get install docker.io
```

The BLESS image can then be used interactively. The following will fetch the image (only neccesary once) and take you into the container:
```
#Specify the working directory - in this case current directory
WORKING_DIR=$(pwd)
sudo docker run -i -t -v $WORKING_DIR/:/home/working chrishah/bless /bin/bash
```

With the above command the directory `/home/working` will be mounted to `WORKING_DIR` on your local computer. Now you can simply run BLESS, by typing:
```
bless
```
