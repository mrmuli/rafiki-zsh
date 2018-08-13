#!/usr/bin/env bash

declare -A good
declare -A bad

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
        # unknown option
    ;;
esac
done
echo "GOOD = ${GOOD}"
echo "BAD = ${BAD}"

good[${GOOD}]=goodemoji

bad[${BAD}]=bademoji
