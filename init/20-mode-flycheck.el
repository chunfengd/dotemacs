;;
;; flycheck-verify-setup(C-c ! v): to check whether flycheck setup is complete
;; (C-c ! n) & (C-c ! p): to jump back and forth between erroneous places
;; (C-c ! l)': to pop up a list of all errors in the current buffer
;; flycheck-select-checker: to use this as the 1st for current buffer
;; flycheck-buffer('C-c ! c'): to check manually
;; [var]flycheck-checker: checker used for current buffer
;;

(defun cf-setup-flycheck ()
  (add-to-list 'load-path (concat cf-dotemacs-home "lib/flycheck"))
  (require 'flycheck)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq flycheck-global-modes
        '(emacs-lisp-mode js-mode))
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp-checkdoc)))

(cf-setup-flycheck)
