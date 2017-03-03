
(defvar cf-dotemacs-home (file-name-directory load-file-name)
  "HOME of dotemacs repo")

(defun cf-path (path)
  (concat cf-dotemacs-home path))

(message (concat "cf-dotemacs-home: " cf-dotemacs-home))

(mapc 'load
      (directory-files (cf-path "init")
                       t "^[a-zA-Z0-9].*.el$"))

(mapc 'load
      (directory-files (cf-path "post-init")
                       t "^e_[a-zA-Z0-9].*.el$"))
