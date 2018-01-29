docker-gearman
==============
Docker image for [Gearman Job Server](http://gearman.org/).

[![Build Status](https://img.shields.io/travis/cargomedia/docker-gearman/master.svg)](https://travis-ci.org/cargomedia/docker-gearman)

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
