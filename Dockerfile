FROM ubuntu

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends fio \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./jobs/ /jobs/
VOLUME /jobs
VOLUME /target
WORKDIR /jobs

ENTRYPOINT [ "fio"]
