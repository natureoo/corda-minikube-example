FROM azul/zulu-openjdk-alpine:8u192

#ADD https://repo1.maven.org/maven2/net/corda/corda/4.8/corda-4.8.jar /app/corda.jar
#ADD https://repo1.maven.org/maven2/net/corda/corda-webserver/4.1/corda-webserver-4.1.jar /app/corda-webserver.jar
#ADD https://repo1.maven.org/maven2/net/corda/corda-finance/3.4-corda/corda-finance-3.4-corda.jar /app/plugins/corda-finance.jar

COPY corda-4.8.jar /app/corda.jar
COPY corda-webserver-4.1.jar /app/corda-webserver.jar
COPY corda-finance-3.4-corda.jar /app/plugins/corda-finance.jar

#RUN echo -e "http://nl.alpinelinux.org/alpine/v3.8/main\nhttp://nl.alpinelinux.org/alpine/v3.8/community" > /etc/apk/repositories
#RUN echo -e "http://nl.alpinelinux.org/alpine/v3.5/main\nhttp://nl.alpinelinux.org/alpine/v3.5/community" > /etc/apk/repositories
#
RUN apk upgrade --update && \
    apk add --update --no-cache bash curl busybox-extras net-tools iputils nfs-utils nss curl netcat-openbsd lftp openssh-client openssh-server jq && \
#    apk add --update --no-cache curl && \
    rm -rf /var/cache/apk/*

#RUN apk --no-cache add curl


COPY entrypoint.sh /app/entrypoint.sh

WORKDIR /app

#ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
CMD exec /bin/bash -c "trap : TERM INT; sleep 9999999999d & wait"
