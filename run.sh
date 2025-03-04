#!/bin/sh


docker run  \
    -p 7444:7443 \
    --detach \
    --name ocserv imax1000/ocserv:1.0.1