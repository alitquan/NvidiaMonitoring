#!/bin/bash

tight=$(sudo pacman -S --needed android-tools 2>&1)
already="is nothing to do" 

# trim leading and trailing spaces from the output 
tight=$(echo "$tight" | xargs)

if echo "$tight" | grep -qi "$already"; then
    echo 
else
    echo "$tight"
fi

# config info
if [[ ! -v NVIDIA_IP ]]; then
    echo -n "IP Address of the Shield:  "
    read NVIDIA_IP
fi

if [[ ! -v NVIDIA_PORT ]]; then
    echo -n "Port of the Shield:  "
    read NVIDIA_PORT
fi


# confirmation
echo -e "ADB will begin to monitor the address $NVIDIA_IP:$NVIDIA_PORT"
echo
echo -n "Would you like to monitor the metrics at this socket using adb [y]/n? " 
read monitorq
monitorq=$(echo $monitorq | tr '[:upper:]' '[:lower:]')

if [ "$monitorq" == "y" ] || [ "$monitorq" == "yes" ] || [ -z "$monitorq" ]; then
    adb connect "$NVIDIA_IP:$NVIDIA_PORT" 
    echo 
else
    echo "Not a valid choice" 
    exit 0 
fi

devices=$(adb devices) 
if [ -z "$devices" ]; then
    echo -e "Displaying devices..."
    echo -e $devices
else 
    echo "No devices located"
fi
echo 

