#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.logs

nohup ~/apps/idea/bin/idea.sh > ~/.logs/idea.log 2>&1 &