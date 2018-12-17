#!/bin/bash

# remove consecutive duplicates from a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list args[@]

compressed=()
for elem in "${list[@]}"; do
    [ ! -z "$last" ] && [ "$elem" = "$last" ] && continue

    compressed+=("$elem")

    last="$elem"
done

echo "$(format_list compressed[@])"
