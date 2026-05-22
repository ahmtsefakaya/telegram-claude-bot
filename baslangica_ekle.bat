@echo off
chcp 65001 >nul
title Başlangıç Klasörüne Ekle

echo ========================================
echo   Windows Başlangıcına Ekle
echo ========================================
echo.
echo Bu script, botu Windows başlangıç klasörüne ekler.
echo Böylece bilgisayar açıldığında otomatik başlar.
echo.
pause

REM Başlangıç klasörü yolu
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM Kısayol oluştur
echo Kısayol oluşturuluyor...
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%STARTUP%\TelegramClaudeBot.lnk'); $Shortcut.TargetPath = 'c:\Users\ahmet\OneDrive\Desktop\freeclaude\telegram_bot_surekli.bat'; $Shortcut.WorkingDirectory = 'c:\Users\ahmet\OneDrive\Desktop\freeclaude'; $Shortcut.Description = 'Free Claude Code Telegram Bot'; $Shortcut.Save()"

echo.
echo ========================================
echo   Başarıyla Eklendi!
echo ========================================
echo.
echo Telegram bot artık bilgisayar açıldığında otomatik başlayacak.
echo.
echo Kaldırmak için:
echo %STARTUP%
echo klasöründeki "TelegramClaudeBot.lnk" dosyasını silin.
echo.
pause
