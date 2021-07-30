#!/usr/bin/env bash
#deploy="false"
deploy="true"

image=ICICI_FS
version=1.0-SNAPSHOT
latest=true

#OPTIONS="--no-cache --force-rm"
#OPTIONS="--no-cache"
#OPTIONS="--force-rm"
OPTIONS=""

docker build ${OPTIONS} -t ICICI/${image}:1.0-SNAPSHOT .
if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
    docker push ICICI/${image}:1.0-SNAPSHOT
    if [ "$latest" == "true" ]; then
        docker tag ICICI/${image}:1.0-SNAPSHOT ICICI/${image}:latest
        docker push ICICI/${image}:latest
    fi
fi