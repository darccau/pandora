#!/usr/bin/env bash


if [[ -z ${1} ]]; then
    echo -e "[!] CTF name was not provided"
    exit 1
fi

ctf_name=${1}

docker create -v ${ctf_name}_storage:/root/work --name ${ctf_name}_data duardopx/pandora

volume_name=`docker inspect ${ctf_name}_data | jq '.[].Mounts[].Name' | sed 's/\"//g'`

docker run -it \
    -h ${ctf_name} \
    -d \
    --security-opt seccomp:unconfined \
    --name ${ctf_name} \
    --volumes-from ${ctf_name}_data \
    duardopx/pandora

if [[ -d dotfiles ]]; then
    cd dotfiles

    if [[ -f dotfiles.tar ]]; then
        rm -f dotfiles.tar
    fi

    for i in .*; do
        if [[ ! ${i} == '.' && ! ${i} == ".." ]]; then
            tar rf dotfiles.tar ${i}
        fi
    done

    cd - > /dev/null 2>&1
    cat dotfiles/dotfiles.tar | docker cp - ${ctf_name}:/root/
    rm -f dotfiles/dotfiles.tar
else
    echo -e "[!] No directory found, the dotfiles will not be included in container!"
fi

cat << eof > ${ctf_name}-stop.sh
#!/bin/bash
echo "Removing ${ctf_name} containers and volumes"
docker stop ${ctf_name}
docker rm ${ctf_name}
docker rm ${ctf_name}_data
docker volume rm ${volume_name}
rm -f dotfiles.tar
rm -f ${ctf_name}-stop.sh
eof

chmod 755 ${ctf_name}-stop.sh

docker attach ${ctf_name}
