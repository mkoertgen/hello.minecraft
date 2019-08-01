# https://medium.com/@javachampions/java-is-still-free-2-0-0-6b9aa8d6d244
FROM azul/zulu-openjdk-alpine:11.0.3-jre

RUN apk --no-cache add bash curl jq

COPY ./start.sh /
WORKDIR /data

ENV MC_VER=1.14.4\
  INIT_MEM=2G\
  MAX_MEM=4G

VOLUME ["/data"]
EXPOSE 25565
CMD ["/start.sh"]
