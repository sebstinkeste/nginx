#!/bin/bash
set -e

#
# set localtime
ln -sf /usr/share/zoneinfo/${LOCALTIME:-Europe/Paris} /etc/localtime

#
# functions

function set_conf {
    echo ''>$2; IFSO=$IFS; IFS=$(echo -en "\n\b")
    for c in `printenv|grep $1`; do echo "`echo $c|cut -d "=" -f1|awk -F"$1" '{print $2}'` $3 `echo $c|cut -d "=" -f2`" >> $2; done;
    IFS=$IFSO
}

set_conf '/etc/nginx/nginx2.conf' 

# Run
if [[ ! -z "$1" ]]; then
    exec ${*}
else
    exec nginx -g 'daemon off;'
fi
