#!/usr/bin/env bash
set -euo pipefail


# Inicia o IntelliJ desatrelado do terminal e silencia todos os logs de saída
nohup /usr/local/bin/idea "$@" >/dev/null 2>&1 &

# Desassocia o processo filho da sessao atual do subshell
disown
