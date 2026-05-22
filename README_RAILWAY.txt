╔══════════════════════════════════════════════════════════════════════╗
║                                                                      ║
║          🚂 RAILWAY DEPLOYMENT - BAŞLANGIÇ REHBERİ                  ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝


Telegram botunu Railway'de 7/24 aktif hale getirmek için bu dosyayı oku.


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🎯 HIZLI BAŞLANGIÇ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. RAILWAY_SISTEM_KONTROL.txt dosyasını aç
   → Sistem durumunu kontrol et

2. RAILWAY_HIZLI_BASLANGIC.txt dosyasını aç
   → Adım adım kurulum yap (15 dakika)

3. Telegram'dan botuna /start gönder
   → Test et!


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  📁 DOSYA YAPISI
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 Rehber Dosyaları (Ana Klasör):
────────────────────────────────────────────────────────────────────
README_RAILWAY.txt               → Bu dosya (başlangıç)
RAILWAY_SISTEM_KONTROL.txt       → Sistem durumu raporu
RAILWAY_BASLA.txt                → Genel bakış
RAILWAY_HIZLI_BASLANGIC.txt      → 15 dakikalık kurulum
RAILWAY_KURULUM_REHBERI.md       → Detaylı dokümantasyon
RAILWAY_ENV_VARIABLES.txt        → Environment variables
RAILWAY_GITHUB_YUKLE.bat         → Otomatik GitHub yükleme


🔧 Teknik Dosyalar (free-claude-codesefa klasörü):
────────────────────────────────────────────────────────────────────
requirements.txt                 → Python bağımlılıkları
Procfile                         → Başlatma komutu
runtime.txt                      → Python versiyonu
Dockerfile                       → Docker image
nixpacks.toml                    → Railway yapılandırması
.gitignore                       → Git ignore (.env koruması)
.dockerignore                    → Docker ignore


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🚀 KURULUM ADIMLARI
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ADIM 1: Hazırlık (2 dakika)
────────────────────────────────────────────────────────────────────
□ GitHub hesabı oluştur: https://github.com/signup
□ Railway hesabı oluştur: https://railway.app/
□ Git kurulumunu kontrol et: git --version


ADIM 2: GitHub'a Yükleme (5 dakika)
────────────────────────────────────────────────────────────────────
□ GitHub'da repository oluştur: telegram-claude-bot
□ RAILWAY_GITHUB_YUKLE.bat çift tıkla
□ Talimatları takip et


ADIM 3: Railway Deployment (3 dakika)
────────────────────────────────────────────────────────────────────
□ Railway dashboard → "New Project"
□ "Deploy from GitHub repo" seç
□ Repository seç: telegram-claude-bot
□ "Deploy Now" tıkla


ADIM 4: Environment Variables (5 dakika)
────────────────────────────────────────────────────────────────────
□ Railway dashboard → "Variables" sekmesi
□ RAILWAY_ENV_VARIABLES.txt dosyasını aç
□ 15 değişkeni kopyala-yapıştır


ADIM 5: Test (2 dakika)
────────────────────────────────────────────────────────────────────
□ Health check: [URL]/health
□ Telegram'dan /start gönder
□ Bir soru sor


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  💡 ÖNEMLİ BİLGİLER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Railway Ücretsiz Plan:
✅ 500 saat/ay ($5 kredi)
✅ 7/24 çalışır (uyku modu yok)
✅ Otomatik restart
✅ Kolay yapılandırma

Güvenlik:
✅ .env dosyası GitHub'a yüklenmez
✅ API anahtarları Railway Variables'dan eklenir
✅ Hassas bilgiler korunur

Mevcut Yapılandırma:
✅ Telegram Bot Token: Yapılandırılmış
✅ İzinli Kullanıcı ID: 7701576435
✅ NVIDIA NIM API Key: Yapılandırılmış
✅ Model: nvidia_nim/z-ai/glm-5.1


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  📖 HANGİ REHBERİ KULLANMALIYIM?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Yeni Başlıyorsan:
→ RAILWAY_HIZLI_BASLANGIC.txt
→ Adım adım checklist
→ 15 dakikada tamamla

Detaylı Bilgi İstiyorsan:
→ RAILWAY_KURULUM_REHBERI.md
→ Ekran görüntüleri ile açıklamalar
→ Sorun giderme bölümü
→ 30 dakikada tamamla

Otomatik Kurulum İstiyorsan:
→ RAILWAY_GITHUB_YUKLE.bat
→ Çift tıkla, talimatları takip et
→ En hızlı yöntem


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🆘 SORUN GİDERME
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Bot Yanıt Vermiyor:
→ Railway Dashboard → Deployments → View Logs
→ Variables sekmesinden değişkenleri kontrol et
→ Health endpoint test et: [URL]/health

Build Failed:
→ requirements.txt var mı kontrol et
→ GitHub'a yeniden push et

Application Crashed:
→ Environment variables eksik mi kontrol et
→ Özellikle TELEGRAM_BOT_TOKEN ve NVIDIA_NIM_API_KEY

Detaylı Sorun Giderme:
→ RAILWAY_KURULUM_REHBERI.md dosyasındaki
  "Sorun Giderme" bölümüne bak


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🎉 BAŞARILI KURULUM SONRASI
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Botun artık Railway'de 7/24 çalışıyor!

Yönetim:
→ Logları izle: Railway Dashboard → Deployments → View Logs
→ Yeniden başlat: Railway Dashboard → Deployments → Restart
→ Kullanım: Railway Dashboard → Usage

Kod Güncelleme:
→ Kod değiştir
→ git add .
→ git commit -m "Update"
→ git push
→ Railway otomatik yeniden deploy eder!


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🎯 ŞİMDİ NE YAPMALIYIM?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. RAILWAY_SISTEM_KONTROL.txt aç
   → Sistem durumunu kontrol et

2. RAILWAY_HIZLI_BASLANGIC.txt aç
   → Adım adım kurulum yap

3. 15 dakikada tamamla!


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Başarılar! 🚀

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
