
;; latex-mode
(defun cf-init-latex-mode ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-j" next-line)
     ;;("C-n" tex-terminate-paragraph)
     ("C-c C-o" nil)
     ("C-c C-b" latex-insert-block)
     ))
  ;; (setq tex-command "xelatex")
  (setq tex-dvi-print-command "dvipdf")
  (setq tex-dvi-view-command
	'(cond
	  ((eq window-system 'x) "xdvi")
	  ((eq window-system 'w32) "yap")
	  ((eq window-system 'ns) "xdvi")
	  (t "dvi3tty * | cat -s")))
  (outline-minor-mode)
  )
(add-hook 'tex-mode-hook 'cf-init-latex-mode)

;; bibtex mode
(defun cf-bibtex-mode ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-j" nil)
     ("C-c C-j" bibtex-pop-next)
     ("C-c C-k" bibtex-pop-previous)
     ("C-M-h" nil)
     ("C-M-l" nil)
     ("C-M-b" bibtex-mark-entry)
     ("M-n" ispell-complete-word)
     ("M-m" ispell-complete-word)
     )
   )
  (outline-minor-mode)
  )
(add-hook 'bibtex-mode-hook 'cf-bibtex-mode)
