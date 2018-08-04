#!/usr/bin/env bash
set -euo pipefail

# nohup ~/apps/idea/bin/idea.sh > ~/.logs/idea.log 2>&1 &
(
trap - SIGINT
exec /bin/bash ~/apps/idea/bin/idea.sh "$*"
) &