# Uasge

## Install 

```
brew install lrzsz
```

## Config

```
iTerm->Preferences->Profiles->Advanced->Tirggers->Edit，添加两条规则：

Regular expression: **rz waiting to receive.\*\*B0100**
Action: Run Silent Coprocess
Parameters: /path/to/iterm2-recv-zmodem.sh

Regular expression: **\*\*B00000000000000**
Action: Run Silent Coprocess
Parameters: /path/to/iterm2-send-zmodem.sh
```
