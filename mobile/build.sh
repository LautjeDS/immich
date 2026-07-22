#!/bin/bash
build(){
  mise //mobile:build:android-apk
}
if build; then
  adb install build/app/outputs/flutter-apk/app-release.apk
fi
