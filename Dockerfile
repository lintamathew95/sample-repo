FROM ubuntu:18.04
MAINTAINER Linta Mathew <lintamathew1995@gmail.com>

ENV ANDROID_HOME=/home/m1065582/Android/Sdk
ENV PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
 && apt-get install -qqy --no-install-recommends \
      bzip2 \
      curl \
      git-core \
      html2text \
      openjdk-8-jdk \
      libc6-i386 \
      lib32stdc++6 \
      lib32gcc1 \
      lib32ncurses5 \
      lib32z1 \
      unzip \
      locales \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
 
RUN curl https://github.com/lintamathew95/sample-repo.git | sed 's/env python$/env python3/' > /usr/bin/repo && chmod a+rx /usr/bin/repo
