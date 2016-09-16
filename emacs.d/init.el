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
    ("26488f9304ea29009b19a3b0a2660932ef748d098cac25a9a4167561c598a86f" default)))
 '(package-selected-packages
   (quote
    (yasnippet flycheck htmlize ox-reveal smart-mode-line gruvbox-theme auto-complete counsel ivy avy org-bullets which-key try evil-leader evil org-plus-contrib use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
