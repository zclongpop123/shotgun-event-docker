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
/usr/src/app/shotgunEvents
    ├── logs
    ├── plugins
    ├── src
    └── site-packages
```
- Change shotgunEventDaemon.conf
```
# shotgunEventDaemon.conf
[daemon]
pidFile: /usr/src/app/shotgunEvents/shotgunEventDaemon.pid

eventIdFile: /usr/src/app/shotgunEvents/shotgunEventDaemon.id

logPath: /usr/src/app/shotgunEvents/logs

[shotgun]
server: http://yourshotgunurl.com/

name: sg_event_deamon

key: xxxxxxxxxxxxxxxxxxxx


[plugins]
paths: /usr/src/app/shotgunEvents/plugins
```

- Docker Use
```
docker run -d --rm -v /usr/src/app/shotgunEvents/logs:/usr/src/app/shotgunEvents/logs -w /usr/src/app/shotgunEvents/src shotgun-event python shotgunEventDaemon.py foreground

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
            PYTHONPATH: /usr/src/app/shotgunEvents/site-packages

        volumes:
            - /usr/src/app/shotgunEvents/shotgunEventDaemon.conf:/usr/src/app/shotgunEvents/plugins/shotgunEventDaemon.conf
            - /usr/src/app/shotgunEvents/site-packages:/usr/src/app/shotgunEvents/plugins/site-packages
            - /usr/src/app/shotgunEvents/plugins:/usr/src/app/shotgunEvents/plugins
            - /usr/src/app/shotgunEvents/logs:/usr/src/app/shotgunEvents/logs

        entrypoint: ["python", "./shotgunEvents/src/shotgunEventDaemon.py", "foreground"]

```
```
docker-compose up -d shotgun-event
```
