@echo off
set modname=pml220_raw
set COMPILEDIR=%CD%
color 11
title SO RUSSIA - PromodLive 220 RAW
:MAKEOPTIONS
cls
:MAKEOPTIONS
echo -----------------------------------------------------------------
echo ----------------- SO RUSSIA MOD BUILDER -------------------------
echo ----------------- Developed by : Frames -------------------------
echo -----------------------------------------------------------------
echo  Please select an option:
echo    1. Build Fast File (mod.fff)
echo    2. Build IWD File (pml220.iwd)
echo    3. Copy To COD/Mods (mod.ff file)
echo    4. Start Mod (Mods/so_russia)
echo    5. Start Server (Mods/so_russia)
echo.
echo    0. Exit
echo -----------------------------------------------------------------
echo.
set /p make_option=:
set make_option=%make_option:~0,1%
if "%make_option%"=="1" goto build_ff
if "%make_option%"=="2" goto build_iwd
if "%make_option%"=="3" goto copy_that
if "%make_option%"=="4" goto open_mod
if "%make_option%"=="5" goto start_server
if "%make_option%"=="0" goto FINAL
goto :MAKEOPTIONS
:build_iwd
cls
cd
echo -----------------------------------------------------------------
echo.
echo  Building pml220.iwd:
del pml220.iwd
del z_custom_ruleset.iwd
7za a -r -tzip pml220.iwd images
7za a -r -tzip pml220.iwd sound
7za a -r -tzip pml220.iwd weapons
7za a -r -tzip z_custom_ruleset.iwd promod_ruleset
echo Completed: %time%
echo -----------------------------------------------------------------
pause
goto :MAKEOPTIONS
:build_ff
cls
cd
echo -----------------------------------------------------------------
echo  Building mod.ff:
echo    Deleting old mod.ff file...
del mod.ff
echo    Copying rawfiles...
xcopy shock ..\..\raw\shock /SY
xcopy images ..\..\raw\images /SY
xcopy materials ..\..\raw\materials /SY
xcopy material_properties ..\..\raw\material_properties /SY
xcopy sound ..\..\raw\sound /SY
xcopy soundaliases ..\..\raw\soundaliases /SY
xcopy fx ..\..\raw\fx /SY
xcopy mp ..\..\raw\mp /SY
xcopy weapons\mp ..\..\raw\weapons\mp /SY
xcopy xanim ..\..\raw\xanim /SY
xcopy xmodel ..\..\raw\xmodel /SY
xcopy xmodelparts ..\..\raw\xmodelparts /SY
xcopy xmodelsurfs ..\..\raw\xmodelsurfs /SY
xcopy ui ..\..\raw\ui /SY
xcopy ui_mp ..\..\raw\ui_mp /SY
xcopy english ..\..\raw\english /SY
xcopy vision ..\..\raw\vision /SY
xcopy animtrees ..\..\raw\animtrees /SYI > NUL
echo    Copying source code...
xcopy maps ..\..\raw\maps /SY
xcopy promod ..\..\raw\promod /SY
xcopy promod_ruleset ..\..\raw\promod_ruleset /SY
echo    Copying MOD.CSV...
xcopy mod.csv ..\..\zone_source /SY
echo    Compiling mod...
cd ..\..\bin
linker_pc.exe -language english -compress -cleanup mod
cd %COMPILEDIR%
copy ..\..\zone\english\mod.ff
echo  New mod.ff file successfully built!
echo Completed: %time%
echo -----------------------------------------------------------------
pause
goto :MAKEOPTIONS
:copy_that
cls
echo  Copying mod.ff:
echo    Deleting old mod.ff file...
del D:\cod\Mods\so_russia\mod.ff
copy ..\..\zone\english\mod.ff D:\cod\Mods\so_russia
echo Completed: %time%
echo -----------------------------------------------------------------
pause
goto :MAKEOPTIONS
:open_mod
cls
echo  Opening Mod:
start D:\cod\iw3mp.exe +set fs_game Mods\so_russia
echo Completed: %time%
echo ------------------------------
pause
goto :MAKEOPTIONS

:start_server
cls
set /P yorNo="Are you sure you want to start the server? (Y/N)"
if "%yorNo%"=="Y" goto :start_it
if "%yorNo%"=="" goto :start_it
if "%yorNo%"=="y" goto :start_it
if "%yorNo%"=="n" goto :MAKEOPTIONS
if "%yorNo%"=="N" goto :MAKEOPTIONS
:start_it
QPROCESS "cod4x18_dedrun.exe">NUL
IF %ERRORLEVEL% EQU 0 ECHO "Close the server before starting a new one!"
IF %ERRORLEVEL% EQU 0 taskkill /f /IM cod4x18_dedrun.exe
echo  Starting Server:
start D:\cod\cod4x18_dedrun.exe +set sv_punkbuster 0 +set pb_sv_enable 0 +map_rotate +sv_authorizemode 0 +set fs_game Mods/so_russia +map mp_killhouse +set r_xassetnum "xmodel=1200" +set developer 1 +set promod_mode custom_public + exec server.cfg +g_gametype sd
echo ------------------------------
pause
goto :MAKEOPTIONS
:FINAL