@echo off
chcp 65001 >nul
title Free Claude Code - Bot Durdur

echo ========================================
echo   Telegram Bot Durduruluyor...
echo ========================================
echo.

taskkill /F /IM fcc-server.exe /IM fcc-claude.exe /IM node.exe /IM python.exe /T 2>nul

echo.
echo Tüm bot süreçleri durduruldu!
echo.
pause
