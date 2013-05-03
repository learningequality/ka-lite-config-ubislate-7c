echo 'ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", RUN+="'`pwd`'/configure.sh"' > /etc/udev/rules.d/90-tablet-config.rules
