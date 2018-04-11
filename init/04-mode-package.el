
;; list all packages
;; (package-list-packages)
;; (package-refresh-contents)
;; (cf-install-packages '(auto-complete))

(require 'package)

;; (add-to-list 'package-archives
;;              '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Org-mode's repository
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; local repo
(add-to-list 'package-archives
             `("cf-melpa" . ,(cf-path "../cf-melpa/packages")))

(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun cf-install-packages (packages)
  "Install package list."
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(if (package-installed-p 'exec-path-from-shell)
    (progn
     (require 'exec-path-from-shell)
     (cond
      ((string-equal system-type "windows-nt")
       ;; windows
       (progn
         (exec-path-from-shell-initialize)))
      ((string-equal system-type "darwin")
       ;; mac os x
       (progn
         (exec-path-from-shell-initialize)))))
  (message "exec-path-from-shell not installed"))
