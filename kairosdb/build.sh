#!/bin/bash
_kairosdb_version=$1
_kairosdb_tag=$2
_release_build=false

if [ -z "${_kairosdb_version}" ]; then
	source KAIROSDB_VERSION
	_kairosdb_version=$KAIROSDB_VERSION
	_kairosdb_tag=$KAIROSDB_VERSION
	_release_build=true
fi

echo "KAIROSDB_VERSION: ${_kairosdb_version}"
echo "DOCKER TAG: ${_kairosdb_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg KAIROSDB_VERSION=${_kairosdb_version} --tag "stakater/kairosdb:${_kairosdb_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker build --build-arg KAIROSDB_VERSION=${_kairosdb_version} --tag "stakater/kairosdb:latest"  --no-cache=true .
fi
