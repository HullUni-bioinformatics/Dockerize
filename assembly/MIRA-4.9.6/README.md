## MIRA assembler

Docker context for [MIRA image](https://hub.docker.com/r/chrishah/mira/)

The Docker image is a self-contained Linux environment (Ubuntu 14.04) set up to run the mira assembler suite of programs (currently development version __v4.9.6__).

For more information on MIRA see the [MIRA guide](http://mira-assembler.sourceforge.net/docs/DefinitiveGuideToMIRA.html).

This image was built and pushed with:

```
sudo docker build --rm --no-cache -t chrishah/mira:v4.9.6 .
sudo docker push chrishah/chrishah/mira:v4.9.6
```

To run the image you will need [Docker](https://www.docker.com/).

Installing Docker in Ubuntu should be as easy as:

```
sudo apt-get install docker.io
```

The MIRA image can then be used as an executable. The following will fetch the image from [Docker Hub](https://hub.docker.com/) `chrishah/mira` (takes a minute at first execution, then it will remain in memory until you remove it) and execute MIRA:
```
sudo docker run -it --rm  -v $(pwd):/home chrishah/mira:v4.9.6 mira
```

or enter the container, e.g. as follows:
```
sudo docker run -it --rm -v $(pwd):/home chrishah/mira:v4.9.6 /bin/bash
```

