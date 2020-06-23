FROM python:2-alpine

MAINTAINER zangchanglong

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache git tzdata &&\
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    echo 'Asia/Shanghai' > /etc/timezone &&\
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytz &&\
    pip install git+https://gitee.com/zclongpop123/python-api.git
