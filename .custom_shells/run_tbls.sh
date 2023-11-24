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
  mysql -uroot -ppassword -h127.0.0.1 -P3307 test < $1

  # dsn: postgres://dbuser:dbpass@localhost:5432/dbname
  # dsn: root:password@tcp(localhost:3306)/?charset=utf8&parseTime=true
  tbls --dsn mysql://root:password@127.0.0.1:3307/test doc --force
  docker stop $NAME
}

run_tbls_on_docker $1 $2
