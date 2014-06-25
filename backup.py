#!/usr/bin/env python
from __future__ import print_function

import os
import subprocess

BACKUP_DIR = os.path.join(os.getcwd(), 'backup-7cplus')


def main():
    if not os.path.exists(BACKUP_DIR):
        os.makedirs(BACKUP_DIR)

    msg = """Backup the files we're gonna change in the tablet. Assumes we're
    running with sufficient permissions to connect to the tablet. And
    that we also have adb in our path."""

    print(msg)

    # so that we start the adb server with the right permissions
    subprocess.check_call(["adb", "kill-server"])

    subprocess.check_call(["adb",
                           "pull",
                           "/data/data/com.android.browser/shared_prefs/com.android.browser_preferences.xml",
                           os.path.join(BACKUP_DIR, "com.android.browser_preferences.xml")])

    subprocess.check_call(["adb",
                           "pull",
                           "/data/misc/wifi/wpa_supplicant.conf",
                           os.path.join(BACKUP_DIR, "wpa_supplicant.conf")])

    subprocess.check_call(["adb",
                           "pull",
                           "/data/data/com.android.browser/databases/browser2.db",
                           os.path.join(BACKUP_DIR, "browser2.db")])

    subprocess.check_call(["adb",
                           "pull",
                           "/data/data/com.android.launcher/databases/launcher.db",
                           os.path.join(BACKUP_DIR, "launcher.db")])

if __name__ == '__main__':
    main()
