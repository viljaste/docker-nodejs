#!/usr/bin/env bash

case "$1" in
  install)
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

    $CONTEXT/node.sh install
    ;;
  *)
    sudo docker run --rm -i -t -v $(pwd):/app node "${@}"
    ;;
esac
