#!/bin/bash

platform=$1
if [ -z "$platform" ]; then
    echo "Copies all service files for a specified platform (robot or black box) to /etc/systemd/system and enables the services"
    echo "Usage: ./setup_services.bash [platform]"
    echo "       where platform can be either robot or black-box"
else
    echo 'Copying service files to /etc/systemd/system...';
    sudo cp $platform/* /etc/systemd/system/
    echo 'Service files copied successfully';

    echo 'Enabling services...';
    service_files=$(ls $platform);
    for service in $service_files; do
        echo 'Enabling' $service;
        sudo systemctl enable $service
    done
    echo 'Services enabled successfully';
fi
