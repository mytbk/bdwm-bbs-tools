bbs_addfriend(){
    curl -b "/tmp/cookie.$1" "https://www.bdwm.net/bbs/bbsfrdadd.php?myfrd=$2"
}

bbs_addblack(){
    curl -b "/tmp/cookie.$1" "https://www.bdwm.net/bbs/bbsfrdadd.php?myfrd=$2&reject=1"
}
