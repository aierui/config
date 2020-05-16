#!/usr/bin/expect


set timeout 60

set username [lindex $argv 0]
set password [lindex $argv 1]
set host [lindex $argv 2]

spawn ssh $username@$host
expect "*password*"
send "$password\r"
send "sudo su\r"
send "cd /home\r"
interact

