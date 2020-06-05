FROM python:2

MAINTAINER zangchanglong

RUN pip install pytz &&\
    pip install git+https://gitee.com/zclongpop123/python-api.git
