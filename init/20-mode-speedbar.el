
;; speedbar
(defun cf-speedbar-key-hook-func ()
  (cf-set-key-bindings
   'define-key
   '(
    ("j" speedbar-next)
    ("k" speedbar-prev)
    ("C-M-j" speedbar-forward-list)
    ("C-M-k" speedbar-backward-list)
    ("M-j" speedbar-restricted-next)
    ("M-k" speedbar-restricted-prev)
    )
   speedbar-key-map)
  (cf-set-key-bindings
   'define-key
   '(
     ("k" speedbar-prev)
     ("d" speedbar-buffer-kill-buffer)
     )
   speedbar-buffers-key-map)
  (linum-mode 0))
;; (defun cf-speedbar-func ()
;;   (linum-mode 0))
(add-hook 'speedbar-reconfigure-keymaps-hook
          'cf-speedbar-key-hook-func)
(eval-after-load "speedbar-mode"
  '(progn
     (linum-mode 0)))
;; (add-hook 'speedbar-mode-hook
;;           'cf-speedbar-func)
