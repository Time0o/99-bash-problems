#!/bin/bash

# duplicate the elements of a list a given number of times

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list_index args[@]

duplicated=()
for elem in "${list[@]}"; do
    for _ in $(seq $2); do
        duplicated+=("$elem")
    done
done

echo "$(format_list duplicated[@])"
