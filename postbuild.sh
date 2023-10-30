#!/bin/bash
#
# Buildroot post-build script
#

# distディレクトリを一覧表示
echo "contents of distribution directory"
apt-get -y install tree
tree -L 2 /dist

# キャッシュを軽量化するため、不要なファイルを削除する
echo "remove files other than host tools..."
ls -1a /dist/build | sed "/^host-/d" | sed "/^\./d" | xargs -i rm -rf "/dist/build/{}"
rm -rf /dist/images /dist/target
