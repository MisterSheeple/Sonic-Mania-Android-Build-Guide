# Sonic Mania Android Build Guide

This is a guide to building your own Sonic Mania APK for Android. This build is intended for Windows 10/Windows 11 users only.

1. Install Git from [here](https://gitforwindows.org/) if you don't already have it.
2. Install Android Studio from [here](https://developer.android.com/studio) if you don't already have it.
3. Download the **Sonic Mania Android Build Helper** script from [here](https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/raw/main/ManiaAndroidBuildHelper.bat). This script will automate a lot of the difficult parts of the Android build process.
4. Place ManiaAndroidBuildHelper.bat on the root of your C: drive. This means that it should not be inside any other folders other than `C:\`.
5. Right click ManiaAndroidBuildHelper.bat and click "Run as administrator". This is very important. ***If you do not select Run as administrator, the script will not work.***
6. Follow the directions in the command line window.
7. Once the script tells you it's completed, open Android Studio, click File in the navigation bar at the top, click Open, navigate to `C:\RSDKv5-Decompilation\android` and click OK. Android Studio will then run some automatic actions in the background to import the project.
8. You may see a prompt from Android Studio to install an NDK. Follow through with this and install it.
9. Once the NDK is installed, click Build in the navigation bar, and click Make Project.
10. If all goes right, then your assembled APK should be located in `C:\RSDKv5-Decompilation\android\app\build\outputs\apk\debug`.

# Support

If you need any support, please feel free to reach out to me on Discord @MisterSheeple#0321 in the Retro Engine Modding Server. Invite: http://dc.railgun.works/retroengine
