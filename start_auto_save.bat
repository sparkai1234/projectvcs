@echo off
echo Starting auto-save script...
powershell -ExecutionPolicy Bypass -File "%~dp0auto_save.ps1"
pause 