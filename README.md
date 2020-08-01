# Docker CentOS Systemd

A Dockerfile for building CentOS images that have systemd.

## Branches

Each branch in this git repository is used for building specific versions
of CentOS 8. The master branch always contains the latest version.

|Branch |CentOS Version|FROM Docker image tag|
|-------|--------------|---------------------|
|master |latest (8.2)  |latest               |
|8.2    |8.2           |8.2.2004             |
|8.1    |8.1           |8.1.1911             |
|7.8    |7.8           |7.8.2003             |
|7.7    |7.7           |7.7.1908             |


## Manual Start

```
docker run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  daosdo/centos-systemd:8.2
```
