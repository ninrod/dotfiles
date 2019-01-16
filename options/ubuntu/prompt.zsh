# prompt config: nice unicode prompt chars: λ , › , ➤ , ∴ , → , ★ , ➜ , ❯, $
DOT_PROMPT_CHAR="➜"

SHELL_PROMPT_INFO_LEVEL="0"

hn=$(hostname)
if [[ $hn:l == *"droplet"* ]]; then
  SHELL_PROMPT_INFO_LEVEL="2"
fi
