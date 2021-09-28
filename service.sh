MODDIR=${0%/*} ;
chmod +x $MODDIR/AdGuardHome ;
chmod +x $MODDIR/topdalao ;
chmod +x $MODDIR/update_sh ;
chmod +x $MODDIR/testing.sh ;
chmod +x $MODDIR/up ;
$MODDIR/AdGuardHome > /dev/null 2>&1 & 
until [ $(getprop sys.boot_completed) -eq 1 ] ; do 
  sleep 5 ;
done ;
up=1
while : ;
do 
if [ "$up" = "20" -o "$up" = "7200" ]; then 
	$MODDIR/up > /dev/null 2>&1 &
	up=21 ;
fi ;
$MODDIR/topdalao > /dev/null 2>&1 ;
up=$(( $up + 1 )) ;
sleep 3 ;
done ;

