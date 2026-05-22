# ☁️ Cloud Deployment Rehberi - Bilgisayar Kapalıyken 7/24 Aktif

Bu rehber, Free Claude Code Telegram botunu ücretsiz cloud platformlarda nasıl deploy edeceğinizi gösterir.

---

## 🎯 Önerilen Platformlar (Ücretsiz)

### 1. **Railway.app** ⭐ (EN ÖNERİLEN)
- ✅ **Ücretsiz Plan:** 500 saat/ay ($5 kredi)
- ✅ **Python 3.14 desteği**
- ✅ **Otomatik deployment**
- ✅ **Kolay environment variables**
- ✅ **7/24 çalışır**
- ✅ **Restart politikası**

### 2. **Render.com** ⭐
- ✅ **Ücretsiz Plan:** Sınırsız
- ⚠️ **15 dakika inaktivite sonrası uyur** (ilk istek 30-60 saniye sürer)
- ✅ **Python 3.14 desteği**
- ✅ **Otomatik deployment**
- ✅ **Kolay yapılandırma**

### 3. **Fly.io**
- ✅ **Ücretsiz Plan:** 3 VM
- ✅ **7/24 çalışır**
- ✅ **Docker desteği**
- ⚠️ **Kredi kartı gerektirir** (ücret alınmaz)

### 4. **Koyeb**
- ✅ **Ücretsiz Plan:** 1 web service
- ✅ **7/24 çalışır**
- ✅ **Docker desteği**

---

## 🚀 Railway.app Deployment (ÖNERİLEN)

### Adım 1: Railway Hesabı Oluştur

1. https://railway.app/ adresine git
2. **"Start a New Project"** tıkla
3. GitHub ile giriş yap

### Adım 2: GitHub Repository Oluştur

```bash
cd c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code

# Git repository başlat (eğer yoksa)
git init

# Dosyaları ekle
git add .
git commit -m "Initial commit for cloud deployment"

# GitHub'a push et (önce GitHub'da repo oluştur)
git remote add origin https://github.com/KULLANICI_ADIN/free-claude-code.git
git branch -M main
git push -u origin main
```

### Adım 3: Railway'de Deploy Et

1. Railway dashboard'da **"New Project"** → **"Deploy from GitHub repo"**
2. Repository'ni seç: `free-claude-code`
3. **"Deploy Now"** tıkla

### Adım 4: Environment Variables Ekle

Railway dashboard'da **"Variables"** sekmesine git ve ekle:

```env
MESSAGING_PLATFORM=telegram
TELEGRAM_BOT_TOKEN=8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk
ALLOWED_TELEGRAM_USER_ID=7701576435
NVIDIA_NIM_API_KEY=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
MODEL=nvidia_nim/z-ai/glm-5.1
ANTHROPIC_AUTH_TOKEN=freecc
FCC_OPEN_BROWSER=false
HOST=0.0.0.0
PORT=8080
ENABLE_MODEL_THINKING=true
PROVIDER_RATE_LIMIT=1
PROVIDER_RATE_WINDOW=3
```

### Adım 5: Deploy Tamamlandı! ✅

- Railway otomatik olarak uygulamayı başlatır
- **"Deployments"** sekmesinden logları izleyebilirsin
- Bot artık 7/24 aktif!

---

## 🎨 Render.com Deployment

### Adım 1: Render Hesabı Oluştur

1. https://render.com/ adresine git
2. **"Get Started"** tıkla
3. GitHub ile giriş yap

### Adım 2: GitHub Repository Bağla

1. Render dashboard'da **"New +"** → **"Web Service"**
2. GitHub repository'ni bağla
3. Repository'ni seç: `free-claude-code`

### Adım 3: Yapılandırma

```
Name: telegram-claude-bot
Runtime: Python 3
Build Command: pip install -r requirements.txt
Start Command: uvicorn server:app --host 0.0.0.0 --port $PORT --timeout-graceful-shutdown 5
Plan: Free
```

### Adım 4: Environment Variables

**"Environment"** sekmesinden ekle:

