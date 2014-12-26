#!/usr/bin/env bash

puppet apply --modulepath=/src/run/modules /src/run/run.pp

mkdir -p /nodejs/data

cd /nodejs/data

npm install
npm start
