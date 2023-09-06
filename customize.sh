ui_print " -------------------------- "
ui_print " ------ 安装中，请稍等 ------ "
sleep 1
if [ "$IS64BIT" = 'true' ]; then
	cp "$MODPATH/linux_arm64/AdGuardHome" "$MODPATH/AdGuardHome" > /dev/null 2>&1
ui_print " -------------------------- "
else
	cp "$MODPATH/linux_armv7/AdGuardHome" "$MODPATH/AdGuardHome" > /dev/null 2>&1
ui_print " -------------------------- "
fi
sleep 1
rm -d "$MODPATH/linux_arm64"
rm -d "$MODPATH/linux_armv7"
ui_print " ----- 安装已完成，请重启 ---- "
ui_print " -------------------------- "
