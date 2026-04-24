#!/bin/bash
# 修改默认管理IP为 192.168.99.1
sed -i 's/192.168.1.1/192.168.99.1/g' package/base-files/files/bin/config_generate

# 设备名改为 新路由3
sed -i 's/Xiaomi Mi Router 3 Pro/新路由3/g' target/linux/mt7621/base-files/etc/board.d/02_network
sed -i 's/MI-R3P/Newifi3/g' target/linux/mt7621/base-files/etc/board.d/01_leds

# 无线性能拉满、关闭省电、拉满发射功率
sed -i '/power_save/d' package/network/config/wifi-files/files/wireless
echo "option txpower 25" >> package/network/config/wifi-files/files/wireless

# USB3.0 满血优化、解除降频、抗干扰
echo "echo 1 > /sys/kernel/debug/usb/usb3_lpm_disable" >> package/base-files/files/etc/rc.local
echo "echo 0 > /sys/bus/usb/devices/*/power/autosuspend" >> package/base-files/files/etc/rc.local

# 时区东八区
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate
