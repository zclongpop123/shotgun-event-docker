FROM python:2-alpine

MAINTAINER zangchanglong

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache git &&\
    pip install pytz &&\
    pip install git+https://gitee.com/zclongpop123/python-api.git
