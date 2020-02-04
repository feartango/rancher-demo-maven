FROM maven:3.6.3-jdk-8-slim

ENV HOME=/home/usr/app

RUN mkdir -p $HOME

WORKDIR $HOME

# 1. add pom.xml only here

ADD pom.xml $HOME

# 2. start downloading dependencies

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]