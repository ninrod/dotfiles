source ~/.zsh.d/constants.zsh
mkdir -p $emacs_deps && cd $emacs_deps

# mirrors
ningrab syl20bnr/spacemacs-elpa-mirror
ningrab ninrod/thin-melpa-mirror

# core editing
ningrab noctuid/rect-ext.el
ningrab supermomonga/evil-textobj-entire
ningrab ninrod/evil-surround

# forked themes
ningrab ninrod/spacemacs-theme
ningrab ninrod/zerodark-theme
ningrab ninrod/gruvbox-theme
