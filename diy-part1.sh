#!/bin/bash
# 添加Argon主题源
echo "src-git argon https://github.com/jerrykuku/luci-theme-argon.git" >> feeds.conf.default
echo "src-git argonapp https://github.com/jerrykuku/luci-app-argon-config.git" >> feeds.conf.default

# 更新并安装软件源
./scripts/feeds update -a
./scripts/feeds install -a
