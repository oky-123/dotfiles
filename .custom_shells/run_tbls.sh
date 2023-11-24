#!/bin/sh
# Run tbls on test db
# Usage: run_tbls_on_docker <path to tbls.yml> TAG=<mysql version>

# check if $1 is empty
if [ -z "$1" ]; then
  echo "Usage: $1 <path to tbls.yml>"
  exit 1
fi

# Usage: run_tbls_on_docker <mysql version>
function run_tbls_on_docker() {
  NAME=test-db-$RANDOM
  ~/.custom_shells/docker_run_db.sh $NAME ${2:-8}

  # mysql pingを利用して起動を待つ
  for i in `seq 1 30`;
  do
    mysql -uroot -ppassword -h127.0.0.1 -P3307 -e "select 1" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      break
    fi
    sleep 1
  done

  mysql -uroot -ppassword -h127.0.0.1 -P3307 test < $1

  # dsn: postgres://root:password@127.0.0.1:5432/test
  tbls --dsn mysql://root:password@127.0.0.1:3307/test doc --force -j -t mermaid
  docker stop $NAME
}

run_tbls_on_docker $1 $2
