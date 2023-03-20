FROM azul/zulu-openjdk-alpine:8u192

ADD https://repo1.maven.org/maven2/net/corda/corda/4.9.6/corda-4.9.6.jar /app/corda.jar

RUN apk upgrade --update && \
    apk add --update --no-cache bash curl busybox-extras net-tools iputils nfs-utils nss curl netcat-openbsd lftp openssh-client openssh-server jq && \
    rm -rf /var/cache/apk/*


WORKDIR /app

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
