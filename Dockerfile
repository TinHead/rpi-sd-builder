FROM alpine/alpine

ARG BUIDROOT_VERSION="2019.02.6"

#extra stuff for buildroot
RUN apk add cpio bc curl
# get buildroot tarball
RUN curl https://buildroot.org/downloads/buildroot-${BUIDROOT_VERSION}.tar.bz2 -o /usr/local/buildroot-${BUIDROOT_VERSION}.tar.bz2
# extract to workir
RUN tar jxvf /usr/local/buildroot-${BUIDROOT_VERSION}.tar.bz2 -C /usr/local
# add aour stuff and configs
COPY . /usr/local/rpi-sd-builder
# build the toolchain with our config
RUN cd /usr/local/buildroot-${BUIDROOT_VERSION}; make  BR2_EXTERNAL=/usr/local/rpi-sd-builder bot-rpi0w_defconfig 
RUN cd /usr/local/buildroot-${BUIDROOT_VERSION}; FORCE_UNSAFE_CONFIGURE=1 make BR2_EXTERNAL=/usr/local/rpi-sd-builder V=0 toolchain 
RUN cd /usr/local/buildroot-${BUIDROOT_VERSION}; FORCE_UNSAFE_CONFIGURE=1 make BR2_EXTERNAL=/usr/local/rpi-sd-builder V=0
# Clean the downloads
RUN rm -fr /usr/local/buildroot-${BUIDROOT_VERSION}/dl/*
RUN rm /usr/local/buildroot-${BUIDROOT_VERSION}.tar.bz2
