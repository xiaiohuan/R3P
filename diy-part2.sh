#!/bin/bash
# 修改默认后台管理IP为192.168.99.1
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# 无线性能优化：关闭省电模式，拉满发射功率
sed -i '/option power_save/d' package/network/config/wifi-files/files/wireless
sed -i '/txpower/d' package/network/config/wifi-files/files/wireless
echo -e "option txpower '25'" >> package/network/config/wifi-files/files/wireless

# USB3.0满血优化，关闭自动休眠、解除限速
echo "echo 1 > /sys/kernel/debug/usb/usb3_lpm_disable" >> package/base-files/files/etc/rc.local
echo "echo 0 > /sys/bus/usb/devices/*/power/autosuspend" >> package/base-files/files/etc/rc.local

# 设置时区为东八区北京时间
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate

# 强制默认主题为Argon，禁用默认bootstrap主题
sed -i 's/bootstrap/argon/g' package/base-files/files/etc/config/luci
