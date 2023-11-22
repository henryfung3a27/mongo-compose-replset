# Start MongoDB replica set with a single click

This is powered by two files: `docker-compose.yml` and `rs-init.sh`.

## `rs-init.sh`

This script is run by the container `mongo-rs-initiator` defined in `docker-compose.yml`. It's job is to wait until the 3 MongoDB instances are ready and then initiate the replica set. After that it is stopped.

# Quick start

Under the root directory, run the following

```sh
docker compose up -d
```

where `-d` means run in detach mode (run in background).

A `data` directory will be created with 3 sub-directories. Each of them corresponds to a MongoDB instance. Restarting the stack will not remove the data as long as the data directory is at the root level of the folder.

## Verify the replica set

There are several ways to verify that the replica set has been initialised successfully.

### 1. docker compose logs

Running `docker compose logs -f mongo-rs-initiator` can show you the logs of the initiator container.

> If you run this command _right after_ starting the stack (by `docker compose up -d`), you may see nothing. That's because the initiator container starts only when the 3 MongoDB instances are up and healthy.

Once you see some output, it means it has started working. When it's finished, it exits automatically and stops. Your replica set should be successfully initiated.

### 2. Dive into Mongo

You could just wait for a while, or until you see there is output from the initiator container. Then, you can go into the container and check the replica set status.

```sh
# Host
$ docker compose exec -it mongo1 mongosh
```

You should then see the `mongosh` prompt.

```sh
# mongosh
my-replica [direct: secondary] test>
```

If you press `Enter` a few times, you should see the prompt changes from `secondary` to `primary`.

```sh
# mongosh
my-replica [direct: primary] test> rs.status()
```

Running `rs.status()` will show the current status. You should first see the `ok` field is `1`. Then, check that there are total of 3 members in the `members` field.

If you have the time, go ahead and see the status of `mongo2` and `mongo3`. They should all be `secondary`.

Congratulations! You have started a MongoDB cluster.

# Reference

Great thanks to the following authors.

1. https://blog.tericcabrel.com/mongodb-replica-set-docker-compose/
2. https://stackoverflow.com/a/73933474/6625422
