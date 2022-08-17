@echo off
echo MisterSheeple's Sonic Mania Android Build Helper v1.0
echo ---WARNING---
echo Before continuing, please consult the guide at https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/
pause
goto preferences

:preferences
set /p touch=Build with touch controls? (y/n; default is y) 
set /p ultrawide=Build with ultrawide? (y/n; default is y) 
cls
goto clone

:clone
git clone https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git C:\Sonic-Mania-Decompilation
git clone https://github.com/Rubberduckycooly/RSDKv5-Decompilation.git C:\RSDKv5-Decompilation
git clone https://github.com/Rubberduckycooly/RSDKv5-Example-Mods.git C:\RSDKv5-Example-Mods
git clone https://github.com/Rubberduckycooly/GameAPI.git C:\GameAPI
cd C:\RSDKv5-Decompilation\dependencies\all
git clone https://github.com/leethomason/tinyxml2.git C:\RSDKv5-Decompilation\dependencies\all\tinyxml2
git clone https://github.com/nothings/stb.git C:\RSDKv5-Decompilation\dependencies\all\stb_vorbis
cd C:\
echo Cloning done.
cls
goto dependencies

:dependencies
cd C:\RSDKv5-Decompilation\dependencies\android
curl -L https://downloads.xiph.org/releases/theora/libtheora-1.1.1.zip --output libtheora.zip
curl -L https://downloads.xiph.org/releases/ogg/libogg-1.3.5.zip --output libogg.zip
powershell -command "Expand-Archive -LiteralPath 'C:\RSDKv5-Decompilation\dependencies\android\libtheora.zip' -DestinationPath 'C:\RSDKv5-Decompilation\dependencies\android\'"
powershell -command "Expand-Archive -LiteralPath 'C:\RSDKv5-Decompilation\dependencies\android\libogg.zip' -DestinationPath 'C:\RSDKv5-Decompilation\dependencies\android\'"
rename libtheora-1.1.1 libtheora
for /f %%a IN ('dir "C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5" /b') do move "C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\%%a" "C:\RSDKv5-Decompilation\dependencies\android\libogg\"
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\Makefile.am C:\RSDKv5-Decompilation\dependencies\android\libogg\include\Makefile.am
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\Makefile.in C:\RSDKv5-Decompilation\dependencies\android\libogg\include\Makefile.in
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\ogg\config_types.h.in C:\RSDKv5-Decompilation\dependencies\android\libogg\include\ogg\config_types.h.in
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\ogg\Makefile.am C:\RSDKv5-Decompilation\dependencies\android\libogg\include\ogg\Makefile.am
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\ogg\Makefile.in C:\RSDKv5-Decompilation\dependencies\android\libogg\include\ogg\Makefile.in
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\ogg\ogg.h C:\RSDKv5-Decompilation\dependencies\android\libogg\include\ogg\ogg.h
move C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\include\ogg\os_types.h C:\RSDKv5-Decompilation\dependencies\android\libogg\include\ogg\os_types.h
rmdir C:\RSDKv5-Decompilation\dependencies\android\libogg-1.3.5\ /s /q
cd C:\
echo Dependencies done.
cls
goto touchsetup

:touchsetup
cd C:\RSDKv5-Example-Mods\ManiaTouchControls
echo var is %touch%
if /I %touch%==n (goto ultrawidesetup) else (mklink /D "GameAPI" C:\GameAPI)
cd C:\RSDKv5-Decompilation\android\app\jni
mklink /D "MTC" C:\RSDKv5-Example-Mods\ManiaTouchControls
goto ultrawidesetup

:ultrawidesetup
cd C:\RSDKv5-Example-Mods\UltrawideMania
if /I %ultrawide%==n (goto mainsymlinksetup) else (mklink /D "GameAPI" C:\GameAPI)
cd C:\RSDKv5-Decompilation\android\app\jni
mklink /D "UM" C:\RSDKv5-Example-Mods\UltrawideMania
goto mainsymlinksetup

:mainsymlinksetup
cd C:\RSDKv5-Decompilation\android\app\jni
mklink /D "GameAPI" C:\GameAPI
mklink /D "Game" C:\Sonic-Mania-Decompilation
mklink /D "RSDKv5" C:\RSDKv5-Decompilation
echo Symlink setup is done.
goto finish

:finish
cls
echo SETUP COMPLETE. Please continue with the guide at https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/
pause
exit