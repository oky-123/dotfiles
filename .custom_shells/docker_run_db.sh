#!/bin/sh

# Run test database
function docker_run_db() {
  docker run --name ${1:-test-db-$RANDOM} --rm -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=test -p 3307:3306 -d mysql:${2:-8}
}

docker_run_db $1 $2
