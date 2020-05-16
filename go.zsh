#######################
####### GO ENV ########
#######################

# export GOROOT="${DEV_PATH}/go-core-lib/1.13.0"
# export GOROOT="${DEV_PATH}/go-core-lib/1.13.5"
export GOROOT="${DEV_PATH}/go-core-lib/1.14.3"
export GOPATH="${DEV_PATH}/go-training"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN
# Enable the go modules feature
# export GO111MODULE=on
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.cn,direct
# export GOPROXY=https://goproxy.cn
# export GOFLAGS=-mod=vendor