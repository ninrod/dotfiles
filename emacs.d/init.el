(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "~/code/apps/spacemacs-elpa-mirror/melpa/")
                         ("org" . "~/code/apps/spacemacs-elpa-mirror/org/")
                         ("gnu" . "~/code/apps/spacemacs-elpa-mirror/gnu/")
                         ))

;(add-to-list 'package-archives
;  '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package org
  :ensure org-plus-contrib
  :defer 7)

(org-babel-load-file (expand-file-name "~/.emacs.d/boot.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (restart-emacs forest-blue-theme yasnippet which-key use-package try spacemacs-theme spaceline smart-mode-line ox-reveal org-plus-contrib org-bullets htmlize gruvbox-theme flycheck evil-magit evil-leader evil-commentary doom-themes counsel avy auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
