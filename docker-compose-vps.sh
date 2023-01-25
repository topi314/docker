#!/usr/bin/env bash

export PARAMS=${@}
echo -e './mailserver\0./wireguard-server\0' | xargs -0 -I{} sh -c 'cd "{}" && docker compose ${PARAMS}'
