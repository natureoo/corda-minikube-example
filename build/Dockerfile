FROM openjdk:8-alpine

#ADD https://dl.bintray.com/r3/corda/net/corda/corda/4.8/corda-4.8.jar /app/corda.jar
#ADD https://dl.bintray.com/r3/corda/net/corda/corda-webserver/4.8/corda-webserver-4.8.jar /app/corda-webserver.jar
#ADD https://dl.bintray.com/r3/corda/net/corda/corda-finance/3.4-corda/corda-finance-3.4-corda.jar /app/plugins/corda-finance.jar

ADD https://repo1.maven.org/maven2/net/corda/corda/4.8/corda-4.8.jar /app/corda.jar
ADD https://repo1.maven.org/maven2/net/corda/corda-webserver/4.8/corda-webserver-4.8.jar /app/corda-webserver.jar
ADD https://repo1.maven.org/maven2/net/corda/corda-finance/3.4-corda/corda-finance-3.4-corda.jar /app/plugins/corda-finance.jar


COPY entrypoint.sh /app/entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
