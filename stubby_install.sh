#!/bin/sh
# Installer Stubby for Quectel Modules - Final
# https://github.com/zainalicious/Stubby-For-Quectel-Modules

REPO="https://raw.githubusercontent.com/zainalicious/Stubby-For-Quectel-Modules/main"
DNSMASQ_CONF="/etc/data/dnsmasq.conf"

echo "[1/5] Install stubby dari Entware..."
opkg update
opkg install stubby

echo "[2/5] Hapus config bawaan stubby..."
rm -f /opt/etc/stubby/stubby.yml
rm -f /opt/etc/stubby/stubby.yml.default

echo "[3/5] Download file dari repo..."
if command -v curl >/dev/null 2>&1; then
  curl -L -o /opt/etc/init.d/S61stubby $REPO/opt/etc/init.d/S61stubby
  curl -L -o /opt/etc/stubby/stubby.yml $REPO/opt/etc/stubby/stubby.yml
else
  wget -O /opt/etc/init.d/S61stubby $REPO/opt/etc/init.d/S61stubby
  wget -O /opt/etc/stubby/stubby.yml $REPO/opt/etc/stubby/stubby.yml
fi

chmod +x /opt/etc/init.d/S61stubby

echo "[4/5] Konfigurasi dnsmasq..."
touch $DNSMASQ_CONF
# hapus dulu biar tidak duplikat kalau install ulang
sed -i '/^no-resolv/d' $DNSMASQ_CONF
sed -i '/^server=127.0.0.1/d' $DNSMASQ_CONF
echo "no-resolv" >> $DNSMASQ_CONF
echo "server=127.0.0.1" >> $DNSMASQ_CONF

echo "[5/5] Start service..."
/opt/etc/init.d/S61stubby start

echo ""
echo "[OK] Selesai!"
echo "  Binary : /opt/sbin/stubby (dari opkg)"
echo "  Init   : /opt/etc/init.d/S61stubby (dari repo)"
echo "  Config : /opt/etc/stubby/stubby.yml (dari repo)"
echo ""
tail -10 $DNSMASQ_CONF
