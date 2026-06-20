@echo off
cd /d "%~dp0"
title Project Umbra // Desktop Explorer
color 0b

echo ========================================================
echo        PROJECT UMBRA // DESKTOP EXPLORER (umbra ui)
echo ========================================================
echo.

call "%~dp0_bootstrap_env.bat"
if errorlevel 1 (
    echo.
    echo [CRITICAL] Environment setup failed.
    pause
    exit /b 1
)

echo [SYSTEM] Launching Desktop Explorer...
echo ========================================================
"%~dp0.venv\Scripts\python.exe" -m umbra ui

if errorlevel 1 (
    echo.
    echo [CRASH] The application exited with error code %errorlevel%.
    pause
)
