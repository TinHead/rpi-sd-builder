FROM debian
MAINTAINER "vlad.fratila@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    bash \
    bc \
    binutils \
    build-essential \
    bzip2 \
    cpio \
    g++ \
    gcc \
    git \
    gzip \
    locales \
    libncurses5-dev \
    libdevmapper-dev \
    libsystemd-dev \
    make \
    mercurial \
    whois \
    patch \
    perl \
    python \
    rsync \
    sed \
    tar \
    vim \
    unzip \
    wget \
    bison \
    flex \
    libssl-dev \
    libfdt-dev

RUN locale-gen en_US.utf8 && mkdir -p /opt/buildroot && mkdir -p /opt/output && mkdir -p /opt/input
WORKDIR /opt/buildroot
VOLUME /opt/output
RUN git clone https://github.com/buildroot/buildroot.git .
ENV TARGET_NAME="mobot-rpi0w_defconfig"

CMD "make O=/opt/output BR2_EXTERNAL=/opt/input/ $TARGET_NAME && make O=/opt/output BR2_EXTERNAL=/opt/input/"
