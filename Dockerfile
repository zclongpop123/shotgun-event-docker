FROM python:2-alpine

MAINTAINER zangchanglong

RUN apk add --no-cache git &&\
    pip install pytz &&\
    pip install git+https://gitee.com/zclongpop123/python-api.git
