#!/usr/bin/env bash

puppet apply --modulepath=/src/nodejs/run/modules /src/nodejs/run/run.pp

cd /nodejs

npm install

/usr/bin/supervisord
