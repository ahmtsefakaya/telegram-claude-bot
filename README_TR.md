# 🤖 Free Claude Code - Telegram Bot Kurulum Rehberi

## 📋 Sistem Durumu

✅ **Yapılandırma Tamamlandı!** Sisteminiz kullanıma hazır.

### Mevcut Ayarlar:
- **Telegram Bot Token:** Yapılandırılmış ✓
- **İzinli Kullanıcı ID:** 7701576435
- **AI Model:** NVIDIA NIM - Z.ai GLM-5.1
- **Port:** 8082
- **Admin Panel:** http://127.0.0.1:8082/admin

---

## 🚀 Hızlı Başlangıç (3 Yöntem)

### Yöntem 1: Manuel Başlatma (En Basit)

**Kullanım:** Geçici kullanım için ideal

```
telegram_bot_baslat.bat
```

- ✅ Çift tıkla, hemen başlar
- ✅ Pencere açık kaldığı sürece çalışır
- ❌ Pencereyi kapatınca durur
- ❌ Bilgisayar yeniden başlatınca durur

---

### Yöntem 2: Otomatik Yeniden Başlatma (Önerilen)

**Kullanım:** Günlük kullanım için ideal

```
telegram_bot_surekli.bat
```

- ✅ Çift tıkla, başlar
- ✅ Hata olursa otomatik yeniden başlar
- ✅ Daha güvenilir
- ❌ Pencereyi kapatınca durur
- ❌ Bilgisayar yeniden başlatınca durur

---

### Yöntem 3: Windows Servisi (En İyi - Sürekli Aktif)

**Kullanım:** 7/24 kesintisiz çalışma için ideal

#### Seçenek A: PowerShell ile Otomatik Kurulum (Önerilen)

1. `telegram_bot_servis_ps.ps1` dosyasına **sağ tıklayın**
2. **"PowerShell ile Çalıştır"** seçin
3. **"Yönetici olarak çalıştır"** onaylayın
4. Script otomatik olarak:
   - NSSM'i indirir
   - Servisi kurar
   - Başlatır

#### Seçenek B: Manuel Kurulum

1. [NSSM'i indirin](https://nssm.cc/download)
2. `nssm.exe` dosyasını `c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm\` klasörüne kopyalayın
3. `windows_servis_kur.bat` dosyasına **sağ tıklayın**
4. **"Yönetici olarak çalıştır"** seçin

#### Seçenek C: Başlangıç Klasörü (Basit Alternatif)

```
baslangica_ekle.bat
```

- ✅ Yönetici yetkisi gerektirmez
- ✅ Bilgisayar açıldığında otomatik başlar
- ❌ Pencere görünür (minimize edilebilir)

**Servis Avantajları:**
- ✅ Bilgisayar açıldığında otomatik başlar
- ✅ Arka planda çalışır (pencere yok)
- ✅ Hata olursa otomatik yeniden başlar
- ✅ En güvenilir yöntem
- ✅ Windows Hizmetler panelinden yönetilebilir

**Servis Yönetimi:**
```cmd
# Başlat
net start TelegramClaudeBot

# Durdur
net stop TelegramClaudeBot

# Durum
sc query TelegramClaudeBot

# Kaldır (yönetici olarak)
telegram_bot_servis_kaldir.bat
```

---

## 📱 Telegram'dan Kullanım

### İlk Kurulum

1. Telegram'ı açın
2. Botunuzu bulun (BotFather'dan aldığınız username)
3. `/start` komutunu gönderin
4. Artık doğrudan soru sorabilirsiniz!

### Örnek Kullanımlar

```
Merhaba, sen kimsin?
```

```
Python'da bir hesap makinesi yaz
```

```
React ile bir todo list uygulaması nasıl yapılır?
```

```
Bu kodu açıkla:
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)
```

```
SQL injection nedir ve nasıl önlenir?
```

### Desteklenen Özellikler

- ✅ Kod yazma ve açıklama
- ✅ Hata ayıklama
- ✅ Algoritma tasarımı
- ✅ Mimari önerileri
- ✅ Kod review
- ✅ Dokümantasyon yazma
- ✅ Uzun konuşmalar (context korunur)
- 🔜 Ses notları (VOICE_NOTE_ENABLED=true ile)

---

## 🛠️ Yönetim Paneli

Bot çalışırken tarayıcıdan açın:

```
http://127.0.0.1:8082/admin
```

### Panel Özellikleri:

#### 1. Model Değiştirme
Farklı AI modelleri arasında geçiş yapın:
- NVIDIA NIM modelleri (Z.ai GLM-5.1, Kimi K2.5, vb.)
- OpenRouter modelleri
- DeepSeek modelleri
- Yerel modeller (LM Studio, Ollama, llama.cpp)

#### 2. API Anahtarı Yönetimi
- Yeni API anahtarları ekleyin
- Mevcut anahtarları güncelleyin
- Anahtarları test edin

#### 3. Provider Testi
- Her provider'ın durumunu kontrol edin
- Bağlantı testleri yapın
- Model listelerini görüntüleyin

#### 4. Ayar Doğrulama
- Değişiklikleri kaydetmeden önce test edin
- Hataları anında görün
- Güvenli yapılandırma

---

## ⚙️ Gelişmiş Yapılandırma

### .env Dosyası Düzenleme

Dosya konumu:
```
c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code\.env
```

#### Önemli Ayarlar:

```env
# Telegram Bot Ayarları
MESSAGING_PLATFORM="telegram"
TELEGRAM_BOT_TOKEN="your_bot_token"
ALLOWED_TELEGRAM_USER_ID="your_user_id"

