
;; (setq dotemacs-home "~/")

(mapc 'load
      (directory-files (concat dotemacs-home "init")
                       t "^[a-zA-Z0-9].*.el$"))

(mapc 'load
      (directory-files (concat dotemacs-home "post-init")
                       t "^e_[a-zA-Z0-9].*.el$"))
