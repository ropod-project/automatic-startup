#!/bin/bash

platform=$1
if [ -z "$platform" ]; then
    echo "Restarts all services for a specified platform (robot or black box)"
    echo "Usage: ./restart_services.bash [platform]"
    echo "       where platform can be either robot or black-box"
else
    echo 'Restarting services...';
    service_files=$(ls $platform);
    for service in $service_files; do
        echo 'Restarting' $service;
        sudo systemctl restart $service
    done
    echo 'All services have been restarted';
fi
