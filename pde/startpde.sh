#!/usr/bin/bash

containerName="my-pde"

check_image () {
    dockerImage=$(docker images | grep $containerName)
    if [ -n "$dockerImage" ]; then
        return 1
    else 
        return 0
    fi
}

check_image
if [ $? -eq 0 ]; then
    cd $HOME/projects/dotfiles && docker build -t $containerName .
fi

digIn () {
    docker exec -it "$containerName" /bin/zsh
    exit 0
}

start_container () {
    activeContainer=$(docker ps | grep "$containerName")
    if [ -n "$activeContainer" ]; then
        echo "$activeContainer"
        echo "Getting into active container"
        sleep 1
        digIn
    else
        inactiveContainer=$(docker ps -a | grep "$containerName")
        if [ -n "$inactiveContainer" ]; then
            echo "Activating existing container...."
            docker start "$containerName"
            sleep 5
            digIn
        else 
            echo "Spinning up a fresh container"
            docker run --name "$containerName" -it --mount src="$HOME/projects",target=/root/projects,type=bind "$containerName" /bin/zsh && digIn
        fi
    fi
}

start_container

