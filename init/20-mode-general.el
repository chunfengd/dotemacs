
;; default major mode
(setq default-major-mode 'text-mode)

;; text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'text-mode-hook (lambda ( ) (refill-mode 1)))

;; pro file
(add-to-list 'auto-mode-alist '("\\.pro$" . text-mode))

;; lisp interaction mode
(add-hook 'lisp-interaction-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-j") 'next-line)
	     (local-set-key (kbd "C-M-m") 'eval-print-last-sexp)
	     ))
