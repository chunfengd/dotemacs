
;; (defvar cf-dotemacs-home (file-name-directory load-file-name)
;;   "HOME of dotemacs repo")

;; (defun cf-path (path)
;;   (expand-file-name path cf-dotemacs-home))

;; (message "cf-dotemacs-home: %s" cf-dotemacs-home)

(load "/Users/chunfeng/dev/dotemacs/init.el")

(mapc 'load
      (directory-files (cf-path "init")
                       t "^[a-zA-Z0-9].*.el$"))

(mapc 'load
      (directory-files (cf-path "post-init")
                       t "^e_[a-zA-Z0-9].*.el$"))
