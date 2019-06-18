# Wirepas Oy 2018

FROM ubuntu:18.04 as wirepas-base

# Update the sources list
RUN apt-get update --fix-missing --no-install-recommends \
    && apt-get install -y \
            build-essential \
            nano \
            wget \
            libsystemd-dev \
            dbus \
            python3 \
            python3-dev \
            python3-dbus \
            wait-for-it \
            wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py && rm get-pip.py \
    && pip3 install --upgrade pip \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*

ENV WM_USER=wirepas
ENV WM_HOME=/home/wirepas
ENV WM_PACKAGES=${WM_HOME}/packages/

RUN groupadd -r ${WM_USER} --gid 1000 \
    && useradd --uid 1000 -r -g ${WM_USER} ${WM_USER} \
    && mkdir -p ${WM_HOME}


