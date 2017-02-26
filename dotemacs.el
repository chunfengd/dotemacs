
(defconst cf-dotemacs-home (file-name-directory load-file-name))

(message (concat "cf-dotemacs-home: " cf-dotemacs-home))

(mapc 'load
      (directory-files (concat cf-dotemacs-home "init")
                       t "^[a-zA-Z0-9].*.el$"))

(mapc 'load
      (directory-files (concat cf-dotemacs-home "post-init")
                       t "^e_[a-zA-Z0-9].*.el$"))
