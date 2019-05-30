FROM ubuntu:16.04

ARG image_name=crawler-jp
ARG github_url=https://raw.githubusercontent.com/peinan/dockerfiles/${image_name}/${image_name}


# Setup Ubuntu environment
# ------------------------

# Install Ubuntu packages
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
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
        ca-certificates \
        libappindicator3-1 \
        libatk-bridge2.0-0 \
        libatspi2.0-0 \
        libgtk-3-0 \
        libxtst6


# Setup locale
RUN echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ="Asia/Tokyo"


# Setup specific tools
# --------------------

# install chromedriver for selenium
# NOTE: check the chromedriver version are the latest at 
#       https://sites.google.com/a/chromium.org/chromedriver/downloads
ARG cdver="74.0.3729.6"
RUN wget --no-check-certificate https://chromedriver.storage.googleapis.com/${cdver}/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin/ \
    && rm -rf chromedriver_linux64.zip \
    && touch /etc/default/google-chrome \
    && wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -f \
    && dpkg -i google-chrome-stable_current_amd64.deb \
    && rm -rf google-chrome-stable_current_amd64.deb


# Setup python environment
# ------------------------

# Install python
ARG pyver="3.6.8"
RUN wget --no-check-certificate https://www.python.org/ftp/python/${pyver}/Python-${pyver}.tgz \
    && tar zxf Python-${pyver}.tgz \
    && cd Python-${pyver} \
    && ./configure \
    && make altinstall \
    && rm -rf /Python-${pyver} /Python-${pyver}.tgz \
    && ln -s /usr/local/bin/python3.6 /usr/local/bin/python \
    && ln -s /usr/local/bin/pip3.6 /usr/local/bin/pip

ENV PYTHONIOENCODING="utf-8"

# Install python packages
ADD ${github_url}/requirements.txt /tmp/requirements.txt
RUN pip install -U pip setuptools \
    && pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt


# Finishing
# ---------

RUN ldconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

