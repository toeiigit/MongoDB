#!/bin/bash
MG_USER=${1:-"sysadm"}
MG_PASS=${2:-"sysadm"}

# Rotate log
for MONGODB_PORT in $(find . -name mongod.conf | xargs grep port | awk -F: {'print$3'} | sort -u)
do
    mongo -u ${MG_USER} -p ${MG_PASS} --port ${MONGODB_PORT} admin --eval "db.adminCommand( { logRotate : 1 } )"
done