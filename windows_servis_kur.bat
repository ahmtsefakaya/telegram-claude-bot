@echo off
chcp 65001 >nul
title Free Claude Code - Windows Servisi Kurulumu

echo ========================================
echo   Windows Servisi Kurulum Aracı
echo ========================================
echo.
echo Bu script, Telegram botunu Windows servisi olarak kurar.
echo Böylece bilgisayar açıldığında otomatik başlar.
echo.
echo NOT: Bu işlem için YÖNETİCİ YETKİSİ gereklidir!
echo.
pause

REM Yönetici yetkisi kontrolü
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [HATA] Bu script yönetici olarak çalıştırılmalı!
    echo.
    echo Sağ tıklayıp "Yönetici olarak çalıştır" seçin.
    echo.
    pause
    exit /b 1
)

echo.
echo [1/4] NSSM indiriliyor...
echo.

REM NSSM dizini oluştur
if not exist "c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm" mkdir "c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm"

REM NSSM'in zaten kurulu olup olmadığını kontrol et
if exist "c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe" (
    echo NSSM zaten kurulu.
) else (
    echo NSSM bulunamadı. Manuel olarak indirmeniz gerekiyor:
    echo.
    echo 1. https://nssm.cc/download adresine gidin
    echo 2. NSSM'i indirin
    echo 3. nssm.exe dosyasını şu klasöre kopyalayın:
    echo    c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\
    echo.
    echo Alternatif: PowerShell ile otomatik kurulum için telegram_bot_servis_ps.ps1 kullanın
    echo.
    pause
    exit /b 1
)

echo.
echo [2/4] Eski servis kontrol ediliyor...
echo.

REM Eski servisi durdur ve kaldır
sc query "TelegramClaudeBot" >nul 2>&1
if %errorLevel% equ 0 (
    echo Eski servis bulundu, kaldırılıyor...
    net stop TelegramClaudeBot 2>nul
    sc delete TelegramClaudeBot
    timeout /t 2 /nobreak >nul
)

echo.
echo [3/4] Yeni servis kuruluyor...
echo.

REM NSSM ile servisi kur
c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe install TelegramClaudeBot "c:\Users\ahmet\OneDrive\Desktop\freeclaude\telegram_bot_surekli.bat"

REM Servis açıklaması
c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe set TelegramClaudeBot Description "Free Claude Code Telegram Bot - AI Asistan"

REM Servis başlatma türü (otomatik)
c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe set TelegramClaudeBot Start SERVICE_AUTO_START

REM Çalışma dizini
c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe set TelegramClaudeBot AppDirectory "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code"

REM Hata durumunda yeniden başlatma
c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe set TelegramClaudeBot AppExit Default Restart
c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\nssm.exe set TelegramClaudeBot AppRestartDelay 10000

echo.
echo [4/4] Servis başlatılıyor...
echo.

REM Servisi başlat
net start TelegramClaudeBot

echo.
echo ========================================
echo   Kurulum Tamamlandı!
echo ========================================
echo.
echo Servis Adı: TelegramClaudeBot
echo Durum: Çalışıyor
echo.
echo Servis Yönetimi:
echo - Başlat: net start TelegramClaudeBot
echo - Durdur: net stop TelegramClaudeBot
echo - Kaldır: sc delete TelegramClaudeBot
echo.
echo Servis artık bilgisayar açıldığında otomatik başlayacak!
echo.
pause
