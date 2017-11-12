(skip-syntax-backward "<" (point-min))

(defun dax ()
  (let ((start (save-excursion
                 (skip-syntax-backward "<" (point-min))
                 (point)))
        (end (save-excursion
               (goto-char (line-end-position))
               (skip-syntax-backward " " (line-beginning-position))
               (point))))
    (evil-range start end)))

(evil-define-text-object evil-a-line (count &optional beg end type)
  "Select range between a character by which the command is followed."
  (evil-line-range count beg end type t))
(evil-define-text-object evil-inner-line (count &optional beg end type)
  "Select inner range between a character by which the command is followed."
  (evil-line-range count beg end type))

(define-key evil-outer-text-objects-map evil-textobj-line-a-key 'evil-a-line)
(define-key evil-inner-text-objects-map evil-textobj-line-i-key 'evil-inner-line)