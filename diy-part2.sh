#!/bin/bash
# 后台IP改为 192.168.31.1
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# 无线设置为中国区域
sed -i 's/wireless.country=.*/wireless.country=CN/g' package/base-files/files/bin/config_generate

# USB3.0 满血优化
echo "options xhci-hcd enable=1 turbo=1" >> package/base-files/files/etc/modules.conf
