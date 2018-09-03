#!/usr/bin/env bash

declare -A good
declare -A bad

# get values from options
# which are either -g={value} or --good={value}
# and -b={value} or --bad={value}
# can take multiple but only handling for 1 (for now at least)
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
    *)

    ;;
esac
done

if [[ -n ${GOOD} ]]; then
    echo "not empty" ${GOOD}
    echo good[goodemoji]=${GOOD} >> emoda
fi

if [[ -n ${BAD} ]]; then
    echo "not empty" ${BAD}
    echo bad[bademoji]=${BAD} >> emoda
fi
