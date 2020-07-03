# How To Use
- Clone this repo
```
git clone https://github.com/zclongpop123/shotgun-event-docker.git
```
- Build
```
docker build -t shotgun-event .
```

- Source Repo (shotgun events and your configs like this)
```
/opt/shotgunEvents
    ├── logs
    ├── plugins
    ├── src
    └── site-packages
```
- Change shotgunEventDaemon.conf
```
# shotgunEventDaemon.conf
[daemon]
pidFile: /opt/shotgunEvents/shotgunEventDaemon.pid

eventIdFile: /opt/shotgunEvents/shotgunEventDaemon.id

logPath: /opt/shotgunEvents/logs

[shotgun]
server: http://yourshotgunurl.com/

name: sg_event_deamon

key: xxxxxxxxxxxxxxxxxxxx


[plugins]
paths: /opt/shotgunEvents/plugins
```

- Docker Use
```
docker run -d --rm -v /opt/shotgunEvents:/opt/shotgunEvents -w /opt/shotgunEvents/src shotgun-event python shotgunEventDaemon.py  foreground

```
- Docker Compose (Service Part)
```
#- docker-compose.yaml

version: '3'

services:

    shotgun-event:
        container_name: Shotgun-Event

        image: shotgun-event
        restart: unless-stopped

        networks:
            - extnetwork

        environment:
            PYTHONPATH: /opt/shotgunEvents/site-packages

        volumes:
            - /opt/shotgunEvents:/opt/shotgunEvents

        entrypoint: ["python", "shotgunEventDaemon.py", "foreground"]

```
```
docker-compose up -d shotgun-event
```
