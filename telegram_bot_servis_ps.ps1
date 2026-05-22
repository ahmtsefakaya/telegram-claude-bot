# Free Claude Code - Windows Servis Kurulum Script (PowerShell)
# Yönetici olarak çalıştırın: PowerShell'i sağ tıklayıp "Yönetici olarak çalıştır"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Free Claude Code - Servis Kurulumu" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Yönetici yetkisi kontrolü
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "[HATA] Bu script yönetici olarak çalıştırılmalı!" -ForegroundColor Red
    Write-Host ""
    Write-Host "PowerShell'i sağ tıklayıp 'Yönetici olarak çalıştır' seçin." -ForegroundColor Yellow
    Write-Host ""
    pause
    exit 1
}

# Değişkenler
$serviceName = "TelegramClaudeBot"
$serviceDisplayName = "Free Claude Code Telegram Bot"
$serviceDescription = "AI Asistan - Telegram üzerinden Claude Code erişimi"
$scriptPath = "c:\Users\ahmet\OneDrive\Desktop\freeclaude\telegram_bot_surekli.bat"
$workingDir = "c:\Users\ahmet\OneDrive\Desktop\freeclaude\free-claude-code"
$nssmDir = "c:\Users\ahmet\OneDrive\Desktop\freeclaude\nssm"
$nssmExe = "$nssmDir\nssm.exe"

# NSSM dizini oluştur
if (-not (Test-Path $nssmDir)) {
    New-Item -ItemType Directory -Path $nssmDir -Force | Out-Null
}

# NSSM indir
Write-Host "[1/5] NSSM indiriliyor..." -ForegroundColor Yellow
if (-not (Test-Path $nssmExe)) {
    try {
        $nssmUrl = "https://nssm.cc/ci/nssm-2.24-101-g897c7ad.zip"
        $nssmZip = "$nssmDir\nssm.zip"
        
        Write-Host "İndirme başlıyor: $nssmUrl" -ForegroundColor Gray
        Invoke-WebRequest -Uri $nssmUrl -OutFile $nssmZip -UseBasicParsing
        
        Write-Host "Arşiv çıkartılıyor..." -ForegroundColor Gray
        Expand-Archive -Path $nssmZip -DestinationPath $nssmDir -Force
        
        # nssm.exe'yi doğru konuma taşı (64-bit)
        $nssmExtracted = Get-ChildItem -Path $nssmDir -Filter "nssm.exe" -Recurse | Where-Object { $_.Directory.Name -eq "win64" } | Select-Object -First 1
        if ($nssmExtracted) {
            Copy-Item -Path $nssmExtracted.FullName -Destination $nssmExe -Force
            Write-Host "NSSM başarıyla indirildi!" -ForegroundColor Green
        } else {
            throw "nssm.exe bulunamadı"
        }
        
        # Temizlik
        Remove-Item -Path $nssmZip -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Host "[HATA] NSSM indirilemedi: $_" -ForegroundColor Red
        Write-Host ""
        Write-Host "Manuel indirme:" -ForegroundColor Yellow
        Write-Host "1. https://nssm.cc/download adresine gidin" -ForegroundColor Gray
        Write-Host "2. NSSM'i indirin ve nssm.exe'yi şu klasöre kopyalayın:" -ForegroundColor Gray
        Write-Host "   $nssmDir" -ForegroundColor Gray
        Write-Host ""
        pause
        exit 1
    }
} else {
    Write-Host "NSSM zaten kurulu." -ForegroundColor Green
}

# Eski servisi kontrol et ve kaldır
Write-Host ""
Write-Host "[2/5] Eski servis kontrol ediliyor..." -ForegroundColor Yellow
$existingService = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
if ($existingService) {
    Write-Host "Eski servis bulundu, kaldırılıyor..." -ForegroundColor Gray
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    & $nssmExe remove $serviceName confirm
    Start-Sleep -Seconds 2
    Write-Host "Eski servis kaldırıldı." -ForegroundColor Green
}

# Yeni servisi kur
Write-Host ""
Write-Host "[3/5] Yeni servis kuruluyor..." -ForegroundColor Yellow
& $nssmExe install $serviceName $scriptPath

# Servis yapılandırması
Write-Host ""
Write-Host "[4/5] Servis yapılandırılıyor..." -ForegroundColor Yellow
& $nssmExe set $serviceName DisplayName $serviceDisplayName
& $nssmExe set $serviceName Description $serviceDescription
& $nssmExe set $serviceName Start SERVICE_AUTO_START
& $nssmExe set $serviceName AppDirectory $workingDir
& $nssmExe set $serviceName AppExit Default Restart
& $nssmExe set $serviceName AppRestartDelay 10000
& $nssmExe set $serviceName AppStdout "$workingDir\telegram_bot.log"
& $nssmExe set $serviceName AppStderr "$workingDir\telegram_bot_error.log"

Write-Host "Servis yapılandırması tamamlandı." -ForegroundColor Green

# Servisi başlat
Write-Host ""
Write-Host "[5/5] Servis başlatılıyor..." -ForegroundColor Yellow
Start-Service -Name $serviceName
Start-Sleep -Seconds 3

# Durum kontrolü
$service = Get-Service -Name $serviceName
if ($service.Status -eq "Running") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  Kurulum Başarıyla Tamamlandı!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Servis Bilgileri:" -ForegroundColor Cyan
    Write-Host "  Adı: $serviceName" -ForegroundColor Gray
    Write-Host "  Durum: Çalışıyor" -ForegroundColor Green
    Write-Host "  Başlatma: Otomatik" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Yönetim Komutları:" -ForegroundColor Cyan
    Write-Host "  Başlat:  Start-Service $serviceName" -ForegroundColor Gray
    Write-Host "  Durdur:  Stop-Service $serviceName" -ForegroundColor Gray
    Write-Host "  Durum:   Get-Service $serviceName" -ForegroundColor Gray
    Write-Host "  Kaldır:  & '$nssmExe' remove $serviceName confirm" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Admin Panel: http://127.0.0.1:8082/admin" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Telegram botunuz artık sürekli aktif!" -ForegroundColor Green
    Write-Host "Bilgisayar açıldığında otomatik başlayacak." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "[UYARI] Servis başlatılamadı!" -ForegroundColor Red
    Write-Host "Durum: $($service.Status)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Log dosyalarını kontrol edin:" -ForegroundColor Yellow
    Write-Host "  $workingDir\telegram_bot.log" -ForegroundColor Gray
    Write-Host "  $workingDir\telegram_bot_error.log" -ForegroundColor Gray
}

Write-Host ""
pause
