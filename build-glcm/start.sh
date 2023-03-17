#!/bin/sh

#set -eux

#if [ -z "${1-}" ]; then
#  exec java -jar corda.jar --config-file=${CONFIG_FILE} --no-local-shell --log-to-console
#fi

#exec java -jar corda-webserver.jar --config-file=${CONFIG_FILE} --log-to-console
cd /app
#mkdir certificates && cd certificates
FILE=certificates
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist."
    mkdir certificates && cd certificates
    curl http://34.76.103.90:8080/network-map/truststore -o ./network-truststore.jks
    cd /app
    echo $PWD
    mv cordapps bak
    java -jar corda.jar --config-file=${CONFIG_FILE} --initial-registration --base-directory /app --network-root-truststore ./certificates/network-truststore.jks --network-root-truststore-password trustpass
    mv bak/*.jar cordapps/
    java -jar corda.jar run-migration-scripts --config-file=${CONFIG_FILE} --core-schemas --app-schemas --allow-hibernate-to-manage-app-schema
else
    echo "$FILE  exist. no need to register and init db"
fi

#echo $ROLE
#if [[ "NOTARY" = ${ROLE} ]]; then
#    TOKEN=`curl -X POST "http://34.76.103.90:8080/admin/api/login" -H  "accept: text/plain" -H  "Content-Type: application/json" -d "{  \"user\": \"sa\",  \"password\": \"admin\"}"`
#    NODEINFO=`ls nodeInfo*`
#    curl -X POST -H "Authorization: Bearer $TOKEN" -H "accept: text/plain" -H "Content-Type: application/octet-stream" --data-binary @$NODEINFO http://34.76.103.90:8080/admin/api/notaries/validating
#    curl http://34.76.103.90:8080/admin/api/notaries
#fi

java -jar corda.jar --config-file=${CONFIG_FILE}


#curl http://34.76.103.90:8080/admin/api/nodes



