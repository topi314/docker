#!/usr/bin/env bash
##
## Title:                     docker-compose-all.sh
## Description:               Shell script to run docker-compose in all subfolders
## Author:                    B. van wetten
## Created date:              16-03-2020
## Updated date:              16-03-2020
## Version:                   0.1.0
## GitHub Gist:               https://gist.github.com/6067fdc65e96b6255e68e87c927c7cc7
##
## Usage:                     docker-compose-all.sh [docker-compose parameters]

# Shell utilities
declare -x SH=$(which sh); [[ $? != 0 ]] && echo "Command 'sh' not found" >&2 && exit 1
declare -x FIND=$(which find); [[ $? != 0 ]] && echo "Command 'find' not found" >&2 && exit 1
declare -x DOCKER=$(which docker); [[ $? != 0 ]] && echo "Command 'docker' not found" >&2 && exit 1

function mexec()
{
    export PARAMS="${@}"
    ${FIND} . -maxdepth 1 -mindepth 1 -type d -print0 | xargs -0 -I{} ${SH} -c 'cd "{}" && docker compose ${PARAMS}'
}

mexec ${@}
