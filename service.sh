until [ -f "${0%/*}/topdalao" ]; do
	sed -i 's/\[.*\]/\[ 文件topdalao丢失，请重新安装模块重启 \]/g' "${0%/*}/module.prop" > /dev/null 2>&1
	sleep 5
done
sleep 5
MODDIR=${0%/*}
chmod 0755 "$MODDIR/AdGuardHome"
chmod 0755 "$MODDIR/topdalao"
chmod 0755 "$MODDIR/update_sh"
chmod 0755 "$MODDIR/testing.sh"
chmod 0755 "$MODDIR/up"
chmod 0644 "$MODDIR/mode.conf"
chmod 0644 "$MODDIR/AdGuardHome.yaml"
sleep 1
echo "rm -f \"$MODDIR/stop\"" > "$MODDIR/恢复过滤.sh"
echo "touch \"$MODDIR/stop\"" > "$MODDIR/暂停过滤.sh"
chmod 0755 "$MODDIR/恢复过滤.sh"
chmod 0755 "$MODDIR/暂停过滤.sh"
echo "#执行该脚本，跳转微信网页给作者投币捐赠" > "$MODDIR/.投币捐赠.sh"
echo "am start -n com.tencent.mm/.plugin.webview.ui.tools.WebViewUI -d https://payapp.weixin.qq.com/qrpay/order/home2?key=idc_CHNDVI_dHFNbTNZIWMDKIEdx0ZtCA-- >/dev/null 2>&1" >> "$MODDIR/.投币捐赠.sh"
echo "echo \"\"" >> "$MODDIR/.投币捐赠.sh"
echo "echo \"正在跳转AdHome模块捐赠页面，请稍等。。。\"" >> "$MODDIR/.投币捐赠.sh"
chmod 0755 "$MODDIR/.投币捐赠.sh"
"$MODDIR/AdGuardHome" > /dev/null 2>&1 &
up=1
while true ; do
if [ "$up" = "20" -o "$up" = "7200" ]; then
	"$MODDIR/up" > /dev/null 2>&1 &
	up=21
fi
sleep 3
"$MODDIR/topdalao" > /dev/null 2>&1
up="$(( $up + 1 ))"
done
