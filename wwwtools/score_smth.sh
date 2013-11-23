#!/bin/bash

BOARDNAME="$1"
BOARDURL="http://www.newsmth.net/bbsdoc.php?board=${BOARDNAME}&ftype=6"

curl "${BOARDURL}" |
  iconv -f gbk -t utf8 > /tmp/brd

ARTID=$(grep '版面积分变更记录' /tmp/brd | tail -n1 | grep -Po '(?<=\()[0-9]*,')
BID=$(grep 'new docWriter' /tmp/brd | awk -F ',' '{print $2}')
TARGETURL="http://www.newsmth.net/bbscon.php?bid=${BID}&id=${ARTID}"
curl "${TARGETURL}" | iconv -f gbk -t utf8 > /tmp/brd2
grep -Po '[↑↓][0-9]*' /tmp/brd2

