#!/usr/bin/env bash

FILE="./build.sh"

for d in */
do
    cd "${d}" || exit 1
    if [[ -f "$FILE" ]]
    then
        ./build.sh
    fi
    cd ..

done


