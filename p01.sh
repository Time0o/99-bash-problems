#!/bin/bash

# find the last element in a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list args[@]

if [ ${#list[@]} -eq 0 ]; then
    >&2 echo "empty list"
    exit 3
fi

echo "${list[-1]}"
