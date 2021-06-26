FROM debian:buster-slim
LABEL maintainer taxx

RUN apt update && apt upgrade -y && apt install -y  ipmitool mosquitto-clients bash cron

ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
