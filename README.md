
[![Build Status](https://cloud.drone.io/api/badges/TinHead/rpi-sd-builder/status.svg)](https://cloud.drone.io/TinHead/rpi-sd-builder)

# RPI buildroot based image

This is a RPI Zero W (rpi3 in some future) buildroot based linux build system.
Currently a push to this repo will trigger a build which if all goes well spit's out a ready to burn SD card image.

## Why?

Because I find other distros slow on the RPI's and I find buildroot easy to understand.

## What's on it?

The image contains the minimal requirements for a running system and some extras (list below might change).

- rpi0w firmware and kernel from raspberry github
- systemd as init system
- docker
- wpa-supplicant and tools to get wifi going 

Wifi is setup as Access Point by default:

- network ssid: bot
- network pass: bot123456
_
There is a script which runs on boot and checks for /boot/wifi_network_conf file which should look like:

```text
network: mynetwork
pass: mynetworkpass
```

If the file is found the network is added to wpa-supplicant and AP is disabled.

I intend to create a collection of docker images to run on it see how it goes.