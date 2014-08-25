#!/usr/bin/env bash

sudo docker run --rm -t -i -v $(pwd):/src simpledrupalcloud/node "${@}"
