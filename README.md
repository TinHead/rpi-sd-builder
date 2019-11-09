# Mobbot buildroot (WIP)

This is the linux build for the Mobbot.

To build you need to follow the steps below:

- clone buildroot 

git clone git@github.com:buildroot/buildroot.git

- clone this one 

git clone git@gitlab.com:csw-mobot/buildroot-mobbot.git

- from inside the buildroot dir

 make BR2_EXTERNAL=../buildroot-mobbot/ mobbot-rpi0w_defconfig

- if the above works

 make BR2_EXTERNAL=../buildroot-mobbot/
 
- get a coffee 
- when done look for sdcard image in buildroot/output/images/sd-card.img
- burn it to sdcard == profit!
