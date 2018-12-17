#!/bin/bash

# find the number of elements in a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list args[@]

echo "${#list[@]}"
