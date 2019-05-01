#!/system/bin/sh
MODDIR=${0%/*}
DISABLE=/data/data/de.robv.android.xposed.installer/conf/disabled
MIRRDIR=/sbin/.magisk/mirror

[ -f $DISABLE ] && exit

cp -f $MODDIR/xposed.prop /sbin/xposed.prop
chcon u:object_r:system_file:s0 /sbin/xposed.prop

API=`getprop ro.build.version.sdk`
[ "$API" -ne 22 ] && exit

# Cleanup
if [ -f $MODDIR/lists ]; then
  for dir in `cat $MODDIR/lists`; do
    rm -rf $MODDIR$dir 2>/dev/null
  done
fi
rm -f $MODDIR/lists

for ODEX in `find /system -type f -name "*.odex*" 2>/dev/null`; do
  # Rename the odex files
  mkdir -p $MODDIR${ODEX%/*}
  touch $MODDIR${ODEX%/*}/.replace
  ln -s $MIRRDIR$ODEX $MODDIR${ODEX}.xposed
  # Record so we can remove afterwards
  echo ${ODEX%/*} >> $MODDIR/lists
done
for BOOT in `find /system/framework -type f -name "boot.*" 2>/dev/null`; do
  ln -s $MIRRDIR$BOOT $MODDIR$BOOT 2>/dev/null
done
