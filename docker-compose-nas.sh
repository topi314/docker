#!/usr/bin/env bash

export PARAMS=${@}
find . -maxdepth 1 -mindepth 1 -type d \( -iname "*" ! -iname "mailserver" ! -iname "wireguard-server" ! -name ".git" \) -print0 | xargs -0 -I{} sh -c 'cd "{}" && docker compose ${PARAMS}'
