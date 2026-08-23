#!/usr/bin/env zsh

set -o pipefail

abort_deploy() {
  return 1 2>/dev/null || exit 1
}

SCRIPT_PATH=${(%):-%N}
SCRIPT_DIR=$(cd "$(dirname "$SCRIPT_PATH")"; pwd -P)
IDEAVIM_SOURCE=$SCRIPT_DIR/ideavimrc.vim

if [[ -z "$WSL_DISTRO_NAME" ]]; then
  echo -e "${Red}este deploy deve rodar no WSL.${Rst}"
  abort_deploy
fi

if ! command -v powershell.exe >/dev/null 2>&1; then
  echo -e "${Red}powershell.exe não encontrado no WSL.${Rst}"
  abort_deploy
fi

WINDOWS_USER=$(powershell.exe -NoProfile -Command '$env:USERNAME' 2>/dev/null | tr -d '\r\n')
if [[ -z "$WINDOWS_USER" ]]; then
  echo -e "${Red}não foi possível descobrir o usuário do Windows.${Rst}"
  abort_deploy
fi

WINDOWS_HOME=/mnt/c/Users/$WINDOWS_USER
IDEAVIM_TARGET=$WINDOWS_HOME/.ideavimrc

if [[ ! -d "$WINDOWS_HOME" ]]; then
  echo -e "${Red}home do Windows não encontrada:${Rst} $WINDOWS_HOME"
  abort_deploy
fi

if [[ ! -f "$IDEAVIM_SOURCE" ]]; then
  echo -e "${Red}arquivo de origem não encontrado:${Rst} $IDEAVIM_SOURCE"
  abort_deploy
fi

cp "$IDEAVIM_SOURCE" "$IDEAVIM_TARGET"
echo -e "${Green}copiado:${Rst} $IDEAVIM_SOURCE ${Green}->${Rst} $IDEAVIM_TARGET"