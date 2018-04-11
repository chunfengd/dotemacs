
;; ac
(defun cf-ac-setup ()
  (ac-config-default)
  (cf-set-key-bindings
   'define-key
   '(
     ("TAB" nil)
     ("RET" nil)
     ;;("M-/" ac-expand)
     ("M-m" ac-complete)
     ("M-n" ac-expand)
     ("M-j" ac-next)
     ("M-k" ac-previous)
     )
   ac-complete-mode-map)

  (define-key ac-mode-map (kbd "M-n") 'auto-complete)
  ;;(define-key ac-mode-map (kbd "M-m") 'auto-complete)

  (setq ac-auto-start 4)
  (setq ac-quick-help-delay 0.5)
  (setq ac-use-fuzzy nil))

(if (package-installed-p 'auto-complete)
    (cf-ac-setup)
  (message "auto-complete not installed"))
