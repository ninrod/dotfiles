# colors: magenta, green, blue,cyan, yellow, red
# prompt chars: ,λ ,› ,➤ ,∴ ,→ ,★ ,➜ ,❯

build_prompt_char() {
  local pc="$DOT_PROMPT_CHAR"

  if [[ "${SHELL_IS_DOCKERIZED}" == "true" ]] && [[ -n ${DOT_DOCKER_PROMPT_CHAR+x} ]]; then
    pc="$DOT_DOCKER_PROMPT_CHAR"
    local prompt_char="%(?.%F{magenta}.%F{red})${pc:-$}%f"
  else
    local prompt_char="%(?.%F{green}.%F{red})${pc:-$}%f"
  fi

  echo -n "$prompt_char"
}

# default: showing whoami@hostname without truncation
PROMPT="%F{blue}%1~%f %F{cyan}%n%f%F{red}@%f%F{yellow}%m%f $(build_prompt_char) "
PROMPT_INFO_LEVEL=$SHELL_PROMPT_INFO_LEVEL
if [[ "${SHELL_IS_DOCKERIZED}" == "true" ]] && [[ -n ${SHELL_DOCKER_PROMPT_INFO_LEVEL+x} ]]; then
  PROMPT_INFO_LEVEL=$SHELL_DOCKER_PROMPT_INFO_LEVEL
fi

# 0: showing only PWD with trunction
# 1: showing @hostname and with truncation
# 2: showing whaami@hostname and with truncation
if [[ "${PROMPT_INFO_LEVEL}" == "0"  ]]; then
  PROMPT="%F{blue}%15<...<%1~%<<%f $(build_prompt_char) "
  # PROMPT="$(build_prompt_char) "
elif [[ "${PROMPT_INFO_LEVEL}" == "1"  ]]; then
  PROMPT="%F{blue}%13<...<%1~%<<%f %F{red}@%f%F{yellow}%m%f $(build_prompt_char) "
elif [[ "${PROMPT_INFO_LEVEL}" == "2"  ]]; then
  PROMPT="%F{blue}%13<...<%1~%<<%f %F{cyan}%n%f%F{red}@%f%F{yellow}%m%f $(build_prompt_char) "
fi
