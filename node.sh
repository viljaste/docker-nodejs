#!/usr/bin/env bash

IMAGE=simpledrupalcloud/node
SCRIPT_PATH=$(realpath -s $0)

OPTIONS_BUILD=0

install() {
  sudo apt-get install -y curl

  curl -sSL https://get.docker.io/ubuntu/ | sudo bash

  if [ "${OPTIONS_BUILD}" -eq 1 ]; then
    sudo docker build -t ${IMAGE} $(dirname ${SCRIPT_PATH})
  else
    sudo docker pull ${IMAGE}
  fi

  sudo apt-get install -y realpath

  sudo cp ${SCRIPT_PATH} /usr/local/bin/node
}

update() {
  sudo docker rmi ${IMAGE}

  CONTEXT=$(mktemp  -d)

  git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git $CONTEXT

  if [ "${OPTIONS_BUILD}" -eq 1 ]; then
    $CONTEXT/node.sh -b install
  else
    $CONTEXT/node.sh install
  fi
}

for option in "${@}"; do
  case "${option}" in
    -b|--build)
      OPTIONS_BUILD=1
      ;;
  esac
done

for option in "${@}"; do
  case "${option}" in
    install)
      install
      ;;
    update)
      update
      ;;
    *)
      SCRIPT_PATH=$(realpath -s $1)

      set -- "${@:1:2}" $(basename $SCRIPT_PATH) "${@:4}"

      sudo docker run --rm -i -t -v $(dirname $SCRIPT_PATH):/app simpledrupalcloud/node "${@}"
      ;;
  esac
done