```env
MESSAGING_PLATFORM=telegram
TELEGRAM_BOT_TOKEN=8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk
ALLOWED_TELEGRAM_USER_ID=7701576435
NVIDIA_NIM_API_KEY=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
MODEL=nvidia_nim/z-ai/glm-5.1
ANTHROPIC_AUTH_TOKEN=freecc
FCC_OPEN_BROWSER=false
PYTHON_VERSION=3.14.0
```

### Adım 5: Deploy

**"Create Web Service"** tıkla - deployment başlar!

⚠️ **ÖNEMLİ:** Render ücretsiz planı 15 dakika inaktivite sonrası uyur. İlk mesajınız 30-60 saniye sürebilir.

**Çözüm:** Cron-job.org gibi bir servisle her 10 dakikada bir health endpoint'e ping at:
```
https://your-app.onrender.com/health
```

---

## 🐳 Fly.io Deployment

### Adım 1: Fly CLI Kur

```bash
# Windows PowerShell
powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"
```

### Adım 2: Giriş Yap

```bash
fly auth login
```

### Adım 3: Uygulama Oluştur

```bash
cd c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code

fly launch --name telegram-claude-bot --region fra
```

### Adım 4: Environment Variables

```bash
fly secrets set MESSAGING_PLATFORM=telegram
fly secrets set TELEGRAM_BOT_TOKEN=8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk
fly secrets set ALLOWED_TELEGRAM_USER_ID=7701576435
fly secrets set NVIDIA_NIM_API_KEY=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
fly secrets set MODEL=nvidia_nim/z-ai/glm-5.1
fly secrets set ANTHROPIC_AUTH_TOKEN=freecc
fly secrets set FCC_OPEN_BROWSER=false
```

### Adım 5: Deploy

```bash
fly deploy
```

---

## 🔧 Koyeb Deployment

### Adım 1: Koyeb Hesabı

1. https://www.koyeb.com/ adresine git
2. Hesap oluştur

### Adım 2: Docker Hub'a Push (Opsiyonel)

```bash
cd c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code

docker build -t your-dockerhub-username/telegram-claude-bot .
docker push your-dockerhub-username/telegram-claude-bot
```

### Adım 3: Koyeb'de Deploy

1. **"Create App"** tıkla
2. **"Docker"** seç
3. Image: `your-dockerhub-username/telegram-claude-bot`
4. Environment variables ekle
5. **"Deploy"** tıkla

---

## 📊 Platform Karşılaştırması

| Platform | Ücretsiz Süre | Uyku Modu | Python 3.14 | Kolay Kurulum | Önerilen |
|----------|---------------|-----------|-------------|---------------|----------|
| **Railway** | 500 saat/ay | ❌ Yok | ✅ | ⭐⭐⭐⭐⭐ | ✅ EN İYİ |
| **Render** | Sınırsız | ⚠️ 15 dk | ✅ | ⭐⭐⭐⭐⭐ | ✅ İYİ |
| **Fly.io** | 3 VM | ❌ Yok | ✅ | ⭐⭐⭐ | ✅ İYİ |
| **Koyeb** | 1 service | ❌ Yok | ✅ | ⭐⭐⭐ | ✅ İYİ |
| **Vercel** | Sınırsız | ⚠️ Serverless | ❌ | ⭐⭐ | ❌ Uygun değil |
| **Netlify** | Sınırsız | ⚠️ Serverless | ❌ | ⭐⭐ | ❌ Uygun değil |

---

## 🔍 Deployment Sonrası Kontrol

### 1. Logları İzle

**Railway:**
```
Railway dashboard → Deployments → View Logs
```

**Render:**
```
Render dashboard → Logs
```

**Fly.io:**
```bash
fly logs
```

### 2. Health Check

Tarayıcıdan aç:
```
https://your-app-url.railway.app/health
```

Yanıt:
```json
{"status": "healthy"}
```

### 3. Telegram'dan Test

1. Telegram'da botuna git
2. `/start` gönder
3. Bir soru sor

---

