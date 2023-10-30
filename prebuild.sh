#!/bin/bash
#
# Buildroot pre-build script
#
cd /buildroot

# Pythonパッケージの追加
yes | ./utils/scanpypi opencv-python usb python-usbtmc
