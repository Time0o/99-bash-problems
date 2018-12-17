#!/bin/bash

# duplicate the elements of a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list args[@]

duplicated=()
for elem in "${list[@]}"; do
    duplicated+=("$elem" "$elem")
done

echo "$(format_list duplicated[@])"
