SETTINGS_DIR="/Users/ninrod/Library/Application Support/Code/User"
SETTINGS_FILE="${SETTINGS_DIR}/settings.json"

if [[ -d "$SETTINGS_DIR" ]]; then
  if [[ -e "$SETTINGS_FILE" ]] && [[ ! -h "$SETTINGS_FILE" ]]; then
    mv "$SETTINGS_FILE" "${SETTINGS_FILE}.backup"
  elif [[ -h "$SETTINGS_FILE" ]]; then
    rm "$SETTINGS_FILE"
  fi
  ln -s $(readlink -f ~/.dotfiles/vscode/settings.json) "$(readlink -m "$SETTINGS_FILE")";rc=$?
fi
