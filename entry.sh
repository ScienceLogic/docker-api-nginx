#!/bin/bash

if [ -n "$IPALLOW" ]
then
    IFS=, read -r -d '' -a ip_array < <(printf '%s,\0' "$IPALLOW")
    for ip in "${ip_array[@]}"; do
        printf 'Adding: allow %s;\n' "$ip"
        sed -i '1s@^@allow '"$ip"';\n@' /etc/nginx/conf.d/ip-rules.conf
    done
else
    printf "IPALLOW var is not set!\n"
    printf "Blocking all traffic by default\n"
    #printf "Adding: allow all;\n"
    #sed -i '1s@^@allow all;\n@' /etc/nginx/conf.d/ip-rules.conf
fi

exec "$@"

