#!/usr/bin/env bash

case "$1" in
  build)
    sudo apt-get install -y curl

    curl -sSL https://get.docker.io/ubuntu/ | sudo bash

    sudo docker build -t fenomen .

    sudo apt-get install -y realpath

    sudo cp $(realpath -s $0) /usr/local/bin/node
    ;;
  update)
    sudo docker rmi node

    CONTEXT=$(mktemp  -d)

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git $CONTEXT

    $CONTEXT/node.sh build
    ;;
  *)
    SCRIPT_PATH=$(realpath -s $1)

    set -- "${@:1:2}" $(basename $SCRIPT_PATH) "${@:4}"

    sudo docker run --rm -i -t -v $(dirname $SCRIPT_PATH):/app node "${@}"
    ;;
esac
