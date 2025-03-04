#!/bin/bash

docker run -v /var/run/docker.sock:/var/run/docker.sock --rm quay.io/sysdig/secure-inline-scan:2 image-ubuntu -k $SYSDIG_SECURE_TOKEN --storage-type docker-daemon