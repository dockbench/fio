FROM centos:7

RUN yum update -y \
    && yum install -y fio \
    && rm -rf /var/cache/yum/* \
    && yum clean all

COPY ./jobs/ /jobs/
VOLUME /jobs
VOLUME /target
WORKDIR /jobs

ENTRYPOINT [ "fio"]
