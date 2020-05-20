#/bin/bash

function github() {
    git config user.name "aierui"
    git config user.email "aieruishi@gmail.com"
}

case "$1" in
	github)
		github
	;;
esac

echo "$1 finished setting." 