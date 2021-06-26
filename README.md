## Running ipmitool and sending values over mqtt 

Based on this post:
https://community.home-assistant.io/t/ipmi-sensors/279248/2

### Build Docker image
docker build -t taxx/ipmi_mqtt .

### Run with docker compose

```yaml
version: '3'
services:
  ipmimqtt:
    image: taxx/ipmi_mqtt
    container_name: ipmi_mqtt
    privileged: true
    devices:
      - /dev/ipmi0:/dev/ipmi0
    environment:
      - PUID=${PUID}
      - PGID=${PGID}
      - TZ=Europe/Stockholm
      - MQTT_IP=ip
      - MQTT_TOPIC=topic
      - MQTT_USER=user
      - MQTT_PW=pass
```

### Test the cron output

- Copy the container id from the output of this command  
docker ps | grep docker-cron

- Login to the docker container using the `container_id`  
docker exec -it <container_id> /bin/bash  
Example: docker exec -it bc8a9bbfbba9 /bin/bash

>Note: Try running above commands using sudo if you get Permission Denied Error.  
`Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.39/containers/json: dial unix /var/run/docker.sock: connect: permission denied`
