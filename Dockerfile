FROM centos:7.9.2009

LABEL maintainer="daos-do"

ENV container=docker

RUN cd /lib/systemd/system/sysinit.target.wants/ ; \
    for i in * ; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i ; done ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/*

RUN LANG=C yum -y update; \
    yum -y install python python3 python3-pip sudo curl wget gzip tar less; \
    yum -y install epel-release; \
    if [ -f /usr/bin/python3 ];then /usr/bin/python3 -m pip install --no-input --disable-pip-version-check pip --upgrade; fi; \
    ln -snf /usr/bin/python3.6 /usr/bin/python3; \
    mkdir -p /etc/ansible; \
    echo "DO_ANSIBLE_BOOTSTRAPPED=$(date '+%Y-%m-%d %H:%M:%S %Z')" > /etc/ansible/bootstrapped;

RUN mkdir -p /localhome; \
    groupadd --gid 5000 ansible; \
    useradd -b /localhome -m --gid 5000 --uid 5000 -s /bin/bash -c ansible ansible; \
    echo "ansible  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ansible; \
    chmod 600 /etc/sudoers.d/ansible

VOLUME ["/sys/fs/cgroup"]

CMD ["/sbin/init"]
