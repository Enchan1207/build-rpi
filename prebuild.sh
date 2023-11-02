#!/bin/bash
#
# Buildroot pre-build script
#
cd /buildroot

# Pythonパッケージの追加
yes | ./utils/scanpypi usb python-usbtmc

# 強制的にglibc utilを埋め込む
echo "BR2_PACKAGE_GLIBC_UTILS=y" >> /dist/.config
