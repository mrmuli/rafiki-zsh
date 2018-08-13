#!/usr/bin/env bash


autoload -Uz is-at-least
function cmd_args() {

    for i in "$@"
    do
    case $i in
        -g=* | --good=*)
        GOOD="${i#*=}"
        shift
        ;;
        -b=* | --bad=*)
        BAD="${i#*=}"
        shift
        ;;
        --default)
        DEFAULT=YES
        shift
        ;;
        *)

        ;;
    esac
    done
    echo "GOOD = ${GOOD}"
    echo "BAD = ${BAD}"
    if [[ - $1 ]]; then
        echo "not an argument try again"
    fi
}

