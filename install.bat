@echo off
title AgentStack - One-Click Skills Installer
chcp 65001 >nul 2>&1

if "%~1"=="" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1" -TargetProject "%~1"
)

echo.
pause
