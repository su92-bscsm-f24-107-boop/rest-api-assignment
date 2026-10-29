@echo off
title REST API Assignment Server - MySQL
if not exist .env (
  echo Missing .env. Run START-WINDOWS.bat first.
  pause
  exit /b 1
)
call npm run dev
pause
