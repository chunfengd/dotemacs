;; jump-char

(defun cf-setup-avy ()
  (cf-install-package-file 'avy "lib/avy/")
  (cf-set-key-bindings
   'global-set-key
   '(
     ("M-f" nil)
     ("M-f M-g" avy-goto-char)
     ("M-f M-2" avy-goto-char-2)

     ("M-f M-f" avy-goto-word-1)
     ("M-f M-j" avy-goto-word-1)
     ("M-f M-k" avy-goto-char-2)
     ("M-f M-l" avy-goto-line)
     ("M-f M-w" avy-goto-word-0)
     ))
  )

(cf-setup-avy)
