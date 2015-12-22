#!/bin/bash
set -e

#
# set localtime
ln -sf /usr/share/zoneinfo/${LOCALTIME:-Europe/Paris} /etc/localtime

#
# functions
function replace_vars() {
  eval "cat <<EOF
  $(<$1)
EOF
  " > $1
}
replace_vars "/etc/nginx/conf.d/default.conf"
# Run
if [[ ! -z "$1" ]]; then
    exec ${*}
else
    exec nginx -g 'daemon on;'
fi
