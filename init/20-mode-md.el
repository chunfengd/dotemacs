

(defun cf-setup-md ()
  ;; (cf-install-package-file 'markdown-mode "lib/md/")
  (defun cf-md-mode-hook ()
    (cf-set-key-bindings
     'define-key
     '(
       ("C-c C-j" markdown-next-visible-heading)
       ("C-c C-k" markdown-previous-visible-heading)
       ("C-c C-l" markdown-forward-same-level)
       ("C-c C-h" markdown-backward-same-level)
       ("C-c C-u" markdown-up-heading)
       )
     markdown-mode-map))
  (add-hook 'markdown-mode-hook 'cf-md-mode-hook))

(if (package-installed-p 'markdown-mode)
    (cf-setup-md)
  (message "md not installed"))
