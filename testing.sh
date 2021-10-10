#!/system/bin/sh
#
#如发现模块BUG，执行此脚本文件，把结果截图给作者，谢谢！
#
topwcl=`dumpsys connectivity | grep 'NetworkAgentInfo{' | grep -v 'ims' | grep -v 'type: VPN' | wc -l` ;
topDns=`dumpsys connectivity | grep 'NetworkAgentInfo{' | grep -v 'ims' | grep -v 'type: VPN' | sed -n 's/.*DnsAddresses\:\ \[//g;s/\].*//g;s/ //g;s/\///g;s/\,/\n/g;p' | grep -v ':'` ;
topNetwork=`dumpsys connectivity | grep 'NetworkAgentInfo{' | grep -v 'ims'` ;
mode=`cat "/data/adb/modules/AdGuardHome/module.prop" | egrep '^description=' | sed -n 's/.*=\[//g;s/\].*//g;p'` ;
echo --------- 获取dns ---------- ;
echo $topwcl,$topDns ;
echo ---------- 模式 ------------ ;
echo $mode ;
echo ------- nat_TOPHOME -------- ;
    iptables -t nat -n -L TOPHOME ;
echo -------- nat_OUTPUT -------- ;
    iptables -t nat -n -L OUTPUT ;
echo --- ipv6_filter_OUTPUT ----- ;
    ip6tables -t filter -n -L OUTPUT ;
echo ---------- 信息 ------------ ;
echo $topNetwork ;
