# Sonic Mania Decompilation: Android Build Guide

This is a guide to building your own Sonic Mania APK for Android. This guide is currently intended for Windows 10/Windows 11 users only. An Android build guide for Linux is coming soon.

## Instructions (Windows)

1. Install Git from [here](https://gitforwindows.org/) if you don't already have it.
2. Install Android Studio from [here](https://developer.android.com/studio) if you don't already have it.
3. Download the **Sonic Mania Android Build Helper** script from [here](https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/raw/main/ManiaAndroidBuildHelper.bat). This script will automate a lot of the difficult parts of the Android build process to make it easier for you.
4. Place `ManiaAndroidBuildHelper.bat` on the root of your C: drive. This means that it should not be inside any other folders other than `C:\`.
5. Right click `ManiaAndroidBuildHelper.bat` and click "Run as administrator". This is very important. ***If you do not select Run as administrator, the script will not work.***
6. Follow the directions in the command line window.
7. Once the script tells you it's completed, open Android Studio, click File in the navigation bar at the top, click Open, navigate to `C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\android` and click OK. Android Studio will then run some automatic actions in the background to import the project.
8. You may or may not see a prompt from Android Studio to install an NDK. If you do see a prompt, follow through with it and install the NDK. Otherwise, continue to the next step.
9. Click Build in the navigation bar, and click Make Project.
10. If all goes right, then your assembled APK should be located in `C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\android\app\build\outputs\apk\debug`.

## Support

If you need any support, please feel free to reach out to the Retro Engine Modding Server on Discord. Invite: http://dc.railgun.works/retroengine
