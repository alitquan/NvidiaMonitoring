#!/bin/bash

sudo pacman -S --needed android-tools
echo

if [[ ! -v NVIDIA_IP ]]; then
    echo -n "IP Address of the Shield:  "
    read NVIDIA_IP
fi

if [[ ! -v NVIDIA_PORT ]]; then
    echo -n "Port of the Shield:  "
    read NVIDIA_PORT
fi

echo -e "ADB will begin to monitor the address $NVIDIA_IP:$NVIDIA_PORT"
echo
echo -n "Would you like to monitor the metrics at this socket using adb [y]/n? " 
read monitorq
monitorq=$(echo $monitorq | tr '[:upper:]' '[:lower:]')

if [ "$monitorq" == "y" ] || [ "$monitorq" == "yes" ] || [ -z "$monitorq" ]; then
    adb connect "$NVIDIA_IP:$NVIDIA_PORT" 
    echo "Continuing .."  
    echo 
else
    exit 0 
fi

devices=$(adb devices) 
echo -e "Displaying devices..."
echo 
echo -e $devices




