#!/usr/bin/env bash

BUILD=0

for option in "${@}"; do
  case "${option}" in
    -b|--build)
      BUILD=1
      ;;
  esac
done

for option in "${@}"; do
  case "${option}" in
    install)
      sudo apt-get install -y curl

      curl -sSL https://get.docker.io/ubuntu/ | sudo bash

      if [ "${BUILD}" -eq 1 ]; then
        sudo docker build -t simpledrupalcloud/node .
      else
        sudo docker pull simpledrupalcloud/node
      fi

      sudo apt-get install -y realpath

      sudo cp $(realpath -s $0) /usr/local/bin/node
      ;;
    update)
      sudo docker rmi node

      CONTEXT=$(mktemp  -d)

      git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git $CONTEXT

      if [ "${BUILD}" -eq 1 ]; then
        $CONTEXT/node.sh -b install
      else
        $CONTEXT/node.sh install
      fi
      ;;
    *)
      SCRIPT_PATH=$(realpath -s $1)

      set -- "${@:1:2}" $(basename $SCRIPT_PATH) "${@:4}"

      sudo docker run --rm -i -t -v $(dirname $SCRIPT_PATH):/app simpledrupalcloud/node "${@}"
      ;;
  esac
done
