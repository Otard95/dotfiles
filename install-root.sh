#!/bin/bash

sudo mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.$(date +%s).BAK
sudo cp ./lightdm.conf /etc/lightdm/
sudo mv /etc/lightdm/ukui-greeter.conf /etc/lightdm/ukui-greeter.conf.$(date +%s).BAK
sudo cp ./ukui-greeter.conf /etc/lightdm/
sudo mv /usr/share/ukui-greeter/images/wp_blurred.jpg /usr/share/ukui-greeter/images/wp_blurred.jpg.$(date +%s).BAK
sudo cp ./wp_blurred.jpg /usr/share/ukui-greeter/images/
