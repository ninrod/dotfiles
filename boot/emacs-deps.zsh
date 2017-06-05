source ~/.zsh.d/constants.zsh
mkdir -p $emacs_deps && cd $emacs_deps

# mirrors
ningrab ninrod/rsynced-melpa

# core editing
ningrab emacs-evil/evil
ningrab emacs-evil/evil-surround
ningrab ninrod/targets.el
ningrab noctuid/rect-ext.el

# forked themes
ningrab ninrod/gruvbox-theme
ningrab ninrod/spacemacs-theme
ningrab ninrod/zerodark-theme
ningrab ninrod/emacs-leuven-theme
