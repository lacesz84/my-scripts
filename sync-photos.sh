#!/bin/sh

find /media/usb/DCIM/ -type f -exec cp {} /home/laci/drive/sony/ \;
find /media/usb/DCIM/ -type f -exec sudo rm {} \;
