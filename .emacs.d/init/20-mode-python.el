
;;(cf-install-packages '(python))

(defun cf-init-python ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-c C-c" comment-or-uncomment-region)))
  ;; (c-toggle-auto-state)
  (c-toggle-hungry-state 1))
(add-hook 'python-mode-hook 'cf-init-python)
