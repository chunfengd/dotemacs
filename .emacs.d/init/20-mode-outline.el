
;; outline mode
(setq outline-minor-mode-prefix (kbd "C-c C-o"))
(defun cf-outline-minor-mode ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-c C-=" show-all)
     ("C-c C--" hide-body)
     ("C-c C-[" hide-subtree)
     ("C-c C-]" show-subtree)
     ("C-c C-," hide-entry)
     ("C-c C-." show-entry)
     ("C-c C-j" outline-next-visible-heading)
     ("C-c C-k" outline-previous-visible-heading)
     ("C-c C-h" outline-backward-same-level)
     ("C-c C-l" outline-forward-same-level)
     ("C-c C-u" outline-up-heading)
     )
   )
  )
(add-hook 'outline-minor-mode-hook 'cf-outline-minor-mode)
