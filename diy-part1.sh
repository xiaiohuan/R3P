#!/bin/bash
# 清空默认feeds，避免冲突
sed -i 's/^src-git/#src-git/g' feeds.conf.default

# 官方基础源 + Argon主题源
echo 'src-git lede https://github.com/coolsnowwolf/lede' >> feeds.conf.default
echo 'src-git packages https://github.com/openwrt/packages.git^master' >> feeds.conf.default
echo 'src-git luci https://github.com/openwrt/luci.git^master' >> feeds.conf.default
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git' >> feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a
