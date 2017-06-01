# fetch zsh deps
source ~/.zsh.d/constants.zsh
mkdir -p $zsh_deps && cd $zsh_deps

# functionality
ningrab Tarrasch/bd
ningrab supercrabtree/k

# completions
ningrab ninrod/docker-zsh-completion
ningrab zsh-users/zsh-completions
ningrab zdharma/fast-syntax-highlighting

# appearance
ningrab seebi/dircolors-solarized
ningrab zsh-users/zsh-syntax-highlighting