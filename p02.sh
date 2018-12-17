#!/bin/bash

# find the second to last element in a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list args[@]

if [ ${#list[@]} -le 1 ]; then
    >&2 echo "list must contain at least two elements"
    exit 3
fi

echo "${list[-2]}"
