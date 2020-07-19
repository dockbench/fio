# fio
fio benchmark for docker

## execute

### Test directory in container

```shell
docker run -it --rm \
    dokbench-fio:ubuntu-18.04 /jobs/read.fio > read.log
```

### Test mounted volume

```shell
docker run -it --rm \
    -v $(pwd)/.tmp:/target \
    dokbench-fio:ubuntu-18.04 /jobs/read.fio > read.log
```

### Test tmpfs volume

```shell
docker run -it --rm \
    --mount type=tmpfs,tmpfs-size=2147483648,destination=/target \
    dokbench-fio:ubuntu-18.04 /jobs/tmpfs/read.fio > read.log
```

Difference between `jobs/tmpfs/read.fio` and `jobs/read.fio` is

- `direct=0` : tmpfs can't use O_DIRECT mode.
- `size=1G` : tmpfs can't create huge file.
