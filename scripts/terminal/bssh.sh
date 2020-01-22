#!/usr/bin/env bash

# bssh: fuzzy ssh chooser
# credits: original hack by @marvinbelfort

set -euo pipefail

if [[ ! -f $BSSH_SERVERS_FILE ]]; then
  echo "[bssh]-> ERROR: no $BSSH_SERVERS_FILE file found."
  exit 0
fi

description=$(cat $BSSH_SERVERS_FILE | fzf)
server=$(echo $description | cut -d "-" -f1)

if [[ ! -z $server ]]; then
  # ping $server
  ssh $server -o ServerAliveInterval=5 -o ServerAliveCountMax=1
fi

# to copy your public key to a server
# ssh-copy-id -i ~/.ssh/id_rsa.pub user@host
