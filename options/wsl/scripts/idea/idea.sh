#!/usr/bin/env bash
set -euo pipefail


# Inicia o IntelliJ desatrelado do terminal e silencia todos os logs de saída
nohup /opt/idea-IU-262.9437.185/bin/idea "$@" >/dev/null 2>&1 &

# Desassocia o processo filho da sessao atual do subshell
disown
