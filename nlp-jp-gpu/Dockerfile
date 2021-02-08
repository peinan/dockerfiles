# ensure the cuda image version are same with the cuda driver version
# and don't forget adding option `--runtime=nvidia` while running this image

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
# FYI: https://hub.docker.com/r/nvidia/cuda/tags?page=1&name=10.1-cudnn7-devel-ubuntu

# Use bash instead of sh
SHELL ["/bin/bash", "-c"]

ARG image_name=nlp-jp-gpu
ARG github_url=https://raw.githubusercontent.com/peinan/dockerfiles/master/${image_name}

# Versions
ARG NODE_VER="12"
ARG PYTHON_VER="3.8.7"
ARG TORCH_VER="1.5.1"
ARG TORCH_VISION_VER="0.6.1"
ARG TORCH_CUDA_VER="cu101"


# Setup Ubuntu environment
# ------------------------

# Avoid interrupt of tz config
# ref: https://qiita.com/yagince/items/deba267f789604643bab
ENV DEBIAN_FRONTEND=noninteractive

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
        libffi-dev \
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
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VER}.x | sudo -E bash - \
    && apt-get install -y --no-install-recommends nodejs


# Setup python environment
# ------------------------

# Install python
RUN wget --no-check-certificate https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz \
    && tar zxf Python-${PYTHON_VER}.tgz \
    && cd Python-${PYTHON_VER} \
    && ./configure \
    && make altinstall \
    && rm -rf /Python-${PYTHON_VER} /Python-${PYTHON_VER}.tgz
RUN ln -s /usr/local/bin/python${PYTHON_VER:0:3} /usr/local/bin/python \
    && ln -s /usr/local/bin/pip${PYTHON_VER:0:3} /usr/local/bin/pip

ENV PYTHONIOENCODING "utf-8"

# Install python packages
RUN wget --no-check-certificate ${github_url}/requirements.txt -O /tmp/requirements.txt
RUN pip install -U pip setuptools \
    && pip install -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt

# Install PyTorch
# Be careful with the CUDA version. Reference the official page: https://pytorch.org/get-started/previous-versions/
RUN pip install torch==${TORCH_VER}+${TORCH_CUDA_VER} torchvision==${TORCH_VISION_VER}+${TORCH_CUDA_VER} -f https://download.pytorch.org/whl/torch_stable.html


# Setup jupyterlab
# ----------------

# Copy configs
ARG jroot=/root/.jupyter
RUN rm -rf ${jroot} \
    && git clone https://github.com/peinan/.jupyter ${jroot}

# Install jupyterlab's extensions
ARG script_name=install_jupyterlab_extensions.sh
RUN wget --no-check-certificate ${github_url}/${script_name} -O /tmp/${script_name}
RUN chown root /tmp/${script_name}
RUN /bin/bash /tmp/${script_name} \
    && rm -f /tmp/${script_name}


# Finishing
# ---------

RUN ldconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