# Model Seçimi
MODEL="nvidia_nim/z-ai/glm-5.1"
MODEL_OPUS=""                    # Opus istekleri için özel model
MODEL_SONNET=""                  # Sonnet istekleri için özel model
MODEL_HAIKU=""                   # Haiku istekleri için özel model

# NVIDIA NIM API
NVIDIA_NIM_API_KEY="your_api_key"

# Düşünme Modu (Reasoning)
ENABLE_MODEL_THINKING=true       # Tüm modeller için
ENABLE_OPUS_THINKING=true        # Sadece Opus için
ENABLE_SONNET_THINKING=true      # Sadece Sonnet için
ENABLE_HAIKU_THINKING=true       # Sadece Haiku için

# Rate Limiting
PROVIDER_RATE_LIMIT=1            # Saniyede kaç istek
PROVIDER_RATE_WINDOW=3           # Pencere süresi (saniye)
PROVIDER_MAX_CONCURRENCY=5       # Maksimum eşzamanlı istek

# Timeout Ayarları (saniye)
HTTP_READ_TIMEOUT=300
HTTP_WRITE_TIMEOUT=60
HTTP_CONNECT_TIMEOUT=60

# Ses Notu Desteği
VOICE_NOTE_ENABLED=false
WHISPER_DEVICE="nvidia_nim"      # "cpu", "cuda", veya "nvidia_nim"
WHISPER_MODEL="openai/whisper-large-v3"

# Web Araçları
ENABLE_WEB_SERVER_TOOLS=true
WEB_FETCH_ALLOWED_SCHEMES=http,https
WEB_FETCH_ALLOW_PRIVATE_NETWORKS=false

# Debug Ayarları
LOG_RAW_API_PAYLOADS=false
LOG_RAW_SSE_EVENTS=false
LOG_API_ERROR_TRACEBACKS=false
LOG_RAW_MESSAGING_CONTENT=false
```

### Farklı Provider'lar Kullanma

#### OpenRouter (Ücretsiz Modeller)
```env
OPENROUTER_API_KEY="your_key"
MODEL="open_router/stepfun/step-3.5-flash:free"
```

#### DeepSeek
```env
DEEPSEEK_API_KEY="your_key"
MODEL="deepseek/deepseek-chat"
```

#### Kimi
```env
KIMI_API_KEY="your_key"
MODEL="kimi/kimi-k2.5"
```

#### Yerel Model (Ollama)
```env
OLLAMA_BASE_URL="http://localhost:11434"
MODEL="ollama/llama3.1"
```

---

## 🔍 Sorun Giderme

### Bot Yanıt Vermiyor

**Çözüm 1: Servisi Yeniden Başlat**
```cmd
telegram_bot_durdur.bat
telegram_bot_baslat.bat
```

**Çözüm 2: Yapılandırmayı Kontrol Et**
1. `.env` dosyasını açın
2. `TELEGRAM_BOT_TOKEN` ve `ALLOWED_TELEGRAM_USER_ID` kontrol edin
3. Admin panelden provider durumunu kontrol edin

**Çözüm 3: Log Dosyalarını İncele**
```
c:\Users\ahmet\.fcc\logs\
```

---

### "Port Zaten Kullanımda" Hatası

**Çözüm:**
```cmd
# Tüm süreçleri durdur
telegram_bot_durdur.bat

