bbs_login(){
    # usage: bbs_login user pass
    curl -c "/tmp/cookie.$1" "https://www.bdwm.net/bbs/bbsauth.php?userid=$1&passwd=$2"
}

bbs_logout(){
    # usage: bbs_logout user
    curl -b "/tmp/cookie.$1" "http://www.bdwm.net/bbs/bbsout.php?logout=1"
    rm -f "/tmp/cookie.$1"
}

