#!/bin/bash

# remove consecutive duplicates from a list

if [ $# -ne 1 ]; then
    >&2 echo "usage: $(basename $0) LIST"
    exit 1
fi

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

if ! parse_list "$1"; then
    exit 2
fi

compressed=()
for elem in "${list[@]}"; do
    [ ! -z "$last" ] && [ "$elem" = "$last" ] && continue

    compressed+=("$elem")

    last="$elem"
done

echo "$(format_list compressed[@])"
