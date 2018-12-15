#!/bin/bash

# reverse a list

if [ $# -ne 1 ]; then
    >&2 echo "usage: $(basename $0) LIST"
    exit 1
fi

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

if ! parse_list "$1"; then
    exit 2
fi

for ((i = 0; i < $(( (${#list[@]} - 1) / 2 )); ++i)); do
    j=$(( ${#list[@]} - i - 1 ))

    tmp="${list[i]}"

    list[$i]="${list[$j]}"
    list[$j]="$tmp"
done

echo "$(format_list list[@])"
