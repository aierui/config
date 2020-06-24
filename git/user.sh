#/bin/bash

function github() {
    git config user.name "aierui"
    git config user.email "aieruishi@gmail.com"
}

function didi() {
	echo "account is "$DIDI_ACCOUNT
    git config user.name $DIDI_ACCOUNT
    git config user.email "$DIDI_ACCOUNT@didiglobal.com"
}

case "$1" in
	github)
		github
	;;
	didi)
		didi
	;;
esac

echo "$1 finished setting." 