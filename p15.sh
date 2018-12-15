#!/bin/bash

# duplicate the elements of a list a given number of times

rnumber="^(0|[1-9][[:digit:]]*)$"

if [ $# -ne 2 ] || [[ ! "$2" =~ $rnumber ]]; then
    >&2 echo "usage: $(basename $0) LIST K "
    exit 1
fi

loc="$(dirname "$(readlink -f "$0")")"

. "$loc/util/list.sh"

if ! parse_list "$1"; then
    exit 2
fi

duplicated=()
for elem in "${list[@]}"; do
    for _ in $(seq $2); do
        duplicated+=("$elem")
    done
done

echo "$(format_list duplicated[@])"
