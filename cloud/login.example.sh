#!/bin/bash

allow_ips_list='
	111.111.111.111
'

if [ $# != 1 ]
then
    echo 'ERROR: 请输入需要登录机器IP尾号' ${allow_ips_list};
    exit;
fi

want_login_ip=$1

IP=`echo $want_login_ip | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`

if [[ -n $IP ]]; #直接登录该IP
then
	login_ip=$IP;
else #按照尾数匹配IP

	for ip in ${allow_ips_list}
	do
	 tail_num=`echo $ip | cut -d \. -f 4`
		if [ $tail_num == $want_login_ip ]
		then
			 login_ip=$ip
		   break
		fi
	done

	if [ -z $login_ip ]
	then
	    echo 'ERROR: 输入数字不在可登录机器IP白名单中' ${allow_ips_list};
	    exit;
	fi
fi

echo $login_ip;

dirPath=$(cd `dirname $0`; pwd)
# sce_name="${dirPath##*/}"

case "${login_ip}" in
    '111.111.111.111')
        username='root';
        password='xxx';
    	;;
    *)
    echo $"Please config the IP [$1] login data.😵"
    exit 2
esac

cmd="ssh ${username}@${login_ip}"
echo "${cmd} ${password}";

${dirPath}/interact.sh $username $password $login_ip
