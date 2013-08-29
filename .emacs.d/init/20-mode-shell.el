
(defun cf-shell-kill (beg end)
  "If the mark is active, kill region will be used; otherwise, delete
char will be used."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-region beg end)
    (comint-delchar-or-maybe-eof 1)))

;; shell mode
(defun cf-shell-mode-hook-func ()
  (cf-set-key-bindings
   'define-key
   '(
     ("C-d" cf-shell-kill)
     ("C-M-l" nil)
     ;;("C-c h" comint-history-isearch-backward)
     ;;("M-s" comint-history-isearch-search)
     ("C-c h" comint-history-isearch-backward-regexp)

     ("M-j" comint-next-input)
     ("M-k" comint-previous-input)
     ("M-h" backward-word)
     ("M-n" nil)
     ("M-p" nil)

     ("C-c C-h" shell-backward-command)
     ("C-c C-l" shell-forward-command)
     ("C-c C-j" comint-next-prompt)
     ("C-c C-k" comint-previous-prompt)

     ("C-c C-b" nil)
     ("C-c C-n" nil)
     ("C-c C-p" nil)
     ("C-c C-f" nil)
     )
   shell-mode-map)
  (linum-mode 0))
(add-hook 'shell-mode-hook 'cf-shell-mode-hook-func)
