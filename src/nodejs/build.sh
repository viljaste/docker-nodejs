#!/usr/bin/env bash

puppet apply --modulepath=/src/nodejs/build/modules /src/nodejs/build/build.pp
