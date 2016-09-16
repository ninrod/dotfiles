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
