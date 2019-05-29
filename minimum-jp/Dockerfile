FROM ubuntu:16.04


# Setup Ubuntu environment
# ------------------------

# Install Ubuntu packages
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libgdbm-dev \
        libc6-dev \
        libbz2-dev \
        libssl-dev \
        libreadline-gplv2-dev \
        libncursesw5-dev \
        libsqlite3-dev \
        zlib1g-dev \
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

# Setup locale
RUN echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ="Asia/Tokyo"


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

# Install requirements
ARG requirements_url=https://raw.githubusercontent.com/peinan/dockerfiles/minimum-jp/minimum-jp/requirements.txt
ADD  ${requirements_url} /tmp/requirements.txt
RUN pip install -U pip setuptools && pip install -r /tmp/requirements.txt

