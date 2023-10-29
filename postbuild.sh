#!/bin/bash
#
# Buildroot post-build script
#

# キャッシュを軽量化するため、不要なファイルを削除する
ls -1a /dist/build | sed "/^host-/d" | sed "/^\./d" | xargs -i rm -rf "/dist/build/{}"
rm -rf /dist/images /dist/target

ls -la /dist/build
