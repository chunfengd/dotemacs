
;; graphviz mode
;; pachage graphviz-dot-mode

(defun cf-graphviz-mode ()
  ""
  (setq graphviz-dot-indent-width 2)
  (setq graphviz-dot-auto-indent-on-semi nil))

(add-hook 'graphviz-dot-mode-hook 'cf-graphviz-mode)
