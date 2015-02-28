#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/nodejs/build.sh && /src/nodejs/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/nodejs/variables.sh && /src/nodejs/run.sh"
    ;;
esac
