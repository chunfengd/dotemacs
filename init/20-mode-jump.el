;; jump-char

(defun cf-setup-avy ()
  (cf-set-key-bindings
   'global-set-key
   '(
     ("M-f" nil)

     ("M-f M-f" avy-goto-word-1)
     ("M-f M-g" avy-goto-word-0)

     ("M-f M-j" avy-goto-char-2)
     ("M-f M-k" avy-goto-char)

     ("M-f M-d" avy-goto-char-in-line)

     ("M-f M-l" avy-goto-line)
     )))

(if (package-installed-p 'avy)
    (cf-setup-avy)
  (message "avy not installed"))
