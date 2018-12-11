# stable version

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
ARG pyver="3.6.7"
RUN wget https://www.python.org/ftp/python/${pyver}/Python-${pyver}.tgz \
    && tar zxf Python-${pyver}.tgz \
    && cd Python-${pyver} \
    && ./configure \
    && make altinstall \
    && rm -rf /Python-${pyver} /Python-${pyver}.tgz \
    && ln -s /usr/local/bin/python3.6 /usr/local/bin/python \
    && ln -s /usr/local/bin/pip3.6 /usr/local/bin/pip

ENV PYTHONIOENCODING "utf-8"

RUN pip install -U pip \
    && pip install numpy scikit-learn pandas jupyter jupyterlab ipython requests requests_html \
       Flask gensim gunicorn mojimoji matplotlib falcon mecab-python3 tqdm
