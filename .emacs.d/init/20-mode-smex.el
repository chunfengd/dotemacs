
(cf-install-packages
 '(smex))

(defun cf-setup-smex ()
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex))

;; (cf-setup-smex)
