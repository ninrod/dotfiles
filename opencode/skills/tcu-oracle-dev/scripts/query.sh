#!/bin/sh
set -eu

skill_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
client_dir=${ORACLE_INSTANT_CLIENT_DIR:-"$HOME/.local/share/oracle/instantclient_19_32"}
if [ ! -f "$client_dir/libclntsh.so.19.1" ]; then
    echo "Oracle Instant Client 19 is missing; configure ORACLE_INSTANT_CLIENT_DIR." >&2
    exit 1
fi
if [ ! -x "$skill_dir/.venv/bin/python" ]; then
    echo "Prepare this skill's virtual environment with sh scripts/setup.sh." >&2
    exit 1
fi
export LD_LIBRARY_PATH="$client_dir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$skill_dir/.venv/bin/python" "$skill_dir/scripts/query.py" --thick "$@"