# Port'u kullanan süreci bul
netstat -ano | findstr :8082

# Süreci sonlandır (PID'yi yukarıdaki komuttan alın)
taskkill /F /PID [pid_numarası]

# Yeniden başlat
telegram_bot_baslat.bat
```

---

### NVIDIA API Hatası

**Belirtiler:**
- "Authentication failed"
- "Invalid API key"
- "Rate limit exceeded"

**Çözüm:**
1. https://build.nvidia.com/settings/api-keys adresine gidin
2. Yeni bir API anahtarı oluşturun
3. Admin panelden anahtarı güncelleyin
4. "Validate" butonuna tıklayın
5. "Apply" ile kaydedin

---

### Model Bulunamadı Hatası

**Çözüm:**
1. `.env` dosyasını açın
2. `MODEL` satırını kontrol edin:
   ```env
   MODEL="nvidia_nim/z-ai/glm-5.1"
   ```
3. Admin panelden "Test Providers" ile modeli test edin
4. Gerekirse farklı bir model seçin

---

### Servis Başlamıyor

**Çözüm:**
```cmd
# Servis durumunu kontrol et
sc query TelegramClaudeBot

# Log dosyalarını kontrol et
type c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code\telegram_bot_error.log

# Servisi manuel başlat
net start TelegramClaudeBot

# Hala başlamazsa, servisi kaldır ve yeniden kur
telegram_bot_servis_kaldir.bat
telegram_bot_servis_ps.ps1
```

---

## 📊 Performans İpuçları

### 1. Model Seçimi
- **Hızlı yanıtlar için:** `nvidia_nim/z-ai/glm-5.1` (mevcut)
- **Daha iyi kalite için:** `nvidia_nim/moonshotai/kimi-k2.5`
- **Ücretsiz alternatif:** `open_router/stepfun/step-3.5-flash:free`

### 2. Rate Limiting
Çok hızlı istek gönderiyorsanız:
```env
PROVIDER_RATE_LIMIT=2
PROVIDER_RATE_WINDOW=5
```

### 3. Timeout Ayarları
Uzun görevler için:
```env
HTTP_READ_TIMEOUT=600
```

### 4. Thinking Modu
Daha hızlı yanıtlar için kapatın:
```env
ENABLE_MODEL_THINKING=false
```

---

## 🔐 Güvenlik

### Önemli Güvenlik Notları:

1. **API Anahtarlarını Koruyun**
   - `.env` dosyasını kimseyle paylaşmayın
   - Git'e commit etmeyin
   - Düzenli olarak yenileyin

2. **Kullanıcı Erişimi**
   - `ALLOWED_TELEGRAM_USER_ID` sadece sizin ID'nizi içermeli
   - Birden fazla kullanıcı için virgülle ayırın: `"123,456,789"`

3. **Admin Panel**
   - Sadece localhost'tan erişilebilir (127.0.0.1)
   - Dışarıdan erişim engellenmiştir

4. **Web Araçları**
   - `WEB_FETCH_ALLOW_PRIVATE_NETWORKS=false` olarak bırakın
   - Gerekmedikçe `ENABLE_WEB_SERVER_TOOLS=true` kullanın

---

## 📁 Dosya Yapısı

```
freeclaude/
├── HIZLI_BASLANGIC.txt              # Hızlı başlangıç rehberi
├── README_TR.md                     # Bu dosya
├── TELEGRAM_BOT_KULLANIM.md         # Detaylı kullanım kılavuzu
│
├── telegram_bot_baslat.bat          # Manuel başlatma
├── telegram_bot_surekli.bat         # Otomatik yeniden başlatma
├── telegram_bot_durdur.bat          # Durdurma
│
├── telegram_bot_servis_ps.ps1       # Servis kurulum (PowerShell)
├── windows_servis_kur.bat           # Servis kurulum (Batch)
├── telegram_bot_servis_kaldir.bat   # Servis kaldırma
│
├── baslangica_ekle.bat              # Başlangıç klasörüne ekle
├── baslangictan_kaldir.bat          # Başlangıçtan kaldır
│
└── free-claude-code/
    ├── .env                         # Yapılandırma dosyası
    ├── server.py                    # Ana sunucu
    ├── api/                         # API katmanı
    ├── providers/                   # Provider'lar
    ├── messaging/                   # Telegram/Discord
    └── ...
