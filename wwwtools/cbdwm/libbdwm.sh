bbs_login(){
    # usage: bbs_login user pass
    curl -c "/tmp/cookie.$1" "https://www.bdwm.net/bbs/bbsauth.php?userid=$1&passwd=$2" | grep -q \
	'\"result\":0'
}

bbs_logout(){
    # usage: bbs_logout user
    curl -b "/tmp/cookie.$1" "http://www.bdwm.net/bbs/bbsout.php?logout=1"
    rm -f "/tmp/cookie.$1"
}

bbs_modsmd(){
    # usage: bbs_modsmd user [file]
    # warning: bdwm.net does not support 100-continue, so smd >1024 bytes is not allowed
    local cookiefile="/tmp/cookie.$1"
    shift
    local mysmd="$(iconv -c -t gbk $@)"
    curl --data-urlencode "plan=${mysmd}" \
        -b "${cookiefile}" \
        -H 'Expect:' \
        "http://www.bdwm.net/bbs/bbsplan2.php"
}

bbs_modsign(){
    # usage: bbs_modsign user [file]
    local cookiefile="/tmp/cookie.$1"
    shift
    local mysign="$(iconv -c -t gbk $@)"
    curl --data-urlencode "plan=${mysign}" -d "btn_bbssign=$(printf '\xc8\xb7\xb6\xa8')" \
        -b "${cookiefile}" "http://www.bdwm.net/bbs/bbssign.php"
}
