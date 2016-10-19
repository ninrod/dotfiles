# char options: ❯, λ, ➜, ∴
build_prompt_char() {
  local pc=${DOT_PROMPT_CHAR:-$}
  if [[ -n ${2+x} ]]; then
    pc="$2"
  fi
  local prompt_char="%(?.%F{$1}.%F{red})${pc}%f"
  echo -n "$prompt_char"
}

# default: showing whoami@hostname without truncation
# 1: simplest with directory truncation
# 2: showing whaami@hostname and with truncation
PROMPT='%F{blue}%1~%f %F{cyan}%n%f%F{red}@%f%F{yellow}%m%f %F{magenta}#%f  '
if [[ "${SHELL_PROMPT_INFO_LEVEL}" == "1" ]]; then
  PROMPT="%F{blue}%15<...<%1~%<<%f $(build_prompt_char magenta)  "
elif [[ "${SHELL_PROMPT_INFO_LEVEL}" == "2" ]]; then
  PROMPT="%F{blue}%10<...<%1~%<<%f %F{cyan}%n%f%F{red}@%f%F{yellow}%m%f %F{magenta}#%f  "
fi
