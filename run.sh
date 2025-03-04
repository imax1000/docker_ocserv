#!/bin/sh


docker run  \
    --publish 7443:443/tcp \
    --publish 7443:443/udp \
    --mount type=bind,src=./config,dst=/etc/ocserv \
    --rm \
    --name ocserv \
    imax1000/ocserv:1.0.2
#    --detach \


#    --volume ./config/ocserv.conf:/etc/ocserv/ocserv.conf \
#    --volume ./config/config-per-user/:/etc/ocserv/config-per-user/ \
#    --volume ./config/ocpasswd:/etc/ocserv/ocpasswd \
    
    
#docker run -d \
#  --cap-add MKNOD \
#  --cap-add NET_ADMIN \
#  --cap-add NET_RAW \
#  --hostname $(hostname -f) \
#  --publish 443:443/tcp \
#  --publish 443:443/udp \
#  --volume /etc/letsencrypt:/etc/letsencrypt:ro \
#  ghcr.io/ntkme/ocserv:edge