#/bin/bash

function github() {
    git config user.name "aierui"
    git config user.email "aieruishi@gmail.com"
}

function xxx() {
	echo "account is "$xxx_ACCOUNT
    git config user.name $xxx_ACCOUNT
    git config user.email "$xxx_ACCOUNT@xxx.com"
}

case "$1" in
	github)
		github
	;;
	xxx)
		xxx
	;;
esac

echo "$1 finished setting." 