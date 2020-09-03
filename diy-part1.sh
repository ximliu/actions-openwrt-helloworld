#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages

# Lienol/openwrt-package
rm -rf package/openwrt-packages/luci-app-passwall && svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
rm -rf package/openwrt-packages/luci-app-ssr-plus && svn co https://github.com/fw876/helloworld package/openwrt-packages/helloworld

# 添加passwall依赖库
# git clone https://github.com/kenzok8/small package/small
svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/small

#Clone source code and add packages
git clone https://github.com/tty228/luci-app-serverchan package/myapp/luci-app-serverchan
git clone https://github.com/liwenjie119/luci-app-koolproxyR package/myapp/luci-app-koolproxyR
git clone https://github.com/vernesong/OpenClash package/myapp/luci-app-openclash
git clone https://github.com/frainzy1477/luci-app-clash package/myapp/luci-app-clash
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
