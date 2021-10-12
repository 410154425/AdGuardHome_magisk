# AdGuardHome_magisk
这是一个让AdGuardHome运行在安卓设备上的去广告magisk模块。

[下载页面](https://github.com/410154425/AdGuardHome_magisk/releases)选择压缩包Adguardhome._magisk_***.zip，使用Magisk从本地安装。

用于过滤广告、防DNS劫持，本机流量数据或Wifi都支持，不用其它设置，刷入即可用。

如需添加其它过滤规则，ADGH后台管理地址127.0.0.1:3000，用户名root，密码root，可兼容VPN、免流、校园网、热点等特殊使用环境。 

支持自定义过滤规则订阅源，在ADGH后台-过滤器-dns封锁清单添加修改。

模式切换配置文件：/data/adb/modules/AdGuardHome/mode.conf。

安卓9或以上需要关闭设置中的私人dns，否则模块无效。

