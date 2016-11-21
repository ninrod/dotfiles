(require 'package)
(setq package-enable-at-startup nil)

;; using online archives on OSx
(when (eq system-type 'darwin)
  (setq package-archives
        '(("melpa" . "https://melpa.org/packages/")
          ("org"   . "http://orgmode.org/elpa/")
          ("gnu"   . "https://elpa.gnu.org/packages/"))))

;; using ninrod's thin-elpa-mirror

(when (eq system-type 'gnu/linux)
(setq package-archives '(("melpa" . "~/.emacs.d/lisp/ninrod/thin-melpa-mirror"))))

;; ;; using elpa-clone (fat mirror)
;; (setq package-archives '(("melpa" . "~/.emacs.d/mirror-elpa/melpa/")
;;                          ("org"   . "~/.emacs.d/mirror-elpa/org/")
;;                          ("gnu"   . "~/.emacs.d/mirror-elpa/gnu/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; fetch latest version of `org-mode'
(use-package org
  :ensure org-plus-contrib
  :defer 7)

;; org-babel-load my config which is written in `org-mode' format
(org-babel-load-file (expand-file-name "~/.emacs.d/boot.org"))
