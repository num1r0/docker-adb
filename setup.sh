#!/usr/bin/env bash

# AUTHOR: num1r0 <Sveatoslav Persianov>

set -o errexit
set -o nounset
set -o pipefail

# Get phone model
echo "Enter your phone brand name or full path to USB device (ex.:/dev/bus/usb/001/007):"
read phone_or_path
if [[ $phone_or_path != *[/]* ]]
then
	path=`lsusb | grep -i ${phone_or_path} | awk -F' ' '{print $2"/"$4}' | sed 's/://g'`
	phone_or_path="/dev/bus/usb/"${path}
fi

# Build docker image
docker build -t adb/alpine:latest .
echo ""
echo "Building docker image...OK"

# Create alias for 'adb' command
alias_command="docker run --rm -it --device="${phone_or_path}" --name adbhost adb/alpine"
echo "alias adb='${alias_command}'" >> ~/.bashrc
source ~/.bashrc
echo ""
echo "Creating alias for 'adb' command...OK"
