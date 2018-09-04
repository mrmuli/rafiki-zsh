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

# check for input in arguments (Good or Bad values) 
# if they are not empty add them to the arrays (good after [G] bad after [B])
if [[ -n ${GOOD} ]]; then
    for val in $(grep [G] emoda); do
        sed -i "s/\[G]/[G]\ngood[goodemoji]=${GOOD}/" emoda
        echo "added ${GOOD} as a GOOD emoji" 
    done
fi

if [[ -n ${BAD} ]]; then
    for val in $(grep [B] emoda); do
        sed -i "s/\[B]/[B]\nbad[bademoji]=${BAD}/" emoda
        echo "added ${BAD} as a BAD emoji"
    done
fi
