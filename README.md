docker-node
===========

Run the container
-----------------

    sudo docker run \
      -v $(pwd):/src \
      --rm \
      -i \
      -t \
      simpledrupalcloud/node

Build the image yourself
------------------------

    sudo docker build -t simpledrupalcloud/node http://git.simpledrupalcloud.com/simpledrupalcloud/docker-node.git