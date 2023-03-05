#!/bin/sh

set -eux

#if [ -z "${1-}" ]; then
#  exec java -jar corda.jar --config-file=${CONFIG_FILE} --no-local-shell --log-to-console
#fi

#exec java -jar corda-webserver.jar --config-file=${CONFIG_FILE} --log-to-console
cd /app
#mkdir certificates && cd certificates
cd certificates
curl http://host.minikube.internal:8080/network-map/truststore -o ./network-truststore.jks
cd /app
echo "$PWD"
java -jar corda.jar --config-file=${CONFIG_FILE} --initial-registration --base-directory /app --network-root-truststore ./certificates/network-truststore.jks --network-root-truststore-password trustpass
java -jar corda.jar --config-file=${CONFIG_FILE} run-migration-scripts --core-schemas --app-schemas --allow-hibernate-to-manage-app-schema
java -jar corda.jar --config-file=${CONFIG_FILE}
