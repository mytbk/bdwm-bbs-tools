bbs_maildata(){
    # usage: bbs_maildata user
    curl -b "/tmp/cookie.$1" 'http://www.bdwm.net/bbs/bbsmil.php' \
        | iconv -f GBK > "/tmp/mail.$1.html"
}

bbs_listmail(){
    # usage: bbs_listmail user
    bbs_maildata "$1"
    w3m -T text/html -dump "/tmp/mail.$1.html" | grep '\[ \]'
}

bbs_showmail(){
    # usage: bbs_showmail user mailid
    bbs_maildata "$1"
    LINK=$(grep -o "bbsmlc.php.*num=$2" "/tmp/mail.$1.html")
    curl -b "/tmp/cookie.$1" "http://www.bdwm.net/bbs/$LINK" \
        | iconv -f GBK \
        | w3m -T text/html -dump
}

