#!/bin/bash

trim() {
    local tmp="$1"

    tmp="${tmp#"${tmp%%[^[:space:]]*}"}"
    tmp="${tmp%"${tmp##*[^[:space:]]}"}"

    echo -n "$tmp"
}

parse_list() {
    rsp="[[:space:]]*"
    relem="[^,[:space:]]+"
    rlist="^\[$rsp(($relem)?($rsp,$rsp$relem)*)$rsp\]$"

    if [[ "$1" =~ $rlist ]]; then
        IFS=',' read -ra list <<< "${BASH_REMATCH[1]}"

        for ((i = 0; i < ${#list[@]}; ++i)); do
            list[i]="$(trim "${list[i]}")"
        done

        return 0
    else
        >&2 echo "malformed list"

        return 1
    fi
}

format_list() {
    declare -a arr=("${!1}")

    if [ ${#arr[@]} -eq 0 ]; then
        echo -n "[]"

        return 0
    fi

    res="[${arr[0]}"

    for ((i = 1; i < ${#arr[@]}; ++i)); do
        res="$res, ${arr[i]}"
    done

    echo -n "$res]"
}
