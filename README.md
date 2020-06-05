# shotgun-event-docker
- Build
```
docker build -t shotgun-event .
```

- Source Repo
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
- Docker Compose
```
    shotgun-event:
        container_name: ShotgunEvent

        image: shotgun-event
        restart: unless-stopped


        networks:
            extnetwork:
                ipv4_address: 172.20.0.14

        volumes:
            - /home/pipeline/shotgunEventDaemon:/home/pipeline/shotgunEventDaemon
            - /home/pipeline/shotgunEventDaemon/shotgunEvents/src/:/usr/src/myapp

        working_dir: /usr/src/myapp

        entrypoint: ["python", "shotgunEventDaemon.py", "foreground"]

```
