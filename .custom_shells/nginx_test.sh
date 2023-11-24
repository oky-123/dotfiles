#!/bin/sh
# Usage: ./nginx_check.sh [file name...] [version]
# 引数の全てのファイルを`/etc/nginx/conf.d/`にマウントし、`nginx -t`を実行するシェル

# 標準入力を優先して、デフォルトバージョンは1.24
VERSION=${VERSION:-1.24}

# 第一引数がない場合はエラー
if [ $# -eq 0 ]; then
  echo "Error: Please input file name."
  exit 1
fi

# docker run --rm --volume $1:/etc/nginx/conf.d/target.conf nginx:$VERSION nginx -t
# 引数の全てのファイルを`/etc/nginx/conf.d/`にマウントし、`nginx -t`を実行する
volumes=""
for file in $@; do
  volumes="--volume $PWD/$file:/etc/nginx/conf.d/test_$file $volumes"
done
docker run --rm $volumes nginx:$VERSION nginx -t
