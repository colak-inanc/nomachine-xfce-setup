# NoMachine + XFCE4 Automatic Setup Script

Ubuntu/Debian sistemlerde NoMachine uzak masaüstü sunucusu ve XFCE4 masaüstü ortamını otomatik olarak kurmamızı sağlayan bir bash scripttir.

## Kullanılan Teknolojiler

- **NoMachine**: Yüksek performanslı uzak masaüstü erişim çözümü (NX protokolü)
- **XFCE4**: Hafif ve hızlı Linux masaüstü ortamı
- **Xorg**: X Window System grafik sunucusu
- **UFW**: Uncomplicated Firewall (güvenlik duvarı yönetimi)

## Gereksinimler

- Ubuntu 18.04+ veya Debian 10+ tabanlı sistem
- Root (sudo) yetkisi
- İnternet bağlantısı


## Kurulum Adımları

### 1. Script'i İndirin

Repository'yi klonlayın veya `setup.sh` dosyasını indirin.
```bash
git clone https://github.com/colak-inanc/nomachine-xfce-setup.git
```

### 2. Çalıştırma İzni Verin

```bash
chmod +x setup.sh
```

### 3. Script'i Çalıştırın

```bash
sudo ./setup.sh
```

Script şu işlemleri otomatik olarak gerçekleştirir:

1. Sistem paketlerini günceller
2. XFCE4 masaüstü ortamını kurar
3. NoMachine sunucusunu indirir ve kurar
4. Firewall kurallarını yapılandırır (port 4000)
5. Varsayılan kullanıcı hesabı oluşturur (`user`)
6. XFCE4 oturum dosyalarını yapılandırır

**Kurulum süresi:** Yaklaşık 5-10 dakika (internet hızına bağlı)

## Bağlantı

Kurulum tamamlandıktan sonra NoMachine istemcisinden bağlanabilirsiniz:

### Bağlantı Bilgileri

- **IP Adresi:** Sunucunuzun IP adresi
- **Port:** `4000` (NX protokolü)
- **Kullanıcı Adı:** `user`
- **Şifre:** `yourpass1!` (script içinde tanımlı)


### Bağlantı Adımları

1. NoMachine istemcisini açın
2. "New connection" (Yeni bağlantı) seçeneğine tıklayın
3. "Protocol" olarak **NX** seçin
4. Sunucu IP adresini ve port `4000` girin
5. Kullanıcı adı ve şifre ile giriş yapın

## Yapılandırma

### Kullanıcı Şifresini Değiştirme

Script içindeki `USER_PASSWORD` değişkenini düzenleyerek varsayılan şifreyi değiştirebilirsiniz:

```bash
USER_PASSWORD="yeni_sifreniz"
```

### Farklı Kullanıcı Adı Kullanma

Script içindeki `TARGET_USER` değişkenini düzenleyin:

```bash
TARGET_USER="istediginiz_kullanici_adi"
```

## Sorun Giderme

### NoMachine Bağlantı Hatası

- Firewall'ın port 4000'i açık olduğundan emin olun
- NoMachine servisinin çalıştığını kontrol edin: `/etc/NX/nxserver --status`

### XFCE4 Oturum Açılmıyor

- Kullanıcı oturum dosyalarını kontrol edin: `~/.xsession` ve `~/.xinitrc`
- NoMachine yapılandırmasını kontrol edin: `/usr/NX/etc/node.cfg`

