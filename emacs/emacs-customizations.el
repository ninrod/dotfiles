(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-search-module (quote evil-search))
 '(ibuffer-fontification-alist
   (quote
    ((10 buffer-read-only font-lock-constant-face)
     (15
      (and buffer-file-name
           (string-match ibuffer-compressed-file-name-regexp buffer-file-name))
      font-lock-doc-face)
     (20
      (string-match "^*"
                    (buffer-name))
      font-lock-comment-face)
     (25
      (and
       (string-match "^ "
                     (buffer-name))
       (null buffer-file-name))
      italic)
     (30
      (memq major-mode ibuffer-help-buffer-modes)
      font-lock-comment-face)
     (35
      (eq major-mode
          (quote dired-mode))
      font-lock-function-name-face)
     (1
      (or
       (eq major-mode
           (quote emacs-lisp-mode))
       (eq major-mode
           (quote lisp-mode)))
      highlight-numbers-number)
     (1
      (eq major-mode
          (quote org-mode))
      org-level-1))))
 '(package-selected-packages
   (quote
    (rjsx-mode flycheck-rust racer cargo tide vim-empty-lines-mode vim-empty-lines vi-tilde-fringe smooth-scrolling leuven emaps disable-mouse ibuffer-projectile ibuffer-vc visible-mark smex general yaml-mode editorconfig keyfreq dired-sort-menu dired-details nhexl-mode cider rust-mode gitattributes-mode gitignore-mode intero flycheck-haskell haskell-mode elm-mode alchemist speed-type typit kurecolor info+ sicp niceify-info auto-dim-other-buffers rainbow-mode modeline-posn zerodark-theme darktooh-theme tango-tango-theme dracula-theme apropospriate-theme elpa-clone god-mode material-theme leuven-theme solarized-theme elpa-mirror perspective telephone-line git-gutter-fringe unicode-whitespace highlight-chars vi-tilde-fringe-mode vi-tild-fringe-mode expand-region dired+ highlight-numbers relative-line-numbers vdiff dired-sort dired-details+ dired-k atomic-chrome ob-http restclient json-reformat evil-terminal-cursor-changer json-mode smart-tab evil-tabs less-css-mode emmet-mode git-gutter evil-escape orgbox origami darktooth-theme evil-anzu evil-indent-plus evil-visualstar evil-exchange evil-surround evil-matchit evil ivy-hydra hydra evil-numbers gitconfig-mode smartparens multi-term anzu eyebrowse flx vimrc-mode ranger js2-mode web-mode ag dockerfile-mode evil-args exec-path-from-shell ivy magit counsel-projectile projectile company hl-anything highlight-parentheses rainbow-delimiters all-the-icons neotree markdown-mode yasnippet which-key use-package try spacemacs-theme spaceline smart-mode-line restart-emacs ox-reveal org-plus-contrib org-bullets htmlize flycheck evil-magit evil-leader evil-commentary counsel bind-map avy auto-complete)))
 '(safe-local-variable-values
   (quote
    ((eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))
     (origami-fold-style . triple-braces)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "dark magenta" :foreground "#B3B3B3"))))
 '(whitespace-trailing ((t (:background "red")))))

(put 'narrow-to-region 'disabled nil)
