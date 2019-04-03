# stable version

# ensure the cuda image version are same with the cuda driver version
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

MAINTAINER Peinan
COPY nlp-jp-gpu/requirements.txt /tmp/

# 必要なパッケージインストール
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        sudo \
        git \
        wget \
        curl \
        make \
        cmake \
        vim \
        gcc \
        g++ \
        build-essential \
        libgdbm-dev \
        libc6-dev \
        libbz2-dev \
        libssl-dev \
        libreadline-gplv2-dev \
        libncursesw5-dev \
        libsqlite3-dev \
        zlib1g-dev \
        ca-certificates \
        software-properties-common \
        locales \
        tk-dev \
        xz-utils \
        file \
        swig \
        mecab \
        libmecab-dev \
        mecab-ipadic-utf8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 文字化け対策の locale 設定
RUN echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen
ENV LANG ja_JP.UTF-8 \
    LANGUAGE ja_JP:ja \
    LC_ALL ja_JP.UTF-8 \
    TZ="Asia/Tokyo"

# neologd のインストール
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd \
    && /tmp/neologd/bin/install-mecab-ipadic-neologd -n -u -y \
    && rm -rf /tmp/neologd

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

ENV PYTHONIOENCODING "utf-8"

RUN pip install -U pip setuptools && pip install -r /tmp/requirements.txt

# install PyTorch
ARG pytorch_url="https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl"
RUN pip install ${pytorch_url} torchvision torchtext

RUN ldconfig

# don't forget adding option `--runtime=nvidia` while running this image
