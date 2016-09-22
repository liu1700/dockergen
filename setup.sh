#!/bin/bash

WORK_PATH=`pwd`

DOCKER_FILE_PATH="dockerfiles"
DOCKER_FILE_NAME="Dockerfile"

cd $WORK_PATH
if [ ! -d $DOCKER_FILE_PATH ]; then
	mkdir $DOCKER_FILE_PATH
fi

if [ ! -d $CONTINER_FILE_PATH ]; then
	mkdir $CONTINER_FILE_PATH
fi

function generate {
	cd $DOCKER_FILE_PATH
	echo "generate dockerfile $1 in `pwd`"
	if [ ! -d "$1" ]; then
		mkdir "$1"
		cd "$1"
		touch $DOCKER_FILE_NAME
	else
		echo "Dockerfile exist"
	fi
}

function build {
	echo "$1"
	echo "start build $1"
	cd $DOCKER_FILE_PATH/$1/
	docker build -f $DOCKER_FILE_NAME .
}

if [ "$1" == "" ]; then
	echo "Please input some options"
	echo "'gen newdocker' for construct new Dockerfiles and Docker Build folder"
	echo "This cmd will create a folder named 'newdocker' in dockerfiles folder and continers folder"
	echo "'build newdocker' will take dockerfiles from dockerfiles/newdocker"
elif [ "$1" == "gen" ]; then
	generate "$2"
elif [ "$1" == "build" ]; then
	build "$2"
else
	echo "What? run script directly for help"
	exit 0
fi

exit 0