docker-gearman
==============
UNMAINTAINED

This project has been discontinued. We're suggesting to use [artefactual-dockergearmand](https://github.com/artefactual-labs/docker-gearmand) instead.

Docker image for [Gearman Job Server](http://gearman.org/).

Usage
-----
Run gearman:
```
docker run cargomedia/gearman --job-retries=5
```

Development
-----------
Build the image:
```
docker build -t cargomedia/gearman .
```

The image will be pushed to Docker Hub by the travis build.
