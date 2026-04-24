#!/bin/bash
# 1. 修改后台IP为192.168.99.1
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# 2. 设置时区为东八区
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate

# 3. USB3.0满血优化（保持不变）
echo "echo 1 > /sys/kernel/debug/usb/usb3_lpm_disable" >> package/base-files/files/etc/rc.local

# 4. 无线性能优化（换用新的配置方式）
# 不直接修改不存在的wireless文件，改为在uci-defaults里设置
cat > package/base-files/files/etc/uci-defaults/99-wifi-tune << EOF
#!/bin/sh
uci set wireless.radio0.txpower='25'
uci set wireless.radio1.txpower='25'
uci set wireless.radio0.power_save='0'
uci set wireless.radio1.power_save='0'
uci commit wireless
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-wifi-tune

# 5. 设置默认主题为Argon（换用新的方式）
mkdir -p package/base-files/files/etc/uci-defaults
cat > package/base-files/files/etc/uci-defaults/99-theme << EOF
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-theme

