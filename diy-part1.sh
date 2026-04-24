#!/bin/bash
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
