#!/bin/bash
SHELL=/bin/sh PATH=/bin:/sbin:/usr/bin:/usr/sbin

MQTT_IP=$MQTT_IP
MQTT_USER=$MQTT_USER
MQTT_PW=$MQTT_PW

NUMBER_OF_SENSORS='37'
CUT_COLUMN='5'
TOPIC[1]='server_cpu1_temp'
TOPIC[2]='server_cpu2_temp'
TOPIC[3]='server_system_temp'
TOPIC[4]='server_peripheral_temp'
TOPIC[5]='server_pch_temp'
TOPIC[6]='server_fan1'
TOPIC[7]='server_fan2'
TOPIC[8]='server_fan3'
TOPIC[9]='server_fan4'
TOPIC[10]='server_fan5'
TOPIC[11]='server_fan6'
TOPIC[12]='server_fana'
TOPIC[13]='server_fanb'
TOPIC[14]='server_dimma1_temp'
TOPIC[15]='server_dimma2_temp'
TOPIC[16]='server_dimma3_temp'
TOPIC[17]='server_dimmb1_temp'
TOPIC[18]='server_dimmb2_temp'
TOPIC[19]='server_dimmb3_temp'
TOPIC[20]='server_dimmc1_temp'
TOPIC[21]='server_dimmc2_temp'
TOPIC[22]='server_dimmc3_temp'
TOPIC[23]='server_dimmd1_temp'
TOPIC[24]='server_dimmd2_temp'
TOPIC[25]='server_dimmd3_temp'
TOPIC[26]='server_dimme1_temp'
TOPIC[27]='server_dimme2_temp'
TOPIC[28]='server_dimme3_temp'
TOPIC[29]='server_dimmf1_temp'
TOPIC[30]='server_dimmf2_temp'
TOPIC[31]='server_dimmf3_temp'
TOPIC[32]='server_dimmg3_temp'
TOPIC[33]='server_dimmg3_temp'
TOPIC[34]='server_dimmg3_temp'
TOPIC[35]='server_dimmh3_temp'
TOPIC[36]='server_dimmh3_temp'
TOPIC[37]='server_dimmh3_temp'

SDR[1]='3.1'
SDR[2]='3.2'
SDR[3]='7.1'
SDR[4]='7.2'
SDR[5]='7.3'
SDR[6]='29.1'
SDR[7]='29.2'
SDR[8]='29.3'
SDR[9]='29.4'
SDR[10]='29.5'
SDR[11]='29.6'
SDR[12]='29.7'
SDR[13]='29.8'

SDR[14]='32.64'
SDR[15]='32.65'
SDR[16]='32.66'
SDR[17]='32.68'
SDR[18]='32.69'
SDR[19]='32.70'
SDR[20]='32.72'
SDR[21]='32.73'
SDR[22]='32.74'
SDR[23]='32.76'
SDR[24]='32.77'
SDR[25]='32.78'
SDR[26]='32.80'
SDR[27]='32.81'
SDR[28]='32.82'
SDR[29]='32.84'
SDR[30]='32.85'
SDR[31]='32.86'
SDR[32]='32.88'
SDR[33]='32.89'
SDR[34]='32.90'
SDR[35]='32.92'
SDR[36]='32.93'
SDR[37]='32.94'


for i in $(eval echo "{1..$NUMBER_OF_SENSORS}")
do
   PAYLOAD=$(ipmitool sdr entity "${SDR[$i]}"|cut -d '|' -f$CUT_COLUMN|awk '{print $1}')
#   echo $PAYLOAD
   mosquitto_pub -r -t "${TOPIC[$i]}" -m "$PAYLOAD" -h "$MQTT_IP" -u "$MQTT_USER" -P "$MQTT_PW"
###   mosquitto_pub -r -t "${TOPIC[$i]}" -m "$PAYLOAD" -h "$MQTT_IP"
done

