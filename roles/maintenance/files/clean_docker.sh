#!/bin/bash

if type "docker" &> /dev/null; then
     echo 'Cleanup Docker'
     docker container prune -f
     docker image prune -f
     docker volume prune -f
     docker network prune -f
fi

if type "docker" &> /dev/null; then
     echo 'Cleanup docker images...'
     docker rmi "$(docker images -q)"
     echo 'Cleanup stopped containers with...'
     docker rm "$(docker container ls -a -q)"
fi

