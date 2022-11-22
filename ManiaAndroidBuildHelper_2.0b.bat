@echo off
echo ------------------------------------------------------
echo MisterSheeple's Sonic Mania Android Build Helper v2.0b
echo ------------------------------------------------------
echo.
echo                                                  WARNING:
echo.
echo Before continuing, please consult the guide at https://github.com/MisterSheeple/Sonic-Mania-Android-Build-Guide/
echo.
pause
echo.
goto isitstillthere

:isitstillthere
echo Checking for existing folder... 
echo.
if exist %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\ (
  echo Existing Folder being deleted, this should take about 15 seconds...
  rmdir /s /q %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\
  %WINDIR%\System32\timeout.exe /t 15 /nobreak > NUL
  echo.
  echo Folder should be deleted, continuing...
) else (
  echo Existing folder doesn't exist, continuing...
)
echo.
goto preferences

:preferences
set touch=y
set ultrawide=y
set /p touch=Build with Touch Control support? (y/n; default is y) 
set /p ultrawide=Build with Ultra-Widescreen support? (y/n; default is y) 
cls
goto clone

:clone
git clone https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation.git %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation
git clone https://github.com/Rubberduckycooly/RSDKv5-Example-Mods.git %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods
git clone https://github.com/Rubberduckycooly/GameAPI.git %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\GameAPI
git clone https://github.com/Rubberduckycooly/RSDKv5-Decompilation.git %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5 --recursive
echo Cloning done.
cls
goto dependencies

:dependencies
cd %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android
curl -L http://downloads.xiph.org/releases/theora/libtheora-1.1.1.zip --output libtheora.zip
curl -L http://downloads.xiph.org/releases/ogg/libogg-1.3.5.zip --output libogg.zip
powershell -command "Expand-Archive -LiteralPath '%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libtheora.zip' -DestinationPath '%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\'"
powershell -command "Expand-Archive -LiteralPath '%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg.zip' -DestinationPath '%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\'"
echo Prepping Dependencies...
%WINDIR%\System32\timeout.exe /t 3 /nobreak > NUL
rename libtheora-1.1.1 libtheora
echo Please Wait...
%WINDIR%\System32\timeout.exe /t 3 /nobreak > NUL
for /f %%a IN ('dir "%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5" /b') do move "%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\%%a" "%USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\"
echo Almost there...
%WINDIR%\System32\timeout.exe /t 3 /nobreak > NUL
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\Makefile.am %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\Makefile.am
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\Makefile.in %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\Makefile.in
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\config_types.h.in %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\config_types.h.in
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\Makefile.am %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\Makefile.am
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\Makefile.in %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\Makefile.in
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\ogg.h %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\ogg.h
move %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\include\ogg\os_types.h %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg\include\ogg\os_types.h
echo Final Stretch...
%WINDIR%\System32\timeout.exe /t 3 /nobreak > NUL
rmdir %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\dependencies\android\libogg-1.3.5\ /s /q
del libtheora.zip libogg.zip
echo Dependencies done. Continuing in 10 seconds...
%WINDIR%\System32\timeout.exe /t 10 /nobreak > NUL
cls
goto touchsetup

:touchsetup
cd %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods\ManiaTouchControls
if /I %touch%==n (goto ultrawidesetup)
cd %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\GameAPI
xcopy %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\GameAPI %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods\ManiaTouchControls\GameAPI /s /y /i
pause
goto ultrawidesetup

:ultrawidesetup
cd %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods\UltrawideMania
if /I %ultrawide%==n (goto mainsymlinksetup)
cd %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\GameAPI
xcopy %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\GameAPI %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods\UltrawideMania\GameAPI /s /y /i
goto mainsymlinksetup

:mainsymlinksetup
cd %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5\android\app\jni
mklink /D "Game" %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation
mklink /D "RSDKv5" %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\Sonic-Mania-Decompilation\dependencies\RSDKv5
if /I %touch%==y mklink /D "MTouchCtrl" %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods\ManiaTouchControls
if /I %ultrawide%==y mklink /D "UWMania" %USERPROFILE%\Documents\Sonic-Mania-Android-Sheeple\RSDKv5-Example-Mods\UltrawideMania
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
