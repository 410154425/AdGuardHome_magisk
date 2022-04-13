# AdGuardHome_magisk
这是一个让AdGuardHome运行在安卓设备上的去广告magisk模块。

[下载页面](https://github.com/410154425/AdGuardHome_magisk/releases)点击Assets选择压缩包AdHome_Magisk_***.zip，使用Magisk从本地安装。

通过DNS的方式过滤广告、防DNS劫持，本机流量数据或Wifi都支持，不用其它设置，刷入即可用。

AdHome后台管理地址127.0.0.1:3000，用户名root，密码root，可兼容VPN、免模块、翻模块、校园网、热点共享等特殊使用环境。 

支持订阅过滤规则，在AdHome后台-过滤器-dns封锁清单添加修改。

有3种模式，支持息屏不过滤功能，模式切换配置文件：/data/adb/modules/AdGuardHome/mode.conf。

安卓9或以上需要关闭设置中的私人dns，不可用wap接入点，否则模块无效。


