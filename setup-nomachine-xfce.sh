#!/usr/bin/env bash
set -e

# for use of NoMachine 
TARGET_USER="user"

NOMACHINE_MAJOR="9.2"
NOMACHINE_VERSION="9.2.18_3"
NOMACHINE_DEB_URL="https://download.nomachine.com/download/${NOMACHINE_MAJOR}/Linux/nomachine_${NOMACHINE_VERSION}_amd64.deb"


if [ "$(id -u)" -ne 0 ]; then
  echo "Bu script root olarak çalıştırılmalı. (sudo ./setup-nomachine-xfce.sh)"
  exit 1
fi

echo ">>> Ubuntu NoMachine + XFCE installation!"


echo ">>> Paket listesi güncelleniyor..."
apt update -y
echo ">>> Sistem paketleri yükseltiliyor..."
apt upgrade -y


echo ">>> XFCE4 masaüstü ortamı ve Xorg bileşenleri kuruluyor..."
DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies xorg dbus-x11
TMP_DEB="/tmp/nomachine_${NOMACHINE_VERSION}_amd64.deb"

echo ">>> NoMachine paketi indiriliyor: ${NOMACHINE_DEB_URL}"
wget -O "${TMP_DEB}" "${NOMACHINE_DEB_URL}"

echo ">>> NoMachine paketi kuruluyor..."
apt install -y "${TMP_DEB}"


echo ">>> NoMachine sunucu yeniden başlatılıyor..."
/etc/NX/nxserver --restart || true

echo ">>> NoMachine durumu:"
/etc/NX/nxserver --status || true


if command -v ufw >/dev/null 2>&1; then
  echo ">>> UFW bulundu. 4000/tcp portu açılıyor..."
  ufw allow 4000/tcp || true
  ufw reload || true
else
  echo ">>> UFW bulunamadı, firewall adımı atlanıyor."
fi


if id "${TARGET_USER}" >/dev/null 2>&1; then
  echo ">>> Kullanıcı zaten mevcut: ${TARGET_USER}"
else
  echo ">>> Yeni kullanıcı oluşturuluyor: ${TARGET_USER}"
  adduser --gecos "" "${TARGET_USER}"
  echo ">>> ${TARGET_USER} sudo grubuna ekleniyor..."
  usermod -aG sudo "${TARGET_USER}"
fi


USER_HOME=$(eval echo "~${TARGET_USER}")

echo ">>> ${TARGET_USER} için XFCE oturum dosyaları oluşturuluyor..."
su - "${TARGET_USER}" -c 'echo "startxfce4" > ~/.xsession'
su - "${TARGET_USER}" -c 'echo "startxfce4" > ~/.xinitrc'

chown "${TARGET_USER}:${TARGET_USER}" "${USER_HOME}/.xsession" "${USER_HOME}/.xinitrc"


echo ">>> Kurulum tamamlandı!"
echo "----------------------------------------------"
echo "Artık NoMachine istemcisinden şu bilgilerle bağlanabilirsin:"
echo "  - Kullanıcı adı : ${TARGET_USER}"
echo "  - Port          : 4000 (NX protokolü)"
echo "----------------------------------------------"
