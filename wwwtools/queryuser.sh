#!/bin/bash

w3m -dump http://www.bdwm.net/bbs/bbsqry.php?name="$1" | sed '1,4d'

