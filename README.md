#### Example start with fleet

```
ExecStart=/bin/sh -c '\
    /usr/bin/docker run \
        --name cassandra \
        --net="host" \
        -e MAX_HEAP_SIZE=128M \
        -e HEAP_NEWSIZE=100M \
        -e SEEDS="$(etcdctl ls /services/cassandra-seed | cut -d/ -f4 | head -1)" \
        -p 9042:9042 \
        -p 9160:9160 \
        $IMAGE \
    '
```
