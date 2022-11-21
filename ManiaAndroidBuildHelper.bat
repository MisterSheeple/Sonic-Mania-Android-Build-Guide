@echo off
echo ------------------------------------------------------
echo MisterSheeple's Sonic Mania Android Build Helper v1.5
echo ------------------------------------------------------
echo.
echo                                                  WARNING:
echo.
echo Before continuing, please consult the guide at https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/
echo.
pause
echo.
goto preferences

:preferences
set touch=y
set ultrawide=y
set /p touch=Build with touch controls? (y/n; default is y) 
set /p ultrawide=Build with ultrawide? (y/n; default is y) 
cls
goto clone

:clone
cd C:\
git clone https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git C:\Sonic-Mania-Decompilation
git clone https://github.com/Rubberduckycooly/RSDKv5-Example-Mods.git C:\RSDKv5-Example-Mods
git clone https://github.com/Rubberduckycooly/GameAPI.git C:\GameAPI
git clone https://github.com/Rubberduckycooly/RSDKv5-Decompilation.git C:\Sonic-Mania-Decompilation\dependencies\RSDKv5
git clone https://github.com/nothings/stb.git C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\all\stb_vorbis
git clone https://github.com/leethomason/tinyxml2.git C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\all\tinyxml2
echo Cloning done.
cls
goto dependencies

:dependencies
cd C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android
curl -L http://downloads.xiph.org/releases/theora/libtheora-1.1.1.zip --output libtheora.zip
curl -L http://downloads.xiph.org/releases/ogg/libogg-1.3.5.zip --output libogg.zip
powershell -command "Expand-Archive -LiteralPath 'C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libtheora.zip' -DestinationPath 'C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\'"
powershell -command "Expand-Archive -LiteralPath 'C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg.zip' -DestinationPath 'C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\'"
rename libtheora-1.1.1 libtheora
for /f %%a IN ('dir "C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5" /b') do move "C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\%%a" "C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\"
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\Makefile.am C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\Makefile.am
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\Makefile.in C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\Makefile.in
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\config_types.h.in C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\config_types.h.in
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\Makefile.am C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\Makefile.am
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\Makefile.in C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\Makefile.in
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\ogg.h C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\ogg.h
move C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\os_types.h C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\os_types.h
rmdir C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\ /s /q
del libtheora.zip libogg.zip
echo Dependencies done.
cls
goto touchsetup

:touchsetup
cd C:\RSDKv5-Example-Mods\ManiaTouchControls
if /I %touch%==n (goto ultrawidesetup) else (mklink /D "GameAPI" C:\GameAPI)
cd C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\android\app\jni
mklink /D "MTC" C:\RSDKv5-Example-Mods\ManiaTouchControls
goto ultrawidesetup

:ultrawidesetup
cd C:\RSDKv5-Example-Mods\UltrawideMania
if /I %ultrawide%==n (goto mainsymlinksetup) else (mklink /D "GameAPI" C:\GameAPI)
cd C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\android\app\jni
mklink /D "UM" C:\RSDKv5-Example-Mods\UltrawideMania
goto mainsymlinksetup

:mainsymlinksetup
cd C:\Sonic-Mania-Decompilation\dependencies\RSDKv5\android\app\jni
mklink /D "GameAPI" C:\GameAPI
mklink /D "Game" C:\Sonic-Mania-Decompilation
mklink /D "RSDKv5" C:\Sonic-Mania-Decompilation\dependencies\RSDKv5
echo Symlink setup done.
goto finish

:finish
cls
color AF
echo --------------------------------------------------------------------------------------------------------------------
echo SETUP COMPLETE. Please continue with the guide at https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/
echo --------------------------------------------------------------------------------------------------------------------
echo.
pause
exit
