#!/usr/bin/env bash
set -euo pipefail


# Inicia o IntelliJ desatrelado do terminal e silencia todos os logs de saída
nohup /opt/idea/bin/idea "$@" >/dev/null 2>&1 &

# Desassocia o processo filho da sessao atual do subshell
disown
