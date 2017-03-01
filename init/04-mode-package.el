
;; list all packages
;; (package-list-packages)
;; (package-refresh-contents)
;; (cf-install-packages '(auto-complete))

(require 'package)

(defvar cf-dotemacs-home)

;; (add-to-list 'package-archives
;;              '("marmalade" . "https://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Org-mode's repository
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)
    (package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun cf-install-packages (packages)
  "Install package list."
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun cf-install-package-file (package path)
  "Install a package from local path"
  (when (not (package-installed-p package))
    (package-install-file (concat cf-dotemacs-home path))))
