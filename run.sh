#!/bin/sh


docker run  \
    -p 7444:443 \
    -v ./config/ocserv.conf:/etc/ocserv/ocserv.conf \
    -v ./config/config-per-user/:/etc/ocserv/config-per-user/ \
    -v ./config/ocpasswd:/etc/ocserv/ocpasswd \
    --rm \
#    --detach \
    --name ocserv \
    -t imax1000/ocserv:1.0.1