# About this docker image

---
name: docker_ocserv
date: 2025.03.04
comment: This image is used to start OpenConnect VPN Server
url: https://github.com/imax1000/docker_ocserv
---

This is a custom Docker image for [ocserv](http://www.infradead.org/ocserv/) which is a SSL VPN server.


## Build docker image

```bash
$ docker build -t ocserv https://github.com/imax1000/docker_ocserv.git
```

## Run docker container

```bash
$ docker run --name ocserv --privileged -p 443:443 -p 443:443/udp -d ocserv
```

### Add user

```bash
$ docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd <username>
$ Enter password:
$ Re-enter password:
```

### Delete user

```bash
$ docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -d <username>
```