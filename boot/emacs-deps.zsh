source ~/.zsh.d/constants.zsh
mkdir -p $emacs_deps && cd $emacs_deps

# mirrors
ningrab ninrod/rsynced-melpa

# core editing
ningrab emacs-evil/evil
ningrab noctuid/rect-ext.el
ningrab ninrod/targets.el
ningrab timcharper/evil-surround develop
ningrab edkolev/evil-lion

# forked themes
ningrab ninrod/gruvbox-theme
ningrab ninrod/spacemacs-theme
ningrab ninrod/zerodark-theme
ningrab ninrod/emacs-leuven-theme
