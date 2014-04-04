# This file is for board bookmark

bbs_brdadd(){
    # bbs_brdadd <user> <brd>
    curl -b "/tmp/cookie.$1" "http://bdwm.net/bbs/bbsbrdadd.php?mybrd=$2"
}

bbs_brddel(){
    # bbs_brddel <user> <brd>
    curl -b "/tmp/cookie.$1" "http://bdwm.net/bbs/bbsbrddel.php?mybrd=$2"
}
