#!/bin/bash

# find the k'th element of a list

rnumber="^(0|[1-9][[:digit:]]*)$"

if [ $# -ne 2 ] || [[ ! "$2" =~ $rnumber ]]; then
    >&2 echo "usage: $(basename $0) LIST K"
    exit 1
fi

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

if ! parse_list "$1"; then
    exit 2
fi

if [ $2 -ge ${#list[@]} ]; then
    >&2 echo "index out of range"
    exit 3
fi

echo "${list[$2]}"
