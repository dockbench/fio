# fio

[fio][] benchmark for docker

## fio job files

This container has several job files in `/jobs/*.fio`.

- `randread.fio`: random read
- `randrw.fio`: random read and write
- `randwrite.fio`: random write
- `read.fio`: sequential read
- `write.fio`: sequential write

- `tmpfs/randread.fio`: random read to tmpfs
- `tmpfs/randrw.fio`: random read and write to tmpfs
- `tmpfs/randwrite.fio`: random write to tmpfs
- `tmpfs/read.fio`: sequential read to tmpfs
- `tmpfs/write.fio`: sequential write to tmpfs

These jobs has option `filename=/target/fio`.

- When testing [bind][] mounts I/O, use docker option `-v HOST_DIRECTORY:/target`.
- When testing [tmpfs][] mounts I/O, use docker option `--mount type=tmpfs,tmpfs-size=SIZE_BYTE,destination=/target`.

## execute

### Test no mounts

```shell
docker run -it --rm \
    dockbench/fio:ubuntu-18.04 /jobs/read.fio > read.log
```

### Test bind mounts

```shell
docker run -it --rm \
    -v $(pwd)/.tmp:/target \
    dockbench/fio:ubuntu-18.04 /jobs/read.fio > read.log
```

### Test tmpfs mounts

```shell
docker run -it --rm \
    --mount type=tmpfs,tmpfs-size=2147483648,destination=/target \
    dockbench/fio:ubuntu-18.04 /jobs/tmpfs/read.fio > read.log
```

Difference between `jobs/tmpfs/read.fio` and `jobs/read.fio` is

- `direct=0` : tmpfs can't use O_DIRECT mode.
- `size=1G` : tmpfs can't create huge file.

[fio]: https://linux.die.net/man/1/fio
[tmpfs]: https://docs.docker.com/storage/tmpfs/
[bind]: https://docs.docker.com/storage/bind-mounts/