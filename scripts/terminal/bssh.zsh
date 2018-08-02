#!/usr/bin/env bash
# credits: original hack by @marvinbelfort
set -euo pipefail
IFS=$'\n\t'

servers=~/.options/bssh.servers
if [[ ! -f $servers ]]; then
  echo "no $servers file found."
  exit 0
fi

description=$(cat $servers | fzf)
server=$(echo $description | cut -d "-" -f1)

if [[ ! -z $server ]]; then
  exec ssh $server -o ServerAliveInterval=5 -o ServerAliveCountMax=1
fi

# to copy your public key to a server
# ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
