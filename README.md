docker-node
===========

Install

    CONTEXT=$(mktemp  -d) && sudo apt-get install -y git && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git $CONTEXT && $CONTEXT/node.sh install

Build the Docker image
----------------------

    $ docker build -t node http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git

Run the Docker container

    $ docker run --rm -i -t -v $(pwd):/app node app.js