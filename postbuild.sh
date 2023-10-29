#!/bin/bash
#
# Buildroot post-build script
#

# キャッシュを軽量化するため、不要なファイルを削除する
ls -1a /dist/build | sed "/^host-/d" | sed "/^\./d" | xargs -i rm -rf "/dist/build/{}"
rm -rf /dist/images /dist/target

# 残ったディレクトリを一覧表示
apt-get -y install tree
tree -L 2 /dist
