# Start MongoDB replica set with a single click

This is powered by two files: `docker-compose.yml` and `rs-init.sh`.

## `rs-init.sh`

This script is run by the container `mongo-rs-initiator` defined in `docker-compose.yml`. It's job is to wait until the 3 MongoDB instances are ready and then initiate the replica set. After that it is stopped.

# Reference

Great thanks to the following authors.

1. https://blog.tericcabrel.com/mongodb-replica-set-docker-compose/
2. https://stackoverflow.com/a/73933474/6625422
