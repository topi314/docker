#!/usr/bin/env bash

export PARAMS=${@}
find . -maxdepth 1 -mindepth 1 -type d \( -iname "mailserver" ! -iname "wireguard-server" \) -print0 | xargs -0 -I{} sh -c 'cd "{}" && docker compose ${PARAMS}'
