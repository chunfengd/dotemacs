(add-to-list 'auto-mode-alist '("RakeFile" . ruby-mode))
(defun cf-init-ruby ()
  (cf-set-key-bindings
   'local-set-key
   '())
  ;; (c-toggle-auto-state)
  (c-toggle-hungry-state 1))
(add-hook 'ruby-mode-hook 'cf-init-ruby)
