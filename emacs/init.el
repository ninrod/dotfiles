(require 'package)

(setq package-enable-at-startup nil)
;; (setq package-archives '(("melpa" . "~/.emacs.d/lisp/ninrod/thin-melpa-mirror")))
(setq package-archives '(("melpa" . "~/.emacs.d/mirror-elpa/melpa/")
                         ("org"   . "~/.emacs.d/mirror-elpa/org/")
                         ("gnu"   . "~/.emacs.d/mirror-elpa/gnu/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org
  :pin org
  :ensure org-plus-contrib
  :defer 7); fetch latest version of `org-mode'

;; stolen from noctuid's mouseless workflow
;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; don't garbage collect during initialization
(setq gc-cons-threshold (* 100 1024 1024))

(setq vc-follow-symlinks "t") ; prevent prompt when loading org file
(org-babel-load-file "~/.emacs.d/boot.org")

;; also stolen from noctuid's mouseless workflow
;; reset to slightly higher than default; idle timer suggested by vermiculus
(run-with-idle-timer
 10 nil
 (lambda ()
   (setq gc-cons-threshold (* 100 1024))
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))
