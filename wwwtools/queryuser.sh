#!/bin/bash
# usage: queryuser.sh [-u <my user id>] <userid>

if [ "$1" == "-u" ]; then
    shift
    MYNAME="$1"
    shift
fi

USERID="$1"

curl -s -b "/tmp/cookie.$MYNAME" "http://www.bdwm.net/bbs/bbsqry.php?name=$USERID" \
    | iconv -f GBK \
    | w3m -dump -T text/html \
    | sed '1,4d'

