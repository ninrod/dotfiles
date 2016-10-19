(require 'package)
(setq package-enable-at-startup nil)

;; use a local melpa mirror. much faster.
(setq package-archives '(("melpa" . "~/code/apps/spacemacs-elpa-mirror/melpa/")
                         ("org" . "~/code/apps/spacemacs-elpa-mirror/org/")
                         ("gnu" . "~/code/apps/spacemacs-elpa-mirror/gnu/")
                         ))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; fetch latest version of `org-mode'
(use-package org
  :ensure org-plus-contrib
  :defer 7)

;; load my config in `org-mode' format
(org-babel-load-file (expand-file-name "~/.emacs.d/boot.org"))
