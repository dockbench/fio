FROM alpine:3.10.1

RUN apk add --no-cache fio

COPY ./jobs/ /jobs/
VOLUME /jobs
VOLUME /target
WORKDIR /jobs

ENTRYPOINT [ "fio"]
