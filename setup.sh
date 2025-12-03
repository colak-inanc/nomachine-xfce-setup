#!/usr/bin/env bash
set -e

TARGET_USER="user"
USER_PASSWORD="yourpass1!"

NOMACHINE_MAJOR="9.2"
NOMACHINE_VERSION="9.2.18_3"
NOMACHINE_DEB_URL="https://download.nomachine.com/download/${NOMACHINE_MAJOR}/Linux/nomachine_${NOMACHINE_VERSION}_amd64.deb"
TMP_DEB="/tmp/nomachine_${NOMACHINE_VERSION}_amd64.deb"

if [ "$(id -u)" -ne 0 ]; then
  echo "Bu script root olarak çalıştırılmalı. (sudo ./setup-nomachine-xfce.sh)"
  exit 1
fi

DEBIAN_FRONTEND=noninteractive apt update -y
DEBIAN_FRONTEND=noninteractive apt upgrade -y

DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies xorg dbus-x11 wget

wget -O "${TMP_DEB}" "${NOMACHINE_DEB_URL}"
DEBIAN_FRONTEND=noninteractive apt install -y "${TMP_DEB}"

if [ -f /usr/NX/etc/node.cfg ]; then
  if grep -qE '^#?DefaultDesktopCommand' /usr/NX/etc/node.cfg; then
    sed -i 's|^#\?DefaultDesktopCommand.*|DefaultDesktopCommand "/usr/bin/startxfce4"|' /usr/NX/etc/node.cfg
  else
    echo 'DefaultDesktopCommand "/usr/bin/startxfce4"' >> /usr/NX/etc/node.cfg
  fi
fi

/etc/NX/nxserver --restart || true
/etc/NX/nxserver --status || true

if command -v ufw >/dev/null 2>&1; then
  ufw allow 4000/tcp || true
  ufw reload || true
fi

if id "${TARGET_USER}" >/dev/null 2>&1; then
  echo "Kullanıcı zaten mevcut: ${TARGET_USER}"
else
  useradd -m -s /bin/bash "${TARGET_USER}"
  echo "${TARGET_USER}:${USER_PASSWORD}" | chpasswd
  usermod -aG sudo "${TARGET_USER}"
fi

USER_HOME=$(eval echo "~${TARGET_USER}")

su - "${TARGET_USER}" -c 'echo "startxfce4" > ~/.xsession'
su - "${TARGET_USER}" -c 'echo "startxfce4" > ~/.xinitrc'
chown "${TARGET_USER}:${TARGET_USER}" "${USER_HOME}/.xsession" "${USER_HOME}/.xinitrc"

echo "Kurulum tamamlandı."
echo "Kullanıcı: ${TARGET_USER}"
echo "Şifre: ${USER_PASSWORD}"
echo "Port    : 4000 (NX)"
