#!/bin/bash
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
sed -i 's/wireless.country=.*/wireless.country=CN/g' package/base-files/files/bin/config_generate
echo "options xhci-hcd enable=1 turbo=1" >> package/base-files/files/etc/modules.conf
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
