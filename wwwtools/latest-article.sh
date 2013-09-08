#!/bin/bash

# colors
RED='1;31'
GREEN='1;32'
NORM='0'
msg(){
        printf "\033[$2m$1\033[${NORM}m\n" >&2
}

CACHEDIR="$HOME/.cache/bbs-latest"
install -d ${CACHEDIR}
BOARDNAME="$1"
CONTENTFILE=${CACHEDIR}/last.${BOARDNAME}

if [ ! -n "$1" ]; then
	msg "usage: $0 <boardname>"
	exit 1
fi

w3m -dump http://www.bdwm.net/bbs/bbsdoc.php?board=${BOARDNAME}|grep ^[0-9] \
        > ${CONTENTFILE}.1
if [[ ! -f "${CONTENTFILE}" ]]; then
	cat ${CONTENTFILE}.1
        msg "Generating cachefor board ${BOARDNAME}." ${GREEN}
	EXITCODE=0
elif diff -u ${CONTENTFILE} ${CONTENTFILE}.1 > ${CACHEDIR}/diff ; then
        msg "Board ${BOARDNAME} unchanged." ${GREEN}
	EXITCODE=0
else
	cat ${CACHEDIR}/diff
        msg "New articles found on board ${BOARDNAME}." ${RED}
	EXITCODE=1
fi
mv ${CONTENTFILE}.1 ${CONTENTFILE}
exit ${EXITCODE}

