#!/bin/bash
#
# Build utility script for local-environment build
#

# Prepare directories for Buildroot
mkdir -p ./dist
mkdir -p ./cache

# Copy Buildroot configuration file
cp buildroot.config ./dist/.config

# Launch Buildroot container
containerName="enchan1207/buildroot"
containerID=$(docker run -itd -v ./dist:/dist -v ./cache:/cache -v ./rfs:/rfs $containerName)
echo "Buildroot container $containerName launched (ID: $containerID)"

# Build image
logFileName=build-`date +%s`.log
docker exec $containerID make O=/dist 2>&1 | tee $logFileName | sed -rn "/>>> /p"
if [ $? -ne 0 ]; then
    echo "Build failed. log file is saved at $logFileName"
    exit 1
fi
echo "Succeeded."
