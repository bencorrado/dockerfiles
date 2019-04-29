#!/usr/bin/env bash
# Wirepas

README_TEMPLATE="README.template"
README="README.md"

function get_tags
{

    IMAGE="$1"
    TAGS=$(wget -q https://registry.hub.docker.com/v1/repositories/"${IMAGE}"/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}')
}


function write_tags
{
    echo -e "\\nimage: [${IMAGE}](https://hub.docker.com/r/wirepas/${IMAGE})" > tags.gen
    echo -e "\\ntags:" >> tags.gen
    for tag in ${TAGS}
    do
        echo -e "\\n  -  ${tag}" >> tags.gen
    done
    echo -e "\\n"
}

function update_architecture
{
    ARCH="${1}"
    if [[ ${ARCH} == "" ]]
    then
        get_tags "wirepas/gateway"
    else
        get_tags "wirepas/gateway-${ARCH}"
    fi
    write_tags

    sed -i -ne "/<!--- START${ARCH} --->/ {p; r tags.gen" -e ":a; n; /<!--- END${ARCH} --->/ {p; b}; ba}; p" "${README_TEMPLATE}"
}


cp ${README_TEMPLATE} ${README_TEMPLATE}.tmp
update_architecture "x86"
update_architecture "rpi"
update_architecture ""
cp ${README_TEMPLATE} ${README}
mv ${README_TEMPLATE}.tmp ${README_TEMPLATE}