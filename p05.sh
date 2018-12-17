#!/bin/bash

# reverse a list

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

args=("$@")
parse_args_list args[@]

for ((i = 0; i < $(( (${#list[@]} - 1) / 2 )); ++i)); do
    j=$(( ${#list[@]} - i - 1 ))

    tmp="${list[i]}"

    list[$i]="${list[$j]}"
    list[$j]="$tmp"
done

echo "$(format_list list[@])"
