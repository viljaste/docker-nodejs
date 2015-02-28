#!/usr/bin/env bash

MONGODB_HOST="$(echo "${MONGODB_PORT}" | sed 's/tcp:\/\///')"

export FACTER_MONGODB_HOST="$(echo "${MONGODB_HOST}" | cut -d ":" -f1)"
export FACTER_MONGODB_PORT="$(echo "${MONGODB_HOST}" | cut -d ":" -f2)"
