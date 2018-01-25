#! /usr/bin/env bash

# to use, define a hosts file $servers with the following contents:

# blahblah.com       - My delicious server
# ilovemyserver.org  - My other server
# so.on.and.so.forth - ...

user=myuser
servers=/root/.secret/servers_quick_list
description=$(cat $servers | fzf)
server=$(echo $description | cut -d "-" -f1)

[[ -n $server ]] && exec ssh $server -l $user

