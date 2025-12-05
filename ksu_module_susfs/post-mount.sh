#!/system/bin/sh
PATH=/data/adb/ksu/bin:$PATH

## Tell kernel that the meta module should finished mount already ##
ksud kernel notify-module-mounted
