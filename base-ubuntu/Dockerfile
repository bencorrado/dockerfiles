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
            wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py && rm get-pip.py \
    && pip3 install --upgrade pip \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/local/bin/wait-for-it

ENV USER=wirepas
ENV HOME=/home/wirepas
ENV WM_PACKAGES=${HOME}/packages/

RUN groupadd -r ${USER} --gid 1000 \
    && useradd --uid 1000 -r -g ${USER} ${USER} \
    && mkdir -p ${HOME}


