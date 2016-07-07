;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(add-to-list 'load-path "~/.emacs.d/layers/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/layers/evil-leader")
(require 'evil-leader)

(add-to-list 'load-path "~/.emacs.d/layers/evil-org-mode")
(require 'evil-org)
