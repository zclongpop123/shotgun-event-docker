FROM python:2-alpine

MAINTAINER zangchanglong

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache git tzdata &&\
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    echo 'Asia/Shanghai' > /etc/timezone &&\
    python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U &&\
    pip install pytz &&\
    pip install git+https://gitee.com/zclongpop123/python-api.git &&\
    git clone https://github.com/shotgunsoftware/shotgunEvents.git /opt/shotgunEvents &&\
    mv /opt/shotgunEvents/src/shotgunEventDaemon.conf.example /opt/shotgunEvents/src/shotgunEventDaemon.conf

WORKDIR /opt/shotgunEvents/src

CMD ["python", "shotgunEventDaemon.py", "foreground"]
