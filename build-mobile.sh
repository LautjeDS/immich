#!/bin/bash

# Don't need to run mise checkout since the stuff it would call is called when building anyway
mise //mobile:install

cd mobile || exit
mise exec -- flutter config --jdk-dir "$(mise where java)"

build(){
  mise //mobile:build:android-apk
}

if build; then
  adb install build/app/outputs/flutter-apk/app-release.apk
  adb shell device_config override mediaprovider allowed_cloud_providers "com.google.android.apps.photos.cloudpicker,app.alextran.immich.lautje"
fi
