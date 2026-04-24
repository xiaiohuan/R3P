#!/bin/bash
# 只拉取必要插件源，无多余冲突
echo "src-git small https://github.com/kenzok8/small.git" >> feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
#!/bin/bash
# 不添加任何第三方插件源，只用LEDE官方源
