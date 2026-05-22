@echo off
chcp 65001 >nul
title Railway - Düzeltme

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                                                              ║
echo ║          🚂 RAILWAY - SORUN DÜZELTME                         ║
echo ║                                                              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

echo [SORUN] Railway, Procfile dosyasını bulamıyor!
echo [SEBEP] Yanlış klasör GitHub'a yüklendi.
echo.
echo [ÇÖZÜM] Doğru klasörü yükleyeceğiz...
echo.
pause

REM Doğru klasöre geç
cd /d "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-codesefa"

echo [1/6] Mevcut klasör kontrol ediliyor...
echo Şu anda: %cd%
echo.

echo [2/6] Gerekli dosyalar kontrol ediliyor...
if not exist "Procfile" (
    echo ❌ Procfile bulunamadı!
    echo.
    pause
    exit /b 1
)
if not exist "requirements.txt" (
    echo ❌ requirements.txt bulunamadı!
    echo.
    pause
    exit /b 1
)
if not exist "server.py" (
    echo ❌ server.py bulunamadı!
    echo.
    pause
    exit /b 1
)
echo ✅ Tüm dosyalar mevcut
echo.

echo [3/6] Git repository kontrol ediliyor...
if not exist ".git" (
    echo Git repository başlatılıyor...
    git init
    echo ✅ Git repository başlatıldı
) else (
    echo ✅ Git repository mevcut
)
echo.

echo [4/6] Dosyalar ekleniyor...
git add .
git commit -m "Fix: Add Procfile and requirements.txt for Railway deployment"
echo ✅ Commit oluşturuldu
echo.

echo [5/6] GitHub bilgileri...
echo.
set /p GITHUB_USERNAME="GitHub kullanıcı adın: "
set /p REPO_NAME="Repository adı (telegram-claude-bot): "
if "%REPO_NAME%"=="" set REPO_NAME=telegram-claude-bot
echo.

echo [6/6] GitHub'a yükleniyor...
echo.

REM Eski remote varsa kaldır
git remote remove origin 2>nul

REM Yeni remote ekle
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git
git branch -M main
git push -f origin main

if %errorLevel% equ 0 (
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║                                                              ║
    echo ║                  ✅ BAŞARILI!                                ║
    echo ║                                                              ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo Doğru klasör GitHub'a yüklendi!
    echo.
    echo Şimdi Railway'de:
    echo 1. Projeyi sil (Settings → Delete Service)
    echo 2. Yeni proje oluştur (New Project → Deploy from GitHub repo)
    echo 3. Repository seç: %REPO_NAME%
    echo 4. Deploy Now tıkla
    echo.
    echo Railway şimdi Procfile'ı bulacak ve başlatacak!
    echo.
) else (
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║                                                              ║
    echo ║                  ⚠️ HATA!                                    ║
    echo ║                                                              ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo Push başarısız oldu!
    echo.
    echo GitHub Personal Access Token gerekebilir:
    echo 1. https://github.com/settings/tokens
    echo 2. "Generate new token (classic)"
    echo 3. Scopes: ✅ repo
    echo 4. Token'ı kopyala
    echo.
    echo Tekrar dene:
    echo git push -f origin main
    echo.
    echo Kullanıcı adı: %GITHUB_USERNAME%
    echo Şifre: [GitHub Personal Access Token]
    echo.
)

pause
