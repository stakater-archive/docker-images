#!/bin/bash

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

for dir in $SCRIPT_HOME/../images/*/
do
	cd $dir &&
	image_name=${PWD##*/} && # to assign to a variable
	echo "Building $image_name from $dir" &&
	docker build -t stakater/$image_name .
done