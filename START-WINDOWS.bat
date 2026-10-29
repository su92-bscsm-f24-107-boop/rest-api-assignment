@echo off
title REST API Assignment - XAMPP MySQL Setup
echo ==========================================
echo REST API Assignment - XAMPP MySQL Setup
echo ==========================================
echo.
if not exist .env (
  copy .env.example .env
  echo Created .env from .env.example
)
echo.
echo Installing Node.js dependencies...
call npm install
if errorlevel 1 (
  echo.
  echo npm install failed. Check that Node.js is installed and internet is available.
  pause
  exit /b 1
)
echo.
echo Setup complete.
echo 1. Open XAMPP Control Panel and start MySQL.
echo 2. Check .env settings if your MySQL username/password differ.
echo 3. Run START-SERVER.bat.
pause
