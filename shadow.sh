#!/bin/sh

#--------------------------------------------
#-This is start script for ShadowSocks
#@@@ add by SinTan1071
#--------------------------------------------

PARENTDIR="/home/sintan1071"
SHADOWAPPIMAGE="$PARENTDIR/Shadowsocks-Qt5-3.0.1-x86_64.AppImage"
SHADOWLOG="$PARENTDIR/shell/log/shadow.log"

[ -f /etc/init.d/functions ] && {
    . /etc/init.d/functions
} || {
    . $PARENTDIR/shell/functions
}

runShadow() {
    { nohup $SHADOWAPPIMAGE \
	1>$SHADOWLOG \
   	2>&1 &
    } 
    return 0
}


case "$1" in
    start)
        runShadow || exit 1
        ;;
    *)
        echo "Usage: $0 {start}"
        exit 1
        ;;
esac

