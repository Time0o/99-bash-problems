#!/bin/bash

# find the second to last element in a list

if [ $# -ne 1 ]; then
    >&2 echo "usage: $(basename $0) LIST"
    exit 1
fi

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

if ! parse_list "$1"; then
    exit 2
fi

if [ ${#list[@]} -le 1 ]; then
    >&2 echo "list must contain at least two elements"
    exit 3
fi

echo "${list[-2]}"
