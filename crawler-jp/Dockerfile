FROM ubuntu:16.04

MAINTAINER Peinan

# 必要なパッケージインストール
RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        libgdbm-dev \
        libc6-dev \
        libbz2-dev \
        libssl-dev \
        libreadline-gplv2-dev \
        libncursesw5-dev \
        libsqlite3-dev \
        libappindicator1 \
        fonts-liberation \
        libasound2 \
        libnspr4 \
        libnss3 \
        lsb-release \
        xdg-utils \
        zlib1g-dev \
        zip \
        unzip \
        gcc \
        locales \
        tk-dev \
        git \
        sudo \
        vim \
        make \
        wget \
        curl \
        xz-utils \
        file \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 文字化け対策の locale 設定
RUN echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ="Asia/Tokyo"

# install chromedriver for selenium
# NOTE: check the chromedriver version are the latest at 
#       https://sites.google.com/a/chromium.org/chromedriver/downloads
ARG cdver="73.0.3683.68"
RUN wget https://chromedriver.storage.googleapis.com/${cdver}/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin/ \
    && rm -rf chromedriver_linux64.zip \
    && touch /etc/default/google-chrome \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -f \
    && dpkg -i google-chrome-stable_current_amd64.deb \
    && rm -rf google-chrome-stable_current_amd64.deb

# python3.6 のインストール
ARG pyver="3.6.8"
RUN wget https://www.python.org/ftp/python/${pyver}/Python-${pyver}.tgz \
    && tar zxf Python-${pyver}.tgz \
    && cd Python-${pyver} \
    && ./configure \
    && make altinstall \
    && rm -rf /Python-${pyver} /Python-${pyver}.tgz \
    && ln -s /usr/local/bin/python3.6 /usr/local/bin/python \
    && ln -s /usr/local/bin/pip3.6 /usr/local/bin/pip

ENV PYTHONIOENCODING="utf-8"

RUN pip install -U pip setuptools && pip install -r crawler-jp/requirements.txt

