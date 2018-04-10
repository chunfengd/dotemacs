
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

(defun cf-install-package-file (package path)
  "Install a package from local path"
  (when (not (package-installed-p package))
    (package-install-file (cf-path path))))

(defun cf-install-package-file-force (path)
  "Install a package from local path"
  (package-install-file (cf-path path)))

(defun cf-install-files (package package-name dir files &optional force)
  "Work around for melpa, which allows multiple packages
 in one repository"
  (when (or force (not (package-installed-p package)))
    (let ((src-dir (cf-path dir))
          (dst-dir (cf-path (concat "tmp/" package-name "/"))))
      ;; delete and recreate temp dst-dir
      (shell-command-to-string
       (format "[ -e %s ] && rm -rf %s; mkdir -p %s"
               dst-dir dst-dir dst-dir))
      ;; copy files into dst-dir
      (mapc (lambda (f)
              (let ((from (concat src-dir f))
                    (to (concat dst-dir f)))
                (shell-command-to-string
                 (format "cp %s %s" from to))))
            files)
      ;; install package from dst-dir
      (package-install-file dst-dir))))

;; (require 'exec-path-from-shell)
;; (cond
;;  ((string-equal system-type "windows-nt")
;;   ;; windows
;;   (progn
;;     (exec-path-from-shell-initialize)))
;;  ((string-equal system-type "darwin")
;;   ;; mac os x
;;   (progn
;;     (exec-path-from-shell-initialize))))