## ⚠️ Önemli Notlar

### 1. Environment Variables Güvenliği

- ⚠️ **API anahtarlarını GitHub'a commit etme!**
- ✅ Sadece cloud platform dashboard'dan ekle
- ✅ `.env` dosyası `.gitignore`'da olmalı

### 2. Ücretsiz Plan Limitleri

**Railway:**
- 500 saat/ay (yaklaşık 20 gün)
- Ay sonunda sıfırlanır
- Kredi kartı ekleyerek $5 ücretsiz kredi alabilirsin

**Render:**
- Sınırsız ama 15 dakika inaktivite sonrası uyur
- Cron job ile aktif tutabilirsin

**Fly.io:**
- 3 VM ücretsiz
- Kredi kartı gerektirir (ücret alınmaz)

### 3. Python 3.14 Desteği

Bazı platformlar henüz Python 3.14'ü desteklemiyor. Alternatif:

```txt
# runtime.txt
python-3.13.0
```

veya

```dockerfile
# Dockerfile
FROM python:3.13-slim
```

### 4. Admin Panel Erişimi

Cloud deployment'ta admin panel **sadece localhost'tan** erişilebilir. Uzaktan erişim için:

**Seçenek 1:** Environment variable ekle
```env
ADMIN_ALLOW_REMOTE=true
```

**Seçenek 2:** Telegram'dan yönet (önerilir)

---

## 🔄 Otomatik Deployment (CI/CD)

### GitHub Actions ile Otomatik Deploy

`.github/workflows/deploy.yml` oluştur:

```yaml
name: Deploy to Railway

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install Railway CLI
        run: npm install -g @railway/cli
      
      - name: Deploy to Railway
        run: railway up
        env:
          RAILWAY_TOKEN: ${{ secrets.RAILWAY_TOKEN }}
```

Railway token'ı GitHub Secrets'a ekle.

---

## 🆘 Sorun Giderme

### Bot yanıt vermiyor

1. **Logları kontrol et:**
   - Railway/Render dashboard'dan logs sekmesi
   
2. **Environment variables kontrol et:**
   - `TELEGRAM_BOT_TOKEN` doğru mu?
   - `ALLOWED_TELEGRAM_USER_ID` doğru mu?
   
3. **Health endpoint test et:**
   ```
   https://your-app-url/health
   ```

### "Application failed to start"

1. **Python versiyonu:**
   - `runtime.txt` dosyasını kontrol et
   - Platform Python 3.14'ü destekliyor mu?
   
2. **Dependencies:**
   - `requirements.txt` eksik mi?
   - Build logs'u kontrol et

### "Out of memory"

Ücretsiz planlar genellikle 512MB RAM verir. Çözüm:
- Gereksiz dependencies kaldır
- `VOICE_NOTE_ENABLED=false` yap
- Daha fazla RAM veren platforma geç

---

## 💰 Maliyet Optimizasyonu

### Railway'de 500 Saati Aşmamak İçin:

1. **Sadece gerektiğinde çalıştır:**
   - Gece saatlerinde durdur
   - Railway CLI ile: `railway down` / `railway up`

2. **Birden fazla hesap:**
   - Farklı email adresleriyle yeni hesaplar aç
   - Her hesap 500 saat ücretsiz

3. **Render'a geç:**
   - Sınırsız ama uyku modu var
   - Cron job ile aktif tut

---

## 🎉 Başarılı Deployment!

Artık botunuz bulutta 7/24 çalışıyor! 

**Kontrol listesi:**
- ✅ Cloud platformda deploy edildi
- ✅ Environment variables eklendi
- ✅ Health check başarılı
- ✅ Telegram'dan test edildi
- ✅ Loglar izleniyor

**Bilgisayarınız kapalıyken bile bot aktif! 🚀**

---

## 📞 Yardım

- Railway Docs: https://docs.railway.app/
- Render Docs: https://render.com/docs
- Fly.io Docs: https://fly.io/docs/
- Koyeb Docs: https://www.koyeb.com/docs

---

*Son güncelleme: 2025*
