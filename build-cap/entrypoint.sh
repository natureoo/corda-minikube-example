#!/bin/sh


cd /app
echo $PWD
java -jar corda.jar --config-file=${CONFIG_FILE}


