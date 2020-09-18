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

- Docker Compose (Service Part)
```
#- docker-compose.yaml

version: '3'

services:

    shotgun-event:
        container_name: Shotgun-Event

        image: shotgun-event
        restart: unless-stopped

        environment:
            PYTHONPATH: /usr/src/app/site-packages

        volumes:
            - /home/shotgunEvents/shotgunEventDaemon.conf:/usr/src/app/shotgunEvents/src/shotgunEventDaemon.conf
            - /home/shotgunEvents/site-packages:/usr/src/app/site-packages
            - /home/shotgunEvents/plugins:/usr/src/app/shotgunEvents/plugins
            - /home/shotgunEvents/logs:/usr/src/app/shotgunEvents/logs
```
```
docker-compose up -d shotgun-event
```
