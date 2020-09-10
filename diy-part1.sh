#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# 添加第三方软件包
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/diy/luci-theme-edge
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/diy/luci-theme-infinityfreedom
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone https://github.com/liwenjie119/luci-app-koolproxyR package/myapp/luci-app-koolproxyR
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/garypang13/luci-theme-edge package/luci-theme-edge -b 18.06
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

# 替换更新默认argon主题
rm -rf package/lean/luci-theme-argon && git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon -b 18.06

# 替换更新passwall和ssrplus+
rm -rf package/openwrt-packages/luci-app-passwall && svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
rm -rf package/openwrt-packages/luci-app-ssr-plus && svn co https://github.com/fw876/helloworld package/openwrt-packages/helloworld

# 添加passwall依赖库
# git clone https://github.com/kenzok8/small package/small
svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/small

# 替换更新haproxy默认版本
rm -rf feeds/packages/net/haproxy && svn co https://github.com/lienol/openwrt-packages/trunk/net/haproxy feeds/packages/net/haproxy

# 自定义定制选项
#sed -i 's#192.168.1.1#10.0.0.1#g' package/base-files/files/bin/config_generate #定制默认IP
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings #取消系统默认密码
# sed -i 's#option commit_interval 24h#option commit_interval 10m#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为10分钟
# sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
