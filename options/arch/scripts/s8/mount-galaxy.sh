#!/usr/bin/env bash

# $ adb devices
# List of devices attached
# ce0917199c15b0700d      device
verify_galaxys8_connected() {
  adb devices | grep ce0917199c15b0700d > /dev/null
  if [ $? -eq 0 ]; then
    echo "Galaxy S8 Connected!"
  else
    echo "Galaxy S8 DISCONNECTED! Aborting."
    exit 1
  fi
}

verify_galaxys8_locked() {
  string='SCREEN_BRIGHT_WAKE_LOCK'
  adb shell dumpsys power | grep $string

  if [ $? -eq 0 ]; then
    echo "Device is Locked. Unlock it first!"
    exit 1
  else
    echo "Device is unlocked!"
  fi
}

verify_galaxys8_connected
verify_galaxys8_locked

MOUNT_POINT=~/s8
mkdir -p $MOUNT_POINT
aft-mtp-mount $MOUNT_POINT

if [ $? -eq 0 ]; then
  echo "Command succeeded."
else
  echo "Command Failed. Verify Phone Permission Dialog and try again."
  exit 1
fi