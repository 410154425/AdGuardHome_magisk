#!/system/bin/sh
#
#如发现模块BUG，执行此脚本文件，把结果截图给作者，谢谢！
#
MODDIR=${0%/*}
NetworkAgentInfo="$(dumpsys connectivity | egrep 'NetworkAgentInfo{' | egrep -v 'ims')"
Network="$(echo "$NetworkAgentInfo" | egrep 'type: WIFI')"
if [ "$Network" = "" ]; then
	Network="$NetworkAgentInfo"
fi
HostDns="$(echo "$Network" | egrep -v 'type: VPN' | sed -n 's/.*DnsAddresses: \[//g;s/\].*//g;s/ //g;s/\///g;s/,/\\n/g;p')"
HostDns_n="$(echo -e "$HostDns" | egrep -v ':')"
mode="$(cat "$MODDIR/module.prop" | egrep '^description=' | sed -n 's/.*=\[//g;s/\].*//g;p')"
start="$(ps -ef | egrep 'AdGuardHome' | egrep -v 'egrep')"
module_version="$(cat "$MODDIR/module.prop" | egrep 'version=' | sed -n 's/.*version=//g;$p')"
module_versionCode="$(cat "$MODDIR/module.prop" | egrep 'versionCode=' | sed -n 's/.*versionCode=//g;$p')"
echo --------- 版本 ----------
echo "$module_version","$module_versionCode"
echo --------- 获取dns ----------
echo "$HostDns_n"
echo ---------- 模式 ------------
echo "$mode"
echo "$start"
echo --------- 设备信息 ----------
echo "serialno.$(getprop ro.serialno | sed -n 's/ //g;$p'),release.$(getprop ro.build.version.release | sed -n 's/ //g;$p'),sdk.$(getprop ro.build.version.sdk | sed -n 's/ //g;$p'),brand.$(getprop ro.product.brand | sed -n 's/ //g;$p'),model.$(getprop ro.product.model | sed -n 's/ //g;$p')"
echo ------- nat_TOPHOME --------
    iptables -t nat -n -L TOPHOME
echo -------- nat_OUTPUT --------
    iptables -t nat -n -L OUTPUT
echo --- ipv6_filter_OUTPUT -----
    ip6tables -t filter -n -L OUTPUT
echo --------- 网络信息 ----------
echo "$NetworkAgentInfo"
