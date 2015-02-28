(add-to-list 'auto-mode-alist '("RakeFile" . ruby-mode))
(defun cf-init-ruby ()
  (cf-set-key-bindings
   'local-set-key
   '(("C-c C-c" ace-jump-mode)
     ("C-c C-z" comment-or-uncomment-region)))
  ;; (c-toggle-auto-state)
  (c-toggle-hungry-state 1))
(add-hook 'ruby-mode-hook 'cf-init-ruby)
