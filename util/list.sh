#!/bin/bash

trim() {
    local tmp="$1"

    tmp="${tmp#"${tmp%%[^[:space:]]*}"}"
    tmp="${tmp%"${tmp##*[^[:space:]]}"}"

    echo -n "$tmp"
}

parse_list() {
    local rsp="[[:space:]]*"
    local relem="[^,[:space:]]+"
    local rlist="^\[$rsp(($relem)?($rsp,$rsp$relem)*)$rsp\]$"

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

parse_args_list() {
    declare -a local_args=("${!1}")

    if [ ${#local_args[@]} -ne 1 ]; then
        >&2 echo "usage: $(basename $0) LIST"
        exit 1
    fi

    if ! parse_list "${local_args[0]}"; then
        exit 2
    fi
}

parse_args_list_index() {
    declare -a local_args=("${!1}")

    if [ ${#local_args[@]} -ne 2 ] || \
       [[ ! "${local_args[1]}" =~  ^(0|[1-9][[:digit:]]*)$ ]]
    then
        >&2 echo "usage: $(basename $0) LIST K"
        exit 1
    fi

    if ! parse_list "${local_args[0]}"; then
        exit 2
    fi
}

format_list() {
    declare -a arr=("${!1}")

    if [ ${#arr[@]} -eq 0 ]; then
        echo -n "[]"

        return 0
    fi

    local res="[${arr[0]}"

    for ((i = 1; i < ${#arr[@]}; ++i)); do
        res="$res, ${arr[i]}"
    done

    echo -n "$res]"
}
