@echo off
set MOD_NAME=mp_spas
set GAME_FOLDER=PUT GAME DIRECTORY HERE.
set OAT_BASE=PUT OAT DIRECTORY HERE
set MOD_BASE=%cd%\mods\%MOD_NAME%
set "sourceFile=%MOD_BASE%\zone\mod.ff"
set "destinationFolder=PUT PLUTO APP DATA DIRECTORY HERE\storage\t6\mods\%MOD_NAME%"
echo %MOD_BASE%

:: Use --load "%GAME_FOLDER%\zone\all\xxx.ff" ^ for zone linking

"%OAT_BASE%\Linker" ^
-v ^
--load "C:\OAT\weapon_clump_dump\weapons!spas_sp.ff" ^
--base-folder "%OAT_BASE%" ^
--asset-search-path "%MOD_BASE%" ^
--source-search-path "%MOD_BASE%\zone_source" ^
--output-folder "%MOD_BASE%\zone" mod

set err=%ERRORLEVEL%

if %ERRORLEVEL% NEQ 0 pause

echo Copying and replacing %sourceFile% to %destinationFolder%...

copy /y "%sourceFile%" "%destinationFolder%"

echo Done!

timeout /t 3