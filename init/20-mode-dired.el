
;; dired
(defun cf-disply-other-copy (beg end)
  "If the mark is active, copy region will be used; otherwise,
open a new line."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-ring-save beg end)
    (dired-display-file)))

(defun cf-dired-key-binding ()
  (cf-set-key-bindings
   'define-key
   ;;'local-set-key
   '(
     ("j" dired-next-line)
     ("k" dired-previous-line)
     ("r" revert-buffer)
     ("C-j" dired-next-line)
     ("C-k" dired-previous-line)
     ("C-p" nil)
     ("C-n" nil)
     ("C-t" set-mark-command)
     ("C-o" cf-disply-other-copy))
   dired-mode-map))
(setq dired-listing-switches "-alnoh")
(defun cf-set-ls (parameter)
  "Set ls parameter in dired mode"
  (interactive "s")
  (setq dired-listing-switches parameter))
(add-hook 'dired-mode-hook 'cf-dired-key-binding)
