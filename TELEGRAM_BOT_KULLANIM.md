# 🤖 Telegram Bot Kullanım Kılavuzu

## 📋 Mevcut Yapılandırma

✅ **Telegram Bot Token:** `8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk`  
✅ **İzinli Kullanıcı ID:** `7701576435`  
✅ **NVIDIA NIM API Key:** Yapılandırılmış  
✅ **Model:** `nvidia_nim/z-ai/glm-5.1`  
✅ **Admin Panel:** http://127.0.0.1:8082/admin

---

## 🚀 Hızlı Başlangıç

### 1️⃣ Telegram Botunu Başlat

**Tek Seferlik Başlatma:**
```
telegram_bot_baslat.bat
```
Çift tıklayın - bot başlar ve pencere açık kaldığı sürece çalışır.

**Otomatik Yeniden Başlatma (ÖNERİLEN):**
```
telegram_bot_surekli.bat
```
Çift tıklayın - bot kapansa bile otomatik yeniden başlar.

### 2️⃣ Telegram'dan Mesaj Gönder

1. Telegram'da botunuzu bulun (bot username'inizi BotFather'dan öğrenebilirsiniz)
2. `/start` komutu ile başlayın
3. Artık doğrudan soru sorabilirsiniz!

**Örnek Mesajlar:**
```
Merhaba, bana Python'da bir hesap makinesi yaz
```
```
React ile bir todo list uygulaması nasıl yapılır?
```
```
Bu kodu optimize et: [kodunuz]
```

### 3️⃣ Botu Durdur

```
telegram_bot_durdur.bat
```
Çift tıklayın - tüm bot süreçleri temizlenir.

---

## 🔧 Yapılandırma Dosyası

Ayarları değiştirmek için:
```
c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code\.env
```

**Önemli Ayarlar:**

```env
# Telegram Bot Ayarları
MESSAGING_PLATFORM="telegram"
TELEGRAM_BOT_TOKEN="8945990527:AAGDi5yqWo75vNVMv1n0LYkvsVDsHvxJSAk"
ALLOWED_TELEGRAM_USER_ID="7701576435"

# Model Ayarları
MODEL="nvidia_nim/z-ai/glm-5.1"
NVIDIA_NIM_API_KEY="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"

# Düşünme Modu (Thinking)
ENABLE_MODEL_THINKING=true

# Ses Notu Desteği (İsteğe Bağlı)
VOICE_NOTE_ENABLED=false
```

---

## 🖥️ Admin Panel Kullanımı

Bot çalışırken tarayıcıdan açın:
```
http://127.0.0.1:8082/admin
```

**Admin Panel'den Yapabilecekleriniz:**
- ✏️ API anahtarlarını değiştirme
- 🔄 Model değiştirme (farklı AI modelleri deneme)
- ⚙️ Rate limit ayarları
- 🧪 Provider test etme
- 💾 Ayarları kaydetme ve doğrulama

---

## 🔄 Windows Başlangıcına Ekleme (Otomatik Başlatma)

Bot'un bilgisayar açıldığında otomatik başlaması için:

### Yöntem 1: Başlangıç Klasörü (Basit)

1. `Win + R` tuşlarına basın
2. `shell:startup` yazın ve Enter'a basın
3. Açılan klasöre `telegram_bot_surekli.bat` dosyasının kısayolunu atın

### Yöntem 2: Görev Zamanlayıcı (Gelişmiş)

1. `Win + R` → `taskschd.msc` yazın
2. Sağ tıklayın → "Temel Görev Oluştur"
3. Ad: "Telegram Bot Otomatik Başlat"
4. Tetikleyici: "Bilgisayar başladığında"
5. Eylem: "Program başlat"
6. Program: `c:\Users\ahmet\OneDrive\Desktop\freeclaude\telegram_bot_surekli.bat`
7. Bitir

---

## 📊 Log Dosyaları

Bot logları burada saklanır:
```
c:\Users\ahmet\.fcc\logs\
```

Hata ayıklama için log dosyalarını kontrol edin.

---

## ⚠️ Sorun Giderme

### Bot yanıt vermiyor
1. `telegram_bot_durdur.bat` çalıştırın
2. `.env` dosyasında `TELEGRAM_BOT_TOKEN` ve `ALLOWED_TELEGRAM_USER_ID` kontrol edin
3. `telegram_bot_baslat.bat` ile yeniden başlatın

### "Port zaten kullanımda" hatası
```cmd
netstat -ano | findstr :8082
taskkill /F /PID [bulunan_pid]
```

### NVIDIA API hatası
- Admin Panel'den API anahtarını kontrol edin
- https://build.nvidia.com/settings/api-keys adresinden yeni anahtar alın

### Model bulunamadı hatası
`.env` dosyasında `MODEL` satırını kontrol edin:
```env
MODEL="nvidia_nim/z-ai/glm-5.1"
```

---

## 🎯 Kullanım İpuçları

1. **Uzun Görevler:** Bot uzun kod yazma görevlerinde biraz zaman alabilir, sabırlı olun
2. **Ses Notları:** `VOICE_NOTE_ENABLED=true` yaparak ses mesajları gönderebilirsiniz
3. **Farklı Modeller:** Admin Panel'den farklı AI modelleri deneyebilirsiniz
4. **Rate Limiting:** Çok hızlı mesaj gönderirseniz bot yavaşlayabilir

---

## 📞 Komutlar

Telegram'da kullanabileceğiniz komutlar:

- `/start` - Botu başlat
- `/help` - Yardım mesajı
- `/stop` - Mevcut görevi durdur
- Doğrudan mesaj gönderin - AI ile sohbet edin

---

## 🔐 Güvenlik Notları

- ⚠️ `.env` dosyasını kimseyle paylaşmayın (API anahtarları içerir)
- ⚠️ `ALLOWED_TELEGRAM_USER_ID` sadece sizin Telegram ID'nizi içermeli
- ⚠️ Admin Panel sadece localhost'tan erişilebilir (güvenli)

---

## 📝 Hızlı Referans

| Dosya | Açıklama |
|-------|----------|
| `telegram_bot_baslat.bat` | Tek seferlik başlatma |
| `telegram_bot_surekli.bat` | Otomatik yeniden başlatma |
| `telegram_bot_durdur.bat` | Botu durdur |
| `.env` | Yapılandırma dosyası |
| `http://127.0.0.1:8082/admin` | Admin panel |

---

**İyi Kullanımlar! 🚀**
