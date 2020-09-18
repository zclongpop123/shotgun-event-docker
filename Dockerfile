FROM python:3-alpine


MAINTAINER zangchanglong


WORKDIR /usr/src/app


COPY requirements.txt ./


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache git tzdata &&\
    
    pip install -r requirements.txt --no-cache-dir &&\
    
    git clone https://gitee.com/zclongpop123/shotgunEvents.git &&\
    rm -rf ./shotgunEvents/.git


CMD ["python", "./shotgunEvents/src/shotgunEventDaemon.py", "foreground"]
