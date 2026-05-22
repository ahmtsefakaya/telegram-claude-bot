# 🚂 Railway.app - Sıfırdan Kurulum Rehberi

## 📋 İçindekiler
1. [Ön Hazırlık](#ön-hazırlık)
2. [GitHub'a Yükleme](#githuba-yükleme)
3. [Railway Kurulumu](#railway-kurulumu)
4. [Environment Variables](#environment-variables)
5. [Test ve Doğrulama](#test-ve-doğrulama)
6. [Sorun Giderme](#sorun-giderme)

---

## 🎯 Railway Nedir?

Railway, uygulamalarınızı kolayca deploy edebileceğiniz bir cloud platformudur.

**Ücretsiz Plan:**
- ✅ 500 saat/ay ($5 kredi)
- ✅ 7/24 çalışır (uyku modu yok)
- ✅ Otomatik restart
- ✅ Kolay yapılandırma

**Toplam Süre:** 20-30 dakika

---

## 📦 Ön Hazırlık

### 1. Gerekli Hesaplar

#### GitHub Hesabı
- [ ] https://github.com/signup adresine git
- [ ] Email, kullanıcı adı, şifre belirle
- [ ] Email'ini doğrula

#### Railway Hesabı
- [ ] https://railway.app/ adresine git
- [ ] "Start a New Project" tıkla
- [ ] "Login with GitHub" seç
- [ ] GitHub ile giriş yap

### 2. Git Kurulumu

**Kontrol Et:**
```cmd
git --version
```

**Eğer "git is not recognized" hatası alırsan:**
1. https://git-scm.com/download/win adresine git
2. Git'i indir ve kur
3. Bilgisayarı yeniden başlat

**Git Yapılandırması:**
```cmd
git config --global user.name "Adın Soyadın"
git config --global user.email "github@email.com"
```

---

## 📤 GitHub'a Yükleme

### Adım 1: GitHub Repository Oluştur

1. https://github.com/new adresine git
2. **Repository name:** `telegram-claude-bot`
3. **Description:** `Free Claude Code Telegram Bot - 7/24 Active`
4. **Public** seç (ücretsiz deployment için gerekli)
5. ❌ **"Add a README file"** işaretleme (zaten var)
6. ❌ **".gitignore"** ekleme (zaten var)
7. **"Create repository"** tıkla

### Adım 2: Kodu GitHub'a Yükle

**Otomatik Yöntem (Önerilen):**

`RAILWAY_GITHUB_YUKLE.bat` dosyasına çift tıkla ve talimatları takip et.

**Manuel Yöntem:**

```cmd
cd c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-codesefa

git init
git add .
git commit -m "Initial commit for Railway deployment"

git remote add origin https://github.com/KULLANICI_ADIN/telegram-claude-bot.git
git branch -M main
git push -u origin main
```

⚠️ **ÖNEMLİ:** `KULLANICI_ADIN` yerine kendi GitHub kullanıcı adını yaz!

**İlk push'ta GitHub şifre/token isteyecek:**
- Kullanıcı adı: GitHub kullanıcı adın
- Şifre: GitHub Personal Access Token (PAT)

**Personal Access Token Oluşturma:**
1. https://github.com/settings/tokens adresine git
2. "Generate new token" → "Generate new token (classic)"
3. Note: `Railway Deployment`
4. Expiration: `90 days` veya `No expiration`
5. Scopes: ✅ `repo` işaretle
6. "Generate token" tıkla
7. Token'ı kopyala (bir daha göremezsin!)

---

## 🚂 Railway Kurulumu

### Adım 1: Railway'de Proje Oluştur

1. https://railway.app/dashboard adresine git
2. **"New Project"** tıkla
3. **"Deploy from GitHub repo"** seç
4. **"Configure GitHub App"** tıkla (ilk kez)
5. Railway'e GitHub erişimi ver
6. Repository'ni seç: **`telegram-claude-bot`**
7. **"Deploy Now"** tıkla

Railway otomatik olarak:
- ✅ Kodu çeker
- ✅ Python bağımlılıklarını kurar
- ✅ Uygulamayı başlatır

**Bu 2-3 dakika sürer. Bekle...**

### Adım 2: Deployment'ı İzle

1. Railway dashboard'da projeye tıkla
2. **"Deployments"** sekmesine git
3. En son deployment'a tıkla
4. **"View Logs"** tıkla

**Logları izle. Şunları göreceksin:**
```
Installing dependencies...
Building application...
Starting application...
Application startup complete
Uvicorn running on http://0.0.0.0:XXXX
```

⚠️ **Eğer hata alırsan:** [Sorun Giderme](#sorun-giderme) bölümüne bak

---

## ⚙️ Environment Variables

### Adım 1: Variables Sekmesine Git

1. Railway dashboard'da projeye tıkla
2. **"Variables"** sekmesine git
3. **"New Variable"** tıkla

### Adım 2: Değişkenleri Ekle

**Aşağıdaki değişkenleri TEK TEK ekle:**

#### Temel Ayarlar
```env
MESSAGING_PLATFORM=telegram
HOST=0.0.0.0
FCC_OPEN_BROWSER=false
```

#### Telegram Ayarları
```env
TELEGRAM_BOT_TOKEN=8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk
ALLOWED_TELEGRAM_USER_ID=7701576435
```

#### AI Model Ayarları
```env
NVIDIA_NIM_API_KEY=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
MODEL=nvidia_nim/z-ai/glm-5.1
```

#### Güvenlik
```env
ANTHROPIC_AUTH_TOKEN=freecc
```

#### Performans Ayarları
```env
ENABLE_MODEL_THINKING=true
PROVIDER_RATE_LIMIT=1
PROVIDER_RATE_WINDOW=3
PROVIDER_MAX_CONCURRENCY=5
```

#### Timeout Ayarları
```env
HTTP_READ_TIMEOUT=300
HTTP_WRITE_TIMEOUT=60
HTTP_CONNECT_TIMEOUT=60
```

### Adım 3: Otomatik Yeniden Deploy

Variables ekledikten sonra Railway otomatik olarak uygulamayı yeniden deploy eder.

**"Deployments"** sekmesinden ilerlemeyi izle.

---

## ✅ Test ve Doğrulama

### 1. Health Check

**Railway URL'ini Bul:**
1. Railway dashboard → **"Settings"** sekmesi
2. **"Domains"** bölümünde URL'i kopyala
   - Örnek: `https://telegram-claude-bot-production.up.railway.app`

**Health Endpoint Test:**
1. Tarayıcıda aç: `[URL]/health`
2. Şunu görmelisin:
   ```json
   {"status": "healthy"}
   ```

### 2. Telegram Test

1. Telegram'ı aç
2. Botunu bul (BotFather'dan aldığın username)
3. `/start` gönder
4. Bir soru sor:
   ```
   Merhaba, sen kimsin?
   ```

5. Bot 5-10 saniye içinde yanıt vermeli

**✅ Başarılı! Botun artık 7/24 aktif!**

---

## 🎉 Tamamlandı!

Tebrikler! Telegram botun artık Railway'de çalışıyor!

### Kontrol Listesi
- [x] GitHub'a yüklendi
- [x] Railway'de deploy edildi
- [x] Environment variables eklendi
- [x] Health check başarılı
- [x] Telegram'dan test edildi

### Artık Yapabileceklerin

**Logları İzle:**
```
Railway Dashboard → Deployments → View Logs
```

**Yeniden Başlat:**
```
Railway Dashboard → Deployments → Restart
```

**Kullanım İstatistikleri:**
```
Railway Dashboard → Usage
```
500 saat/ay limitini buradan takip edebilirsin.

**Kod Güncelleme:**
```cmd
cd c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-codesefa
git add .
git commit -m "Update"
git push
```
Railway otomatik olarak yeniden deploy eder!

---

## 🔧 Sorun Giderme

### Bot Yanıt Vermiyor

**1. Logları Kontrol Et:**
```
Railway Dashboard → Deployments → View Logs
```

Hata mesajlarını ara.

**2. Environment Variables Kontrol Et:**
```
Railway Dashboard → Variables
```

Şunları kontrol et:
- `TELEGRAM_BOT_TOKEN` doğru mu?
- `ALLOWED_TELEGRAM_USER_ID` doğru mu?
- `NVIDIA_NIM_API_KEY` doğru mu?

**3. Health Endpoint Test Et:**
```
https://your-app.railway.app/health
```

Eğer `{"status": "healthy"}` görmüyorsan, uygulama başlamamış demektir.

### "Build Failed" Hatası

**Sebep:** `requirements.txt` eksik veya hatalı

**Çözüm:**
1. `free-claude-codesefa/requirements.txt` dosyasının var olduğundan emin ol
2. GitHub'a yeniden push et:
   ```cmd
   git add requirements.txt
   git commit -m "Fix requirements"
   git push
   ```

### "Application Crashed" Hatası

**Sebep:** Environment variables eksik veya hatalı

**Çözüm:**
1. Railway Dashboard → Variables
2. Tüm gerekli değişkenlerin eklendiğinden emin ol
3. Özellikle şunları kontrol et:
   - `TELEGRAM_BOT_TOKEN`
   - `NVIDIA_NIM_API_KEY`
   - `MODEL`

### "Port Already in Use" Hatası

**Sebep:** Railway otomatik olarak `PORT` değişkenini ayarlar

**Çözüm:** Hiçbir şey yapma! `Procfile` zaten `$PORT` kullanıyor.

### NVIDIA API Hatası

**Belirtiler:**
- "Authentication failed"
- "Invalid API key"

**Çözüm:**
1. https://build.nvidia.com/settings/api-keys adresine git
2. Yeni bir API anahtarı oluştur
3. Railway Dashboard → Variables
4. `NVIDIA_NIM_API_KEY` değerini güncelle

### 500 Saat Limiti Doldu

**Çözümler:**

**1. Render.com'a Geç (Sınırsız Ücretsiz):**
- Render.com hesabı oluştur
- Aynı GitHub repo'yu bağla
- Environment variables'ı ekle

**2. Yeni Railway Hesabı:**
- Farklı email ile yeni hesap aç
- Her hesap 500 saat ücretsiz

**3. Kredi Kartı Ekle:**
- Railway'e kredi kartı ekle
- $5 ücretsiz kredi al
- Ücret alınmaz (sadece doğrulama)

---

## 💡 İpuçları

### 1. Kullanım Süresini Optimize Et

**Gece Saatlerinde Durdur:**
```
Railway Dashboard → Settings → Delete Service (geçici)
```

Sabah yeniden deploy et.

### 2. Birden Fazla Model Dene

Railway Variables'dan `MODEL` değişkenini değiştir:
```env
MODEL=nvidia_nim/moonshotai/kimi-k2.5
MODEL=nvidia_nim/minimaxai/minimax-m2.5
```

### 3. Logları Düzenli Kontrol Et

Haftada bir logları kontrol et:
```
Railway Dashboard → Deployments → View Logs
```

### 4. Backup Oluştur

GitHub'da kodun zaten yedekli. Ama environment variables'ı da yedekle:
```
Railway Dashboard → Variables → Export
```

---

## 📞 Yardım ve Destek

### Railway Dokümantasyonu
- https://docs.railway.app/

### Railway Discord
- https://discord.gg/railway

### GitHub Issues
- Repository'nde issue aç

---

## 🎯 Sonraki Adımlar

1. **Ses Notları Ekle:**
   ```env
   VOICE_NOTE_ENABLED=true
   ```

2. **Farklı Modeller Dene:**
   - OpenRouter (ücretsiz modeller)
   - DeepSeek
   - Kimi

3. **Discord Bot Ekle:**
   ```env
   MESSAGING_PLATFORM=discord
   DISCORD_BOT_TOKEN=your_token
   ```

---

**Başarılar! 🚀**

*Son güncelleme: 2025*
