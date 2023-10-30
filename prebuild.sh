#!/bin/bash
#
# Buildroot pre-build script
#
cd /buildroot

# Pythonパッケージの追加
yes | ./utils/scanpypi usb python-usbtmc
