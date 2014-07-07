convcode(){
    iconv -c -t GBK "$@"
}

getcode(){ # <user> <board>
    curl -b "/tmp/cookie.$1" \
        "https://www.bdwm.net/bbs/bbspst.php?board=$2" \
        | grep 'name=code ' \
        | awk -F 'value=' '{print $2}' \
        | tr -d '>'
}
    
bbs_newpost(){
    # usage: bbs_newpost <user> <board> <title> [file]
    local USER="$1"
    local BOARD="$2"
    local TITLE=`convcode <<< "$3"`
    shift 3
    local CONTENT="$(convcode $@)"
    curl -b "/tmp/cookie.${USER}" \
        -H 'Expect:' \
        --data-urlencode "title=${TITLE}" \
        -d 'threadid=-1' -d 'postid=-1' \
        -d 'signature=0' -d 'notice_author=0' \
        -d 'noreply=N' -d "id=${USER}" \
        -d "board=${BOARD}" \
        --data-urlencode "text=${CONTENT}" \
            "https://www.bdwm.net/bbs/bbssnd.php"
}

bbs_post(){
    # usage: bbs_post <user> <board> <title> <tid> <pid> [filef]
    local USER="$1"
    local BOARD="$2"
    local TITLE=`convcode <<< "$3"`
    local TID="$4"
    local PID="$5"
    shift 5
    local CONTENT="$(convcode $@)"
    curl -b "/tmp/cookie.${USER}" \
        -H 'Expect:' \
        -d "board=${BOARD}" \
        -d "threadid=${TID}" -d "postid=${PID}" \
        -d "id=${USER}" \
        --data-urlencode "title=${TITLE}" \
        --data-urlencode "title_exp=${TITLE}" \
        -d 'signature=0' -d 'notice_author=0' \
        -d 'noreply=N' -d "id=${USER}" \
        --data-urlencode "text=${CONTENT}" \
            "http://www.bdwm.net/bbs/bbssnd.php"
}
