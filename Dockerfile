FROM ubuntu:latest

WORKDIR /home/

USER root

RUN apt-get update && \
    apt-get -y install git curl && \
    apt-get -y install wget

COPY . .
CMD /bin/bash
