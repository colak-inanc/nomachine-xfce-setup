# NoMachine + XFCE4 Kurulumu
Kurulum Adımlarını [setup-steps.md](./setup-steps.md) dosyası üzerinden takip edebilirsiniz. Gerekli özelleştirmeleri yapmanız için bu dosyayı incelemeden kuruluma geçmemeniz tavsiye edilir!

## Hızlı Kurulum

Aşağıdaki komutu terminale yapıştırın ve çalıştırın. Kurulum 5-10 dakika sürecektir.

```bash
git clone https://github.com/colak-inanc/nomachine-xfce-setup.git && \
chmod +x nomachine-xfce-setup/setup.sh && \
sudo ./nomachine-xfce-setup/setup.sh
```

Kurulum tamamlandığında terminal aşağıdaki gibi görünecektir:

![Terminal çıktısı](./images/terminal-output.png)

## NoMachine Bağlantısı

1. Bilgisayarınıza kurulu NoMachine'i açın
2. Yeni bir sunucu ekleyin (IP adresini terminal çıktısından alabilirsiniz)
3. Login ekranında terminal çıktısındaki kullanıcı adı ve şifre bilgilerini kullanın

Not: Bu adımla ilgili tüm detaylar Medium yazısında verilmiştir. Hemem aşağıdaki link üzerinden Medium yazısına erişim sağlayabilirsiniz. [NoMachine + XFCE ile En Stabil Remote Desktop Kurulumu](https://medium.com/wordspace/ssh-yetersiz-kaldığında-nomachine-xfce-ile-en-stabil-remote-desktop-kurulumu-a424d404f1ca)

![Login panel](./images/login-panel.png)

Artık sunucunuza GUI üzerinden erişebilirsiniz:

![Ubuntu masaüstü](./images/ubuntu-desktop.png)
