source ~/.zsh.d/constants.zsh
mkdir -p $emacs_deps && cd $emacs_deps

# mirrors
ningrab ninrod/zipped-melpa-mirror
ningrab ninrod/thin-melpa-mirror

# core editing
ningrab emacs-evil/evil
ningrab noctuid/rect-ext.el
ningrab ninrod/targets.el
ningrab timcharper/evil-surround develop
ningrab edkolev/evil-lion

# forked themes
ningrab ninrod/spacemacs-theme
ningrab ninrod/zerodark-theme
ningrab ninrod/gruvbox-theme
ningrab ninrod/emacs-theme-darktooth
ningrab ninrod/emacs-leuven-theme

# appearance
ningrab ninrod/vim-empty-lines-mode

# toys
ningrab parkouss/speed-type