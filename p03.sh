#!/bin/bash

# find the k'th element of a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list_index args[@]

if [ $2 -ge ${#list[@]} ]; then
    >&2 echo "index out of range"
    exit 3
fi

echo "${list[$2]}"
