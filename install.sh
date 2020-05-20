#/bin/bash

dirPath=$(
    cd $(dirname $0)
    pwd
)
LOG_FILE=/tmp/aierui_config_install.log

function log() {
    echo "$*"
    echo ">> $(date) $*" >>${LOG_FILE}
}

function run() {
    log "@$*"
    # shellcheck disable=SC2068
    $@ >>${LOG_FILE} 2>&1
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    devPath=/Users/develop
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    devPath=/data1/develop
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    devPath=/data1/develop
else
    exit
fi

run mkdir -p ${devPath}/aierui/config

if type git >/dev/null 2>&1; then
    log 'exists already installed'
else
    run yum install -y git
fi

run rm -rf ${devPath}/aierui/config
run cd ${devPath}/aierui/config && git clone https://github.com/aierui/config.git ./

run ${devPath}/aierui/config/start.sh
