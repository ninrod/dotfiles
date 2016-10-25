##### completions

# explaining the compinit -u hack:
  # the compinit -u hack is called for because I run the shell as a docker image
  # and mount the dotfiles repo as a volume. Compinit gets angry at me because
  # when docker mounts the volume, the permissions are wrong.
  # So when you run `exec zsh`, for exemple, compinit gets angry at you by saying:
  # "zsh compinit: insecure directories and files, run compaudit for list."
  # The -u flag tells compinit to be silent about that.
  # more info here: http://stackoverflow.com/a/19601821/4921402
# comp bootstrap
autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select


# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

### fuzzy completion
# lifted from http://superuser.com/a/815317/555734
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

# project path completion
source ~/.zsh.d/pj.zsh
