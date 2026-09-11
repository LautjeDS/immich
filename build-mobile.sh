#!/bin/bash

cd mobile
build(){
  mise //mobile:build:android-apk
}
if build; then
  adb install build/app/outputs/flutter-apk/app-release.apk
  adb shell device_config override mediaprovider allowed_cloud_providers "com.google.android.apps.photos.cloudpicker app.alextran.immich.lautje"
fi
