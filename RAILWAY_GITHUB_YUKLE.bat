@echo off
chcp 65001 >nul
title Railway - GitHub'a Yükleme

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                                                              ║
echo ║          🚂 RAILWAY DEPLOYMENT - GITHUB YÜKLEME              ║
echo ║                                                              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

REM Çalışma dizinine geç
cd /d "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-codesefa"

echo [1/7] Git kurulumu kontrol ediliyor...
git --version >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ❌ Git kurulu değil!
    echo.
    echo Git'i indirmek için:
    echo 1. https://git-scm.com/download/win adresine git
    echo 2. Git'i indir ve kur
    echo 3. Bilgisayarı yeniden başlat
    echo 4. Bu scripti tekrar çalıştır
    echo.
    pause
    exit /b 1
)
echo ✅ Git kurulu

echo.
echo [2/7] Git yapılandırması kontrol ediliyor...
git config --global user.name >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo Git yapılandırması gerekli!
    echo.
    set /p USERNAME="GitHub kullanıcı adın: "
    set /p EMAIL="GitHub email adresin: "
    git config --global user.name "%USERNAME%"
    git config --global user.email "%EMAIL%"
    echo ✅ Git yapılandırıldı
) else (
    echo ✅ Git zaten yapılandırılmış
)

echo.
echo [3/7] .gitignore kontrol ediliyor...
if not exist ".gitignore" (
    echo .gitignore bulunamadı, oluşturuluyor...
    (
        echo __pycache__
        echo .venv
        echo .env
        echo *.pyc
        echo *.log
    ) > .gitignore
    echo ✅ .gitignore oluşturuldu
) else (
    echo ✅ .gitignore mevcut
)

echo.
echo [4/7] Git repository başlatılıyor...
if exist ".git" (
    echo ✅ Git repository zaten mevcut
) else (
    git init
    echo ✅ Git repository başlatıldı
)

echo.
echo [5/7] Dosyalar ekleniyor...
git add .
echo ✅ Dosyalar eklendi

echo.
echo [6/7] Commit oluşturuluyor...
git commit -m "Initial commit for Railway deployment" >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ Commit oluşturuldu
) else (
    echo ⚠️ Commit zaten mevcut veya değişiklik yok
)

echo.
echo [7/7] GitHub repository bilgileri...
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                                                              ║
echo ║                    ÖNEMLİ TALİMATLAR                         ║
echo ║                                                              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 1. GitHub'da yeni repository oluştur:
echo    → https://github.com/new
echo.
echo 2. Repository ayarları:
echo    Repository name: telegram-claude-bot
echo    Description: Free Claude Code Telegram Bot - 7/24 Active
echo    Visibility: Public (ücretsiz deployment için gerekli)
echo    ❌ "Add a README file" işaretleme
echo    ❌ ".gitignore" ekleme
echo.
echo 3. "Create repository" tıkla
echo.
echo 4. Aşağıdaki komutları çalıştır:
echo.
echo ════════════════════════════════════════════════════════════════
set /p GITHUB_USERNAME="GitHub kullanıcı adın: "
echo.
echo Şimdi şu komutları çalıştır:
echo.
echo git remote add origin https://github.com/%GITHUB_USERNAME%/telegram-claude-bot.git
echo git branch -M main
echo git push -u origin main
echo ════════════════════════════════════════════════════════════════
echo.
echo.
set /p DEVAM="Devam etmek için ENTER'a bas (komutlar otomatik çalışacak)..."

echo.
echo [PUSH] GitHub'a yükleniyor...
echo.

git remote add origin https://github.com/%GITHUB_USERNAME%/telegram-claude-bot.git 2>nul
git branch -M main
git push -u origin main

if %errorLevel% equ 0 (
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║                                                              ║
    echo ║                  ✅ BAŞARILI!                                ║
    echo ║                                                              ║
    echo ╚══════════════════════════════════════════════════════════════╝
    echo.
    echo Kod başarıyla GitHub'a yüklendi!
    echo.
    echo Sonraki adım:
    echo 1. https://railway.app/ adresine git
    echo 2. "New Project" → "Deploy from GitHub repo"
    echo 3. Repository seç: telegram-claude-bot
    echo 4. "Deploy Now" tıkla
    echo.
    echo Detaylı rehber: RAILWAY_KURULUM_REHBERI.md
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
    echo 1. GitHub repository henüz oluşturulmadı
    echo 2. GitHub kullanıcı adı yanlış
    echo 3. GitHub authentication gerekli
    echo.
    echo GitHub Personal Access Token oluştur:
    echo 1. https://github.com/settings/tokens
    echo 2. "Generate new token" → "Generate new token (classic)"
    echo 3. Note: Railway Deployment
    echo 4. Scopes: ✅ repo
    echo 5. "Generate token" tıkla
    echo 6. Token'ı kopyala
    echo.
    echo Push komutunu tekrar çalıştır:
    echo git push -u origin main
    echo.
    echo Kullanıcı adı: %GITHUB_USERNAME%
    echo Şifre: [GitHub Personal Access Token]
    echo.
)

pause
