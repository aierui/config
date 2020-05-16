#######################
## defined function ##
#######################

function wip() {
    /sbin/ifconfig en0|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function aip() {
    /sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function ip_addr() {
    if [ -n "$(wip)" ]; then
        wip
    else
        aip
    fi
}

# g_os = 'unknown'

function os(){
  if [ "$(uname)"=="Darwin" ]; then
    g_os="Mac"
  elif [ "$(expr substr $(uname -s) 1 5)"=="Linux" ]; then
    g_os="Linux"
  elif [ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]; then
    g_os="Win"
  fi
}


function hostname(){
  if [ "$(uname)"=="Darwin" ]; then
    scutil --get ComputerName
  else
    echo "Not Support!"
    #exit
  fi
}

function realpath ()                                                                                                                                                                                   
{                                                                                                                                                                                             
    f=$@;                                                                                                                                                                                     
    if [ -d "$f" ]; then                                                                                                                                                                      
        base="";                                                                                                                                                                              
        dir="$f";                                                                                                                                                                             
    else                                                                                                                                                                                      
        base="/$(basename "$f")";                                                                                                                                                             
        dir=$(dirname "$f");                                                                                                                                                                  
    fi;                                                                                                                                                                                       
    dir=$(cd "$dir" && /bin/pwd);                                                                                                                                                             
    echo "$dir$base"                                                                                                                                                                          
}    
