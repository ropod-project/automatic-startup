#!/bin/bash

platform=$1
if [ -z "$platform" ]; then
    echo "Disables all services for a specified platform (robot or black box) and removes the service files from /etc/systemd/system"
    echo "Usage: ./disable_services.bash [platform]"
    echo "       where platform can be either robot or black-box"
else
    echo 'Disabling services...';
    service_files=$(ls $platform);
    for service in $service_files; do
        echo 'Disabling' $service;
        sudo systemctl disable $service

        echo 'Removing' $service 'from /etc/systemd/system';
        sudo rm /etc/systemd/system/$service
    done
    echo 'Services disabled';
fi
