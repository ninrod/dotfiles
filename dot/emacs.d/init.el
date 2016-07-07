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
(add-to-list 'load-path "~/.emacs.d/layers/evil-leader")
(add-to-list 'load-path "~/.emacs.d/layers/evil-org-mode")
(add-to-list 'load-path "~/.emacs.d/layers/spacemacs-theme")
(add-to-list 'load-path "~/.emacs.d/layers/emacs-theme-gruvbox")
(add-to-list 'load-path "~/.emacs.d/layers/linum-relative")
(add-to-list 'load-path "~/.emacs.d/layers/org-bullets")

(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(require 'linum-relative)

(require 'spacemacs-dark-theme)

; (require 'org-bullets)
; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(global-evil-leader-mode)
(evil-mode 1)
(linum-relative-global-mode)

;;; esc quits pretty much anything (like pending prompts in the minibuffer)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; rebinds
(define-key evil-normal-state-map "s" 'evil-toggle-fold)

(define-key evil-normal-state-map (kbd "RET") 'evil-write)
(define-key evil-normal-state-map "Q" 'evil-quit)
(define-key evil-normal-state-map "Z" 'evil-save-modified-and-close)

(define-key evil-motion-state-map "go" 'evil-goto-first-line)
(define-key evil-motion-state-map "gl" 'evil-goto-line)

; leader binds
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "v" 'evil-window-vsplit
  "x" 'evil-window-split
  "k" 'evil-window-up
  "l" 'evil-window-right
  "h" 'evil-window-left
  "j" 'evil-window-down
)

(setq linum-relative-current-symbol "")
