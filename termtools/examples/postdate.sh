#!/bin/bash

cd $(dirname $(realpath $0))
source ../bbsfun
post `date -I`|tr -d '-'
echo
# write the article here
iconv -c -t gbk mytext
# end of article
tsave

