FROM python:3-alpine


MAINTAINER zangchanglong


WORKDIR /usr/src/app


COPY requirements.txt ./


RUN apk add --no-cache git tzdata &&\
    pip install -r requirements.txt --no-cache-dir &&\
    
    git clone https://github.com/shotgunsoftware/shotgunEvents.git &&\
    rm -rf ./shotgunEvents/.git &&\

    apk del git


CMD ["python", "./shotgunEvents/src/shotgunEventDaemon.py", "foreground"]
