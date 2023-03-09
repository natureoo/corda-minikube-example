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
echo $PWD
mv cordapps bak
java -jar corda.jar --config-file=${CONFIG_FILE} --initial-registration --base-directory /app --network-root-truststore ./certificates/network-truststore.jks --network-root-truststore-password trustpass
mv bak/*.jar cordapps/
java -jar corda.jar run-migration-scripts --config-file=${CONFIG_FILE} --core-schemas --app-schemas --allow-hibernate-to-manage-app-schema

echo $ROLE
if [[ ! -z "${ROLE}" &&  "NOTARY" = ${ROLE} ]]; then
    TOKEN=`curl -X POST "http://host.minikube.internal:8080/admin/api/login" -H  "accept: text/plain" -H  "Content-Type: application/json" -d "{  \"user\": \"sa\",  \"password\": \"admin\"}"`
    NODEINFO=`ls nodeInfo*`
    curl -X POST -H "Authorization: Bearer $TOKEN" -H "accept: text/plain" -H "Content-Type: application/octet-stream" --data-binary @$NODEINFO http://host.minikube.internal:8080/admin/api/notaries/validating
    curl http://host.minikube.internal:8080/admin/api/notaries
fi

java -jar corda.jar --config-file=${CONFIG_FILE}


curl http://host.minikube.internal:8080/admin/api/nodes



