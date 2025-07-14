#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 默认网关 ip 地址修改
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/luci2/bin/config_generate

sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

## golang 为 1.24.x
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

rm -rf feeds/packages/net/mosdns
rm -rf package/feeds/packages/mosdns

rm -rf package/feeds/luci/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-mosdns

rm -rf feeds/packages/net/v2ray-geodata
rm -rf package/feeds/packages/v2ray-geodata

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon/*
cp -af package/luci-theme-argon/*  feeds/luci/themes/luci-theme-argon/
