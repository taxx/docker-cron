FROM alpine:latest
LABEL maintainer taxx

RUN apk update && apk add ipmitool mosquitto-clients bash

ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
