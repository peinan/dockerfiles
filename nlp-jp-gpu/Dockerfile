# ensure the cuda image version are same with the cuda driver version
# and don't forget adding option `--runtime=nvidia` while running this image

FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
ARG image_name=nlp-jp-gpu


# Setup Ubuntu environment
# ------------------------

# Install Ubuntu packages
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
        mecab-ipadic-utf8

# Setup locale
RUN echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ="Asia/Tokyo"


# Setup specific tools
# --------------------

# NeologD
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd \
    && /tmp/neologd/bin/install-mecab-ipadic-neologd -n -u -y \
    && rm -rf /tmp/neologd

# NodeJS
ARG nodever="12"
RUN curl -sL https://deb.nodesource.com/setup_${nodever}.x | sudo -E bash - \
    && apt-get install -y --no-install-recommends nodejs

# Clean caches
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


# Setup python environment
# ------------------------

# Install python
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

# Install python packages
ARG requirements_url="https://raw.githubusercontent.com/peinan/dockerfiles/nlp-jp-gpu/nlp-jp-gpu/Dockerfile"
ADD ${requirements_url} /tmp/
RUN pip install -U pip setuptools && pip install -r /tmp/requirements.txt

# Install PyTorch
ARG pytorch_url="https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl"
ARG torchvision_url="https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp36-cp36m-linux_x86_64.whl"
RUN pip install ${pytorch_url} ${torchvision_url} torchtext

RUN ldconfig


# Setup jupyterlab
# ----------------

# Copy configs
ARG jroot=/root/.jupyter
RUN rm -rf ${jroot} \
    && git clone https://github.com/peinan/.jupyter ${jroot}

# Install jupyterlab's extensions
ARG script_url="https://raw.githubusercontent.com/peinan/dockerfiles/nlp-jp-gpu/nlp-jp-gpu/install_jupyterlab_extensions.sh"
ADD ${script_url} /tmp/
RUN /tmp/install_jupyterlab_extensions.sh \
    && rm -f /tmp/install_jupyterlab_extensions.sh
