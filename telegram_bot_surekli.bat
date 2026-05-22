@echo off
chcp 65001 >nul
title Free Claude Code - Telegram Bot (Otomatik Yeniden Başlatma)

:basla
echo ========================================
echo   Free Claude Code - Telegram Bot
echo   Otomatik Yeniden Başlatma Modu
echo ========================================
echo.
echo Başlatma Zamanı: %date% %time%
echo.

REM Eski süreçleri temizle
taskkill /F /IM fcc-server.exe /IM fcc-claude.exe /IM node.exe /T 2>nul
timeout /t 2 /nobreak >nul

REM Çalışma dizinine geç
cd /d "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code"

REM Sunucuyu başlat
echo Telegram bot başlatılıyor...
echo Admin Panel: http://127.0.0.1:8082/admin
echo.

C:\Users\ahmet\.local\bin\uv.exe run python server.py --host 127.0.0.1 --port 8082

REM Eğer sunucu kapanırsa otomatik yeniden başlat
echo.
echo [UYARI] Sunucu kapandı! 10 saniye sonra yeniden başlatılıyor...
echo Durdurmak için bu pencereyi kapatın.
echo.
timeout /t 10
goto basla
