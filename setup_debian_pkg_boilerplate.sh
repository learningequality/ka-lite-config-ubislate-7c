#!/usr/bin/env bash

VERSION=1.1
PACKAGING_VERSION=1

PKGDIR=ubislate_config_$VERSION-$PACKAGING_VERSION

SRCDIR=`pwd`

# So we can display notifications
export DISPLAY=":0.0"

rm -rf $PKGDIR                  # delete the whole thing first

mkdir $PKGDIR
pushd $PKGDIR > /dev/null

# place our android configuration files in opt/ubislate_config/
CONFIGDIR=opt/ubislate_config/
mkdir -p $CONFIGDIR
pushd $CONFIGDIR > /dev/null

cp $SRCDIR/com.android.browser_preferences.xml .
cp $SRCDIR/wpa_supplicant.conf .
cp $SRCDIR/browser2.db .
cp $SRCDIR/launcher.db .
cp $SRCDIR/configure.sh .
cp $SRCDIR/adb .

popd > /dev/null


# our udev rule goes here
UDEVDIR=etc/udev/rules.d/
mkdir -p $UDEVDIR
pushd $UDEVDIR > /dev/null

cp $SRCDIR/90-tablet-config.rules .

popd > /dev/null

popd > /dev/null # exit out of the packaging directory now

# insert the debian package metadata dir
DEBIANDIR=$PKGDIR/DEBIAN/
mkdir $DEBIANDIR
cp $SRCDIR/control $DEBIANDIR/

# build the whole thing
dpkg-deb --build $PKGDIR
