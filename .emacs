
;; (cond
;;  ((string-equal system-type "windows-nt")
;;   (progn
;;     (setenv "HOME" "d:/emacshome")
;;     (setq default-directory "~/"))))

;;(add-to-list 'load-path "~/.emacs.d/site")
(mapc 'load (directory-files "~/.emacs.d/init" t
			     "^[a-zA-Z0-9].*.el$"))

(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
 '(tool-bar-mode nil nil (tool-bar))
;; '(make-backup-files nil)
)

(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
)


