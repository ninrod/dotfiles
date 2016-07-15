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

(define-minor-mode evil-org-mode
  "Buffer local minor mode for evil-org"
  :init-value nil
  :lighter " EvilOrg"
  :keymap (make-sparse-keymap) ; defines evil-org-mode-map
  :group 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode) ;; only load with org-mode

(let ((default-directory  "~/.emacs.d/layers/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'evil)
  (evil-mode 1)

(require 'evil-leader)
  (global-evil-leader-mode)

(require 'spacemacs-dark-theme)

(require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (setq powerline-default-separator 'wave)

(require 'evil-commentary)
  (evil-commentary-mode)

(require 'evil-surround)
  (global-evil-surround-mode 1)

(require 'evil-matchit)
  (global-evil-matchit-mode 1)

(require 'avy)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;;; esc quits pretty much anything (like pending prompts in the minibuffer)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; macros
;; more info here: http://stackoverflow.com/a/22418983/4921402
(defmacro define-and-bind-text-object (key start-regex end-regex)
  (let ((inner-name (make-symbol "inner-name"))
			(outer-name (make-symbol "outer-name")))
	`(progn
		 (evil-define-text-object ,inner-name (count &optional beg end type)
			 (evil-select-paren ,start-regex ,end-regex beg end type count nil))
		 (evil-define-text-object ,outer-name (count &optional beg end type)
			 (evil-select-paren ,start-regex ,end-regex beg end type count t))
		 (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
		 (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))
;; create "ie"/"ae" (inside/around) entire buffer text objects:
(define-and-bind-text-object "e" "\\`\\s-*" "\\s-*\\'")

;; on hold

;; vim binds port
(define-key evil-normal-state-map "s" 'evil-toggle-fold)
(define-key evil-normal-state-map (kbd "RET") 'evil-write)
(define-key evil-normal-state-map "Q" 'evil-quit)
(define-key evil-normal-state-map "Z" 'evil-save-modified-and-close)
(define-key evil-normal-state-map "," 'evil-repeat-find-char)
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-motion-state-map "go" 'evil-goto-first-line)
(define-key evil-motion-state-map "gl" 'evil-goto-line)
(define-key evil-motion-state-map "(" 'evil-backward-paragraph)
(define-key evil-motion-state-map ")" 'evil-forward-paragraph)
; (define-key evil-normal-state-map "q" 'evil-repeat-find-char-reverse)

; experimental
(define-key evil-normal-state-map "q" 'avy-goto-line)
; (global-set-key (kbd "M-g f") 'avy-goto-line)

; org custom binds

(define-key evil-normal-state-map "zu" 'outline-up-heading)
(define-key evil-normal-state-map "zk" 'org-backward-heading-same-level)
(define-key evil-normal-state-map "zh" 'outline-previous-heading)
(define-key evil-normal-state-map "zj" 'org-forward-heading-same-level)
(define-key evil-normal-state-map "zl" 'outline-next-visible-heading)
(define-key evil-normal-state-map "zo" 'org-insert-heading)
(define-key evil-normal-state-map "t" 'org-todo)
(define-key evil-normal-state-map "g<" 'org-metaleft)
(define-key evil-normal-state-map "g>" 'org-metaright)
(define-key evil-normal-state-map "-" 'org-cycle-list-bullet)

(defun enter-scratch-buffer nil
   "switch to the scratch buffer"
   (interactive)
   (switch-to-buffer "*scratch*")
   (lisp-interaction-mode))

(define-key evil-normal-state-map "gs" 'enter-scratch-buffer)

; leader binds
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "v" 'evil-window-vsplit
  "x" 'evil-window-split
  "k" 'evil-window-up
  "l" 'evil-window-right
  "h" 'evil-window-left
  "j" 'evil-window-down)
