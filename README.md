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
/home/pipeline/shotgunEventDaemon
.
├── logs
│   └── shotgunEventDaemon
├── plugins
├── shotgunEventDaemon.id
└── shotgunEvents
    ├── LICENSE
    ├── README.mkd
    └── src
        ├── daemonizer.py
        ├── daemonizer.pyc
        ├── examplePlugins
        ├── shotgunEventDaemon.conf
        └── shotgunEventDaemon.py

```

- Change shotgunEventDaemon.conf
```
# shotgunEventDaemon.conf
[daemon]
pidFile: /home/pipeline/shotgunEventDaemon/shotgunEventDaemon.pid
eventIdFile: /home/pipeline/shotgunEventDaemon/shotgunEventDaemon.id
logPath: /home/pipeline/shotgunEventDaemon/logs

[shotgun]
server: http://yourshotgunurl.com/
name: sg_event_deamon
key: xxxxxxxxxxxxxxxxxxxx

[plugins]
paths: /home/pipeline/shotgunEventDaemon/plugins
```
- Docker Use
```
docker run -d --rm -v /home/pipeline/shotgunEventDaemon:/home/pipeline/shotgunEventDaemon -v "$PWD":/usr/src/myapp -w /usr/src/myapp shotgun-event python shotgunEventDaemon.py  foreground

```
- Docker Compose (Service Part)
```
#- docker-compose.yaml

version: '3'

services:

    shotgun-event:
        container_name: ShotgunEvent

        image: shotgun-event
        restart: unless-stopped


        #networks:
        #    extnetwork:
        #        ipv4_address: 172.20.0.14

        volumes:
            - /home/pipeline/shotgunEventDaemon:/home/pipeline/shotgunEventDaemon
            - /home/pipeline/shotgunEventDaemon/shotgunEvents/src/:/usr/src/myapp

        working_dir: /usr/src/myapp

        entrypoint: ["python", "shotgunEventDaemon.py", "foreground"]

```
```
docker-compose up -d shotgun-event
```
