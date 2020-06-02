#!/bin/sh

#--------------------------------------------
#-This is start script for Jetbrains software
#@@@ add by SinTan1071
#--------------------------------------------

PARENTDIR="/home/sintan1071"
GOLANDSH="$PARENTDIR/GoLand-2018.3.2/bin/goland.sh"
PYCHARMSH="$PARENTDIR/Pycharm-2018.3.2/bin/pycharm.sh"
WEBSTORM="$PARENTDIR/WebStorm-183.4886.41/bin/webstorm.sh"
JETLOG="$PARENTDIR/shell/log/jetstart.log"

[ -f /etc/init.d/functions ] && {
    . /etc/init.d/functions
} || {
    . $PARENTDIR/shell/functions
}

runGoLand() {
    { nohup sh $GOLANDSH \
	1>$JETLOG \
   	2>&1 &
    } 
    return 0
}

runPyCharm() {
    { nohup sh $PYCHARMSH \
	1>$JETLOG \
        2>&1 &
    }
    return 0
}

runWebStorm() {
    { nohup sh $WEBSTORM \
	1>$JETLOG \
        2>&1 &
    }
    return 0
}

case "$1" in
    goland)
        runGoLand || exit 1
        ;;
    pycharm)
        runPyCharm || exit 1
        ;;
    webstorm)
        runWebStorm || exit 1
        ;;
    *)
        echo "Usage: $0 {goland|pycharm|webstorm}"
        exit 1
        ;;
esac

