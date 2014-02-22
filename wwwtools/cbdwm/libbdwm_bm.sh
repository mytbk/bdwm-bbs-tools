bbs_rangedel(){
    # usage: bbs_rangedel <user> <board> <start> <end>
    curl -b "/tmp/cookie.$1" "http://www.bdwm.net/bbs/bbsrdel.php?board=$2&start=$3&end=$4"
}

bbs_bmoper(){
    # usage: bbs_bmoper <user> <board> <act> <id1> [id2...]
    local cookiefile="/tmp/cookie.$1"
    local myurl="http://www.bdwm.net/bbs/bbsbmboard.php?board=$2&act=$3"
    shift 3
    while [ -n "$1" ]
    do
        myurl="${myurl}&filenum[]=$1"
        shift
    done
    curl -b "${cookiefile}" -g "${myurl}"
}
