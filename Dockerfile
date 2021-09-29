FROM python:3-alpine


MAINTAINER zangchanglong


WORKDIR /usr/src/app


COPY requirements.txt ./


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U &&\
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple &&\
    
    apk add --no-cache git tzdata &&\
    pip install -r requirements.txt --no-cache-dir &&\
    
    git clone https://github.com/shotgunsoftware/shotgunEvents.git &&\
    rm -rf ./shotgunEvents/.git &&\

    apk del git


CMD ["python", "./shotgunEvents/src/shotgunEventDaemon.py", "foreground"]
