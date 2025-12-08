# NoMachine + XFCE4 Kurulumu

Bu script, Ubuntu/Debian sistemlerde **NoMachine** (uzak masaüstü) ve **XFCE4** (masaüstü ortamı) kurulumunu otomatikleştirir.

## Kullanılan Teknolojiler

- **NoMachine**: Yüksek performanslı uzak masaüstü erişim çözümü (NX protokolü)
- **XFCE4**: Hafif ve hızlı Linux masaüstü ortamı
- **Xorg**: X Window System grafik sunucusu
- **UFW**: Uncomplicated Firewall (güvenlik duvarı yönetimi)

## Gereksinimler

- Ubuntu 18.04+ veya Debian 10+ tabanlı sistem
- Root (sudo) yetkisi
- İnternet bağlantısı

> **Not:** İsterseniz `setup.sh` dosyasındaki `TARGET_USER` ve `USER_PASSWORD` değişkenlerini kurulum öncesi özelleştirebilirsiniz.

## Hızlı Kurulum

Aşağıdaki komutu terminale yapıştırın ve çalıştırın. Kurulum 5-10 dakika sürecektir.
```bash
git clone https://github.com/colak-inanc/nomachine-xfce-setup.git && \
chmod +x nomachine-xfce-setup/setup.sh && \
sudo ./nomachine-xfce-setup/setup.sh
```

> **Not:** Kurulum sırasında `sudo` şifreniz istenebilir.

## Bağlantı Bilgileri

Kurulum bittiğinde NoMachine istemcisi ile bağlanabilirsiniz:

| Ayar | Değer |
| :--- | :--- |
| **Protokol** | `NX` |
| **Port** | `4000` |
| **Kullanıcı** | `user` |
| **Şifre** | `yourpass1!` |

## İpuçları
- **Şifre Değiştirme**: Güvenlik için varsayılan şifreyi değiştirin: `passwd user`
- **Servis Durumu**: NoMachine servisinin durumunu kontrol edin: `sudo /etc/NX/nxserver --status`

