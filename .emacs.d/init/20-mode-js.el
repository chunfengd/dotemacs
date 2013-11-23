
(cf-install-packages '(js2-mode))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun cf-init-js ()
  (setq js-indent-level 2)
  (setq js2-basic-offset 2))
(add-hook 'js2-mode-hook 'cf-init-js)
