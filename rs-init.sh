#!/bin/bash

echo "======== Start initiating Replica Set ========"

mongosh --host m1 <<EOF
    config = {
    _id: "my-replica",
    members: [
        {
        _id: 0,
        host: "m1:27017",
        },
        {
        _id: 1,
        host: "m2:27017",
        },
        {
        _id: 2,
        host: "m3:27017",
        },
    ],
    };
    rs.initiate(config)
EOF

echo "=============================================="
