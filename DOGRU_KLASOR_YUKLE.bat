@echo off
chcp 65001 >nul
title Railway - Doğru Klasörü Yükle

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                                                              ║
echo ║          🚂 RAILWAY - DOĞRU KLASÖRÜ YÜKLE                    ║
echo ║                                                              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Repository: https://github.com/ahmtsefakaya/telegram-claude-bot
echo.
echo Bu script, DOĞRU klasörü (free-claude-codesefa) GitHub'a yükleyecek.
echo.
pause

REM Doğru klasöre geç
cd /d "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-codesefa"

echo.
echo [1/8] Klasör kontrol ediliyor...
echo Şu anda: %cd%
echo.

echo [2/8] Gerekli dosyalar kontrol ediliyor...
if not exist "Procfile" (
    echo ❌ Procfile bulunamadı!
    echo.
    echo Procfile oluşturuluyor...
    echo web: uvicorn server:app --host 0.0.0.0 --port $PORT --timeout-graceful-shutdown 5 > Procfile
    echo ✅ Procfile oluşturuldu
)
if not exist "requirements.txt" (
    echo ❌ requirements.txt bulunamadı!
    pause
    exit /b 1
)
if not exist "server.py" (
    echo ❌ server.py bulunamadı!
    pause
    exit /b 1
)
echo ✅ Tüm dosyalar mevcut
echo.

echo [3/8] Dosya listesi:
dir /b Procfile requirements.txt server.py runtime.txt 2>nul
echo.

echo [4/8] Git repository kontrol ediliyor...
if exist ".git" (
    echo Eski .git klasörü siliniyor...
    rmdir /s /q .git
)
git init
echo ✅ Yeni Git repository başlatıldı
echo.

echo [5/8] Dosyalar ekleniyor...
git add .
echo ✅ Dosyalar eklendi
echo.

echo [6/8] Commit oluşturuluyor...
git commit -m "Deploy: Add all files for Railway deployment"
echo ✅ Commit oluşturuldu
echo.

echo [7/8] GitHub'a bağlanıyor...
git remote add origin https://github.com/ahmtsefakaya/telegram-claude-bot.git
git branch -M main
echo ✅ Remote eklendi
echo.

echo [8/8] GitHub'a yükleniyor...
echo.
echo ⚠️ GitHub kullanıcı adı ve şifre/token isteyecek!
echo.
echo Kullanıcı adı: ahmtsefakaya
echo Şifre: [GitHub Personal Access Token]
echo.
echo Token yoksa:
echo 1. https://github.com/settings/tokens
echo 2. "Generate new token (classic)"
echo 3. Scopes: ✅ repo
echo 4. Token'ı kopyala
echo.
pause

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
    echo Repository: https://github.com/ahmtsefakaya/telegram-claude-bot
    echo.
    echo Şimdi kontrol et:
    echo 1. https://github.com/ahmtsefakaya/telegram-claude-bot adresine git
    echo 2. Şunları görmeli sin:
    echo    ✅ Procfile
    echo    ✅ requirements.txt
    echo    ✅ server.py
    echo    ✅ api/ klasörü
    echo    ✅ config/ klasörü
    echo    ✅ core/ klasörü
    echo.
    echo Sonraki adım:
    echo 1. Railway'e git: https://railway.app/dashboard
    echo 2. Eski projeyi sil (Settings → Delete Service)
    echo 3. Yeni proje oluştur (New Project → Deploy from GitHub repo)
    echo 4. Repository seç: telegram-claude-bot
    echo 5. Deploy Now tıkla
    echo 6. Variables sekmesinden environment variables ekle
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
    echo Olası sebepler:
    echo 1. GitHub authentication başarısız
    echo 2. Personal Access Token gerekli
    echo.
    echo Çözüm:
    echo 1. https://github.com/settings/tokens adresine git
    echo 2. "Generate new token (classic)" tıkla
    echo 3. Note: Railway Deployment
    echo 4. Scopes: ✅ repo işaretle
    echo 5. "Generate token" tıkla
    echo 6. Token'ı kopyala
    echo.
    echo Tekrar dene:
    echo git push -f origin main
    echo.
    echo Kullanıcı adı: ahmtsefakaya
    echo Şifre: [Kopyaladığın token]
    echo.
)

pause
