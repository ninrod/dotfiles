# 3rd party plugin selection
plugin_paths+=(Tarrasch/bd)
plugin_paths+=(ninrod/docker-zsh-completion)
plugin_paths+=(zsh-users/zsh-completions)
plugin_paths+=(supercrabtree/k)
plugin_paths+=(micha/resty)

# complex zsh-users/zsh-syntax-highlighting configuration
plugin_paths+=(zsh-users/zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=red'
