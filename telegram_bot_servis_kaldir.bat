@echo off
chcp 65001 >nul
title Free Claude Code - Servis Kaldır

echo ========================================
echo   Windows Servisi Kaldırma
echo ========================================
echo.

REM Yönetici yetkisi kontrolü
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [HATA] Bu script yönetici olarak çalıştırılmalı!
    echo.
    pause
    exit /b 1
)

echo Servis durduruluyor...
net stop TelegramClaudeBot 2>nul

echo Servis kaldırılıyor...
sc delete TelegramClaudeBot

echo.
echo Servis başarıyla kaldırıldı!
echo.
pause
