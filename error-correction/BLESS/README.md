# BLESS

Docker context for [BLESS image](https://hub.docker.com/r/chrishah/bless/)

The Docker image is a self-contained Linux environment (Debian 8.1) set up to run the BLESS error correction tool for Illumina data.

I am in no way involved in the development of the BLESS software - this is just the Docker context to build an image for it.

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

The BLESS image can then be used as an executable. The following will fetch the image (only neccesary once) and execute BLESS:
```
sudo docker run -i -t -v $(WORKING_DIR):/home/working chrishah/bless
```

With the above command the directory `/home/working` in the container will be mounted to your present working directory `$(pwd)` on your local computer. 

You may want to create an alias for the above command, e.g by typing:
```
alias bless_docker="sudo docker run -i -t -v $(WORKING_DIR):/home/working chrishah/bless"
```

or add the above code to your `~/.bashrc` and source by `. ~/.bashrc` to create a permanent alias.

Then you can simply run BLESS on your local computer with e.g. (which will display the usage for BLESS):
```
bless_docker
```

_NOTE:_ Any file that should be processed with BLESS needs to be physically present in your working directory (or whichever local directory you decide to mount your docker container to) or subdirectories within it. Symbolic links to files in parent directories of the mount point do not work.
