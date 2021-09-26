#!/system/bin/sh
#
#如发现模块BUG，执行此脚本文件，把结果截图给作者，谢谢！
#
topwcl=`dumpsys connectivity | grep 'NetworkAgentInfo{' | grep -v 'ims' | grep -v 'type: VPN' | wc -l` ;
topDns=`dumpsys connectivity | grep 'NetworkAgentInfo{' | grep -v 'ims' | grep -v 'type: VPN' | sed -n 's/.*DnsAddresses\:\ \[//g;s/\].*//g;s/ //g;s/\///g;s/\,/\n/g;p' | grep -v ':'` ;
topNetwork=`dumpsys connectivity | grep 'NetworkAgentInfo{' | grep -v 'ims'` ;
echo ---------- 统计 ------------ ;
echo $topwcl,$topDns ;
echo ---------- 信息 ------------ ;
echo $topNetwork ;
echo ------- nat_TOPHOME -------- ;
    iptables -t nat -n -L TOPHOME ;
echo --- ipv6_filter_OUTPUT ----- ;
    ip6tables -t filter -n -L OUTPUT ;
echo -------- nat_OUTPUT -------- ;
    iptables -t nat -n -L OUTPUT ;

