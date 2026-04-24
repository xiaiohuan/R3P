#!/bin/bash
# 1. 修改后台IP为192.168.99.1
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# 2. 设置时区为东八区
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate

# 3. USB3.0满血优化
echo "echo 1 > /sys/kernel/debug/usb/usb3_lpm_disable" >> package/base-files/files/etc/rc.local

# 4. 无线性能拉满（uci-defaults方式，兼容所有版本）
cat > package/base-files/files/etc/uci-defaults/99-wifi-tune << EOF
#!/bin/sh
uci set wireless.radio0.txpower='25'
uci set wireless.radio1.txpower='25'
uci set wireless.radio0.power_save='0'
uci set wireless.radio1.power_save='0'
uci commit wireless
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-wifi-tune

# 5. 默认主题设为Argon
cat > package/base-files/files/etc/uci-defaults/99-theme << EOF
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-theme

# 6. 开启完整IPv6支持
cat > package/base-files/files/etc/uci-defaults/99-ipv6 << EOF
#!/bin/sh
# 开启LAN IPv6
uci set network.lan.ipv6='auto'
uci set network.lan.force_link='1'
uci set dhcp.lan.dhcpv6='server'
uci set dhcp.lan.ra='server'
uci set dhcp.lan.ra_management='1'
uci commit network
uci commit dhcp
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-ipv6
