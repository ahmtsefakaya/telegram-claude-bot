@echo off
chcp 65001 >nul
title Başlangıçtan Kaldır

echo ========================================
echo   Windows Başlangıcından Kaldır
echo ========================================
echo.

REM Başlangıç klasörü yolu
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM Kısayolu sil
if exist "%STARTUP%\TelegramClaudeBot.lnk" (
    del "%STARTUP%\TelegramClaudeBot.lnk"
    echo Kısayol başarıyla kaldırıldı!
) else (
    echo Kısayol bulunamadı.
)

echo.
pause
