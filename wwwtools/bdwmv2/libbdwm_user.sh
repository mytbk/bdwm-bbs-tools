bbs_login(){
	# usage: bbs_login user pass
	curl -c "/tmp/cookie.$1" \
		-d "username=$1" \
		-d "password=$2" \
		https://bdwm.net/v2/ajax/login.php \
		| grep -Fq true
}

bbs_logout(){
	# usage: bbs_logout user
	# always return 0
	curl -b "/tmp/cookie.$1" https://bdwm.net/v2/ajax/logout.php
	rm -f "/tmp/cookie.$1"
}

bbs_setpass(){
	# usage: bbs_setpass user oldpass newpass
	curl -b "/tmp/cookie.$1" \
		-d "password=$2" \
		-d "newpass=$3" \
		https://bdwm.net/v2/ajax/set_password.php \
		| grep -Fq true
}

bbs_set_signatures(){
	# usage: bbs_set_signatures user [file]
	# in the v2 web, the posted signature uses json format,
	# you can see in the examples
	local cookiefile="/tmp/cookie.$1"
	shift
	local mysig="$(cat $1)"
	curl --data-urlencode "signatures=${mysig}" \
		-b "${cookiefile}" \
		https://bdwm.net/v2/ajax/set_signatures.php \
		| grep -Fq true
}

