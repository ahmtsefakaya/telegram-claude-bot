@echo off
chcp 65001 >nul
title Free Claude Code - Telegram Bot

echo ========================================
echo   Free Claude Code - Telegram Bot
echo ========================================
echo.

REM Eski süreçleri temizle
echo [1/3] Eski süreçler temizleniyor...
taskkill /F /IM fcc-server.exe /IM fcc-claude.exe /IM node.exe /T 2>nul
timeout /t 2 /nobreak >nul

REM Çalışma dizinine geç
cd /d "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code"

REM Sunucuyu başlat
echo [2/3] Telegram bot sunucusu başlatılıyor...
echo.
echo Telegram Bot Bilgileri:
echo - Bot Token: 8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk
echo - İzinli Kullanıcı ID: 7701576435
echo - Admin Panel: http://127.0.0.1:8082/admin
echo.
echo [3/3] Bot aktif! Telegram'dan mesaj gönderebilirsiniz.
echo.
echo ========================================
echo   Kapatmak için bu pencereyi kapatın
echo ========================================
echo.

REM Sunucuyu başlat (bu komut sürekli çalışır)
C:\Users\ahmet\.local\bin\uv.exe run python server.py --host 127.0.0.1 --port 8082

REM Eğer sunucu kapanırsa
echo.
echo Sunucu kapandı! 5 saniye sonra yeniden başlatılıyor...
timeout /t 5
goto :eof
