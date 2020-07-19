FROM ubuntu:18.04

RUN apt-get update -y \
    && apt-get install -y fio \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./jobs/ /jobs/
VOLUME /jobs
VOLUME /target
WORKDIR /jobs

ENTRYPOINT [ "fio"]
