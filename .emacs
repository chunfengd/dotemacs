
;;(add-to-list 'load-path "~/.emacs.d/site")
(mapc 'load (directory-files "~/.emacs.d/init" t
			     "^[a-zA-Z0-9].*.el$"))

(mapc 'load (directory-files "~/.emacs.d/post-init" t
			     "^e_[a-zA-Z0-9].*.el$"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((js2-global-externs list "process" "require" "__dirname")
     (js-indent-level . 4))))
 '(tool-bar-mode nil nil (tool-bar)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

