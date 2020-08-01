# Docker CentOS Systemd

[![build status](https://img.shields.io/docker/cloud/build/daos-do/centos-systemd)](https://hub.docker.com/repository/docker/daos-do/centos-systemd)

CentOS image that has systemd enabled.

## Branches

Each branch in the repository is used for building a specific version.

| Branch | CentOS Version | FROM Docker image tag |
| ------ | -------------- | --------------------- |
| master | latest (8.2)   | latest                |
| 8.2    | 8.2            | 8.2.2004              |
| 7.8    | 7.8            | 7.8.2003              |

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
