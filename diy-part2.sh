#!/bin/bash
# 核心修改：IP、时区、无线、USB、主题
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate

# 无线拉满、关闭省电
sed -i '/option power_save/d' package/network/config/wifi-files/files/wireless
echo -e "option txpower '25'" >> package/network/config/wifi-files/files/wireless

# USB3.0满血优化
echo "echo 1 > /sys/kernel/debug/usb/usb3_lpm_disable" >> package/base-files/files/etc/rc.local

# 默认主题设为Argon
sed -i 's/bootstrap/argon/g' package/base-files/files/etc/config/luci

