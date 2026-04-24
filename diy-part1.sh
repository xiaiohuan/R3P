#!/bin/bash
# 仅添加兼容4.4内核的必要源
sed -i 's/^src-git/#src-git/g' feeds.conf.default
echo 'src-git lede https://github.com/coolsnowwolf/lede' >> feeds.conf.default
echo 'src-git packages https://github.com/openwrt/packages.git^openwrt-21.02' >> feeds.conf.default
echo 'src-git luci https://github.com/openwrt/luci.git^openwrt-21.02' >> feeds.conf.default
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git' >> feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a
