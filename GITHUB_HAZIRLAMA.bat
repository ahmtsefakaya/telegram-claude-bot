@echo off
chcp 65001 >nul
title GitHub'a Hazırlama

echo ========================================
echo   GitHub'a Yükleme Hazırlığı
echo ========================================
echo.

cd /d "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code"

echo [1/5] Git repository başlatılıyor...
git init

echo.
echo [2/5] .gitignore kontrol ediliyor...
if not exist ".gitignore" (
    echo .gitignore bulunamadı, oluşturuluyor...
    echo .env > .gitignore
    echo .env.local >> .gitignore
    echo __pycache__/ >> .gitignore
    echo *.pyc >> .gitignore
    echo .venv/ >> .gitignore
)

echo.
echo [3/5] Dosyalar ekleniyor...
git add .

echo.
echo [4/5] Commit oluşturuluyor...
git commit -m "Cloud deployment ready"

echo.
echo [5/5] Tamamlandı!
echo.
echo ========================================
echo   Sonraki Adımlar:
echo ========================================
echo.
echo 1. GitHub'da yeni repository oluştur:
echo    https://github.com/new
echo    Adı: telegram-claude-bot
echo.
echo 2. Aşağıdaki komutları çalıştır:
echo.
echo    git remote add origin https://github.com/KULLANICI_ADIN/telegram-claude-bot.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Railway.app'e git ve GitHub'dan deploy et!
echo.
pause
