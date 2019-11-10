[![CircleCI](https://circleci.com/gh/TinHead/rpi-sd-builder.svg?style=svg)](https://circleci.com/gh/TinHead/rpi-sd-builder)

# RPI buildroot based image

This is a RPI Zero W (rpi3 in some future) buildroot based linux build system.
Currently a push to this repo will trigger a build which if all goes well spit's out a ready to burn SD card image.

## What's on it?

The image contains the minimal requirements for a running system and some extras (list below might change).

- rpi0w firmware and kernel from raspberry github
- systemd as init system
- docker
- mjpeg streamer patched for rpi camera
- wpa-supplicant and tools to get wifi going 

There is also a non functional overlay added from a previous project I will reporpose as soon as I know exactly what I want to do :)

I intend to create a collection of docker images to run on it see how it goes.
