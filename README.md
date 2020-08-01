# Docker CentOS Systemd

[![docker build](https://github.com/daos-do/docker-centos-systemd/workflows/docker%20build/badge.svg?branch=master)](https://hub.docker.com/repository/docker/daosdo/centos-systemd)

A Dockerfile for building CentOS images that have systemd enabled.

## Branches

Each branch in this git repository is used for building specific versions
of CentOS. The master branch always contains the latest version.

|Branch |CentOS Version|FROM Docker image tag|
|-------|--------------|---------------------|
|master |latest (8.2)  |latest               |
|8.2    |8.2           |8.2.2004             |
|8.1    |8.1           |8.1.1911             |
|7.8    |7.8           |7.8.2003             |
|7.7    |7.7           |7.7.1908             |

The branches are not meant to be merged to master.

## Usage

### Run it

```
docker run -d \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --name daosd-centos-systemd \
  daosdo/centos-systemd:latest
```

Adding `--tty` allocates a pseudo-TTY and enables color in the logs when
running `docker logs`.

### Enter it

```
docker exec -it daosd-centos-systemd /bin/bash
```

### Remove it

```
docker rm -f daosd-centos-systemd
```
