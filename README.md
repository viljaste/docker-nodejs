docker-node
===========

Build the Docker image
----------------------

    $ docker build -t node http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git

Run the Docker container

    $ docker run --rm -i -t -v $(pwd):/context node app.js