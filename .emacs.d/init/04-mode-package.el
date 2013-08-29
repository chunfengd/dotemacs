
;; list all packages
;; (package-list-packages)
;; (package-refresh-contents)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun cf-install-packages (packages)
  "Install package list."
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

