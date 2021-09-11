#!/bin/bash

read -p "Instance Name: " INSTANCE_NAME
read -p "MongoDB Port: " MONGODB_PORT
read -p "Replica Name: " REPLICA_NAME

mkdir -p /data/${INSTANCE_NAME}/certs
mkdir -p /data/${INSTANCE_NAME}/conf
mkdir -p /data/${INSTANCE_NAME}/db
mkdir -p /data/${INSTANCE_NAME}/dump
mkdir -p /data/${INSTANCE_NAME}/log

# Add keyfile
echo "u0ULgWoDwHRwTMW5UHcS8ZSuJpDCgzg9" > /data/${INSTANCE_NAME}/certs/keyfile

# Create mongo config
echo "# mongod.conf" > /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "# for documentation of all options, see:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#   http://docs.mongodb.org/manual/reference/configuration-options/" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "# Where and how to store data." >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "storage:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  dbPath: "/data/${INSTANCE_NAME}/db"" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  journal:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "    enabled: true" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  engine:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  mmapv1:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  wiredTiger:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "    engineConfig:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "      cacheSizeGB: 1" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "# where to write logging data." >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "systemLog:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  destination: file" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  path: "/data/${INSTANCE_NAME}/log/mongod.log"" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  logAppend: true" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "# network interfaces" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "net:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  ssl:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#    mode: requireSSL" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#    PEMKeyFile: /data/certs/server.pem" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#    CAFile: /data/certs/client.pem" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  port: ${MONGODB_PORT}" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  bindIp: 0.0.0.0" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "  maxIncomingConnections: 1000" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#processManagement:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  fork: true" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#security:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  #clusterAuthMode: x509" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  authorization: enabled" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  #authorization: disabled" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  #keyFile: ./conf/keyfile" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  keyFile: /data/mongodb/${INSTANCE_NAME}/certs/keyfile" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#operationProfiling:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#replication:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#  replSetName: ${REPLICA_NAME}" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#sharding:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo " " >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "## Enterprise-Only Options:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#auditLog:" >> /data/${INSTANCE_NAME}/conf/mongod.conf
echo "#snmp:" >> /data/${INSTANCE_NAME}/conf/mongod.conf