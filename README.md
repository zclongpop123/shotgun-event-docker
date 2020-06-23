# How To Use
- Clone this repo
```
git clone https://github.com/zclongpop123/shotgun-event-docker.git
```
- Build
```
docker build -t shotgun-event .
```
- Change Timezone
```
apk add tzdata --repository http://mirrors.ustc.edu.cn/alpine/v3.4/main/

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone
```
- Source Repo (shotgun events and your configs like this)
```
/home/pipeline/shotgunEvents
    ├── logs
    ├── plugins
    ├── src
    └── site-packages
```
- Change shotgunEventDaemon.conf
```
# shotgunEventDaemon.conf
[daemon]
pidFile: /home/pipeline/shotgunEvents/shotgunEventDaemon.pid

eventIdFile: /home/pipeline/shotgunEvents/shotgunEventDaemon.id

logPath: /home/pipeline/shotgunEvents/logs

[shotgun]
server: http://yourshotgunurl.com/

name: sg_event_deamon

key: xxxxxxxxxxxxxxxxxxxx


[plugins]
paths: /home/pipeline/shotgunEvents/plugins
```

- Docker Use
```
docker run -d --rm -v /home/pipeline/shotgunEvents:/usr/src/app -w /usr/src/myapp/src shotgun-event python shotgunEventDaemon.py  foreground

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
            PYTHONPATH: /usr/src/app/site-packages

        volumes:
            - /home/pipeline/shotgunEvents:/usr/src/app

        entrypoint: ["python", "/usr/src/app/src/shotgunEventDaemon.py", "foreground"]

```
```
docker-compose up -d shotgun-event
```
