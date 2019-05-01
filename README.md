# Systemless Xposed Framework

### This module is only for Android 5.0 to Android 8.1!

Please install my modified [XposedInstaller(3.1.5)](https://forum.xda-developers.com/attachment.php?attachmentid=4751403&d=1556682769) to properly detect Systemless Xposed.

The APK is signed by my personal key, you might need to uninstall other versions before installing mine.

The binaries are identical to builds downloaded from official links [https://dl-xda.xposed.info/framework/](https://dl-xda.xposed.info/framework/), with the exception that `app_process*` is patched with the following command:

`sed -i 's:/system/xposed.prop\x0:/sbin/xposed.prop\x0\x0\x0:g' app_process*`

This module most likely will never get any updates in the future, since @rovo89 seems to have stopped development. This module is here for historical reasons.