```

---

## 💡 Kullanım Senaryoları

### Senaryo 1: Kod Geliştirme Asistanı
```
Telegram: "Python'da bir REST API nasıl yazılır?"
Bot: [Detaylı açıklama + örnek kod]

Telegram: "Bu koda hata kontrolü ekle"
Bot: [Güncellenmiş kod + açıklama]
```

### Senaryo 2: Hata Ayıklama
```
Telegram: "Bu kod neden çalışmıyor?
[kod yapıştır]"
Bot: [Hata analizi + çözüm önerileri]
```

### Senaryo 3: Öğrenme
```
Telegram: "React hooks nedir?"
Bot: [Detaylı açıklama + örnekler]

Telegram: "Bir örnek göster"
Bot: [Çalışan kod örneği]
```

### Senaryo 4: Kod Review
```
Telegram: "Bu kodu incele ve iyileştir:
[kod yapıştır]"
Bot: [Analiz + iyileştirme önerileri + güncellenmiş kod]
```

---

## 🎯 Sık Sorulan Sorular

### S: Bot ne kadar süre yanıt verir?
**C:** Genellikle 5-30 saniye arası. Karmaşık görevler daha uzun sürebilir.

### S: Kaç mesaj gönderebilirim?
**C:** Rate limit ayarlarınıza bağlı. Varsayılan: saniyede 1 istek.

### S: Ses mesajları destekleniyor mu?
**C:** Evet, `.env` dosyasında `VOICE_NOTE_ENABLED=true` yapın.

### S: Birden fazla kullanıcı kullanabilir mi?
**C:** Evet, `.env` dosyasında `ALLOWED_TELEGRAM_USER_ID="id1,id2,id3"` şeklinde ekleyin.

### S: Ücretsiz mi?
**C:** Yazılım ücretsiz. AI provider'lar için API anahtarı gerekir (bazıları ücretsiz).

### S: Hangi dilleri destekliyor?
**C:** Tüm programlama dilleri ve doğal diller (Türkçe dahil).

### S: Kod dosyası gönderebilir miyim?
**C:** Evet, dosya içeriğini mesaj olarak yapıştırın.

### S: Conversation history korunuyor mu?
**C:** Evet, her konuşma için context korunur.

---

## 🔄 Güncelleme

### Yazılımı Güncelleme

```cmd
cd c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code
git pull
C:\Users\ahmet\.local\bin\uv.exe sync
```

Sonra botu yeniden başlatın.

---

## 📞 Destek ve Yardım

### Log Dosyaları
```
c:\Users\ahmet\.fcc\logs\
```

### Yapılandırma Dosyası
```
c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code\.env
```

### Admin Panel
```
http://127.0.0.1:8082/admin
```

### Proje GitHub
```
https://github.com/Alishahryar1/free-claude-code
```

---

## 🎉 Başarılı Kurulum!

Sisteminiz kullanıma hazır. Şimdi yapmanız gerekenler:

1. ✅ Bir başlatma yöntemi seçin (Yöntem 3 önerilir)
2. ✅ Telegram'dan botunuza `/start` gönderin
3. ✅ Soru sormaya başlayın!

**İyi kullanımlar! 🚀**

---

*Son güncelleme: 2025*
