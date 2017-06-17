# fetch zsh deps
source ~/.zsh.d/constants.zsh
mkdir -p $zsh_deps && cd $zsh_deps

# functionality
ningrab ninrod/zsh-bd
ningrab ninrod/k

# completions
ningrab ninrod/docker-zsh-completion
ningrab ninrod/docker-compose-zsh-completion
ningrab zsh-users/zsh-completions

# appearance
ningrab seebi/dircolors-solarized
ningrab zdharma/fast-syntax-highlighting
