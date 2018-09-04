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
# if they are not empty add them to the list (good after [G] bad after [B])
if [[ -n ${GOOD} ]]; then
    echo "GOOD value not empty" ${GOOD}
    for val in $(grep [G] emoda); do
        # echo good[goodemoji]=${GOOD} >> emoda
        echo -e "good[goodemoji]=${GOOD}\n$(cat emoda)" > emoda
    done
fi

if [[ -n ${BAD} ]]; then
    echo "BAD value not empty" ${BAD}
    for val in $(grep [B] emoda); do
        #echo bad[bademoji]=${BAD} >> emoda
        echo -e "bad[bademoji]=${BAD}\n$(cat emoda)" > emoda
    done
fi
