#!/bin/sh
cd `dirname $0`
sleep 10
notify-send --expire-time=1500 'Ubislate setup' 'Setting up the Ubislate' || true
adb push ./com.android.browser_preferences.xml /data/data/com.android.browser/shared_prefs/com.android.browser_preferences.xml
adb push ./wpa_supplicant.conf /data/misc/wifi/wpa_supplicant.conf
adb push ./browser2.db /data/data/com.android.browser/databases/browser2.db
adb push ./launcher.db /data/data/com.android.launcher/databases/launcher.db
notify-send --expire-time=1500 'Ubislate setup' 'Setting up the Ubislate. Rebooting the Ubislate. Unplug the tablet now!' || true
adb reboot
