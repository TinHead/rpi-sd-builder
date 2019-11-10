#!/bin/zsh
#check if in /boot we have wifi_network.conf file and act
my_file="/boot/wifi_network_conf"

if [ -f "$my_file" ]; then
    wifi_name=$(cat $my_file|grep "network:"|awk '{print $2}')
    wifi_pass=$(cat $my_file|grep "pass:"|awk '{print $2}')
    wpa_passphrase "$wifi_name" "$wifi_pass" >> /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
    systemctl restart wpa-supplicant@wlan0
    mount -o remount,rw /boot
    rm -f /boot/wifi_network_conf
fi