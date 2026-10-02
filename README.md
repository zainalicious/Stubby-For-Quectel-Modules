# Stubby for Quectel Modules

DNS over TLS (DoT) untuk Quectel OpenLinux / SDXPrairie dengan Entware. Semua query `dnsmasq` di-forward ke Stubby di `127.0.0.1:53`.

### Path
- Binary: `/opt/sbin/stubby` (dari opkg)
- Init: `/opt/etc/init.d/S61stubby` (dari repo ini)
- Config: `/opt/etc/stubby/stubby.yml` (dari repo ini)
- Dnsmasq: `/etc/data/dnsmasq.conf`

### Install Otomatis (1 Baris)

**Via curl:**
```bash
curl -sL https://raw.githubusercontent.com/zainalicious/Stubby-For-Quectel-Modules/main/stubby_install.sh | sh
