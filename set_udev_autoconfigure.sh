ln -s `pwd`/configure.sh /usr/local/bin/autoconfigure_ubislate.sh
echo 'ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTRS{idProduct}=="0003", RUN+="sh /usr/local/bin/autoconfigure_ubislate.sh' > /etc/udev/rules.d/90-tablet-config.rules
