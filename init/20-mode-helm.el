;; http://tuhdo.github.io/helm-intro.html
;; http://tuhdo.github.io/helm-projectile.html
;; https://github.com/bbatsov/projectile

(defun cf-setup-helm ()
  (require 'helm)
  (require 'helm-config)

  ;; keys
  (cf-set-key-bindings
   'global-set-key
   '(("M-x" helm-M-x)
     ("M-y" helm-show-kill-ring)
     ("C-x C-b" helm-mini)
     ("C-x C-f" helm-find-files)
     ;; ("C-x C-h C-p" helm-projectile)
     ("C-x C-p" helm-projectile)
     ("C-x C-d" helm-projectile-find-dir)
     ("C-x C-m" helm-semantic-or-imenu)
     ("C-x C-r" helm-resume)
     ("C-x C-h C-o" helm-occur)
     ("C-x C-h C-p" helm-projectile-switch-project)
     ("C-x C-h C-r" helm-resume)
     ("C-x C-h C-m" helm-all-mark-rings)
     ("C-x C-h C-g" helm-projectile-ag)
     ("C-x C-h C-k" helm-projectile-grep)
     ("C-x C-h C-a" helm-do-ag)
     ))

  ;; general
  ;; open helm buffer inside current window
  (setq helm-split-window-in-side-p t)
  ;; (setq helm-move-to-line-cycle-in-source t)
  ;; M-x
  (setq helm-M-x-fuzzy-match t)
  ;; Mini
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)
  ;; imenu
  (setq helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match    t)
  (setq helm-ff-file-name-history-use-recentf t)
  ;; (helm-autoresize-mode t)
  ;; ;; 40% of current frame height
  ;; (setq helm-autoresize-max-height 40)
  ;; (setq helm-ff-search-library-in-sexp t)
  ;; (setq helm-scroll-amount 8)

  (helm-mode 1)

  (defun cf-bind-helm ()
    (cf-set-key-bindings
     'define-key
     '(("C-w" helm-previous-page))
     minibuffer-local-map)
    (cf-set-key-bindings
     'define-key
     '(("C-w" helm-previous-page))
     helm-generic-files-map)
    (cf-set-key-bindings
     'define-key
     '(("C-w" helm-previous-page))
     helm-find-files-map)
    (cf-set-key-bindings
     'define-key
     '(("C-w" helm-previous-page))
     helm-read-file-map)
    (cf-set-key-bindings
     'define-key
     '(("C-b" helm-toggle-buffers-details))
     helm-buffer-map)
    (cf-set-key-bindings
     'define-key
     '(("C-j" helm-next-line)
       ("C-k" helm-previous-line)
       ("C-n" helm-execute-persistent-action)
       ("C-M-w" helm-scroll-other-window-down)
       ("C-w" helm-previous-page)
       ("C-t" helm-toggle-visible-mark)
       ;; ("M-a" helm-mark-all)
       ;; ("M-U" helm-unmark-all)
       ;; ("C-f" helm-delete-minibuffer-contents)
       )
     helm-map))
  (cf-bind-helm)

  ;; (setq helm-grep-default-command
  ;;       "ack-grep -Hn --color --smart-case --no-group %e %p %f"
  ;;       helm-grep-default-recurse-command
  ;;       "ack-grep -H --color --smart-case --no-group %e %p %f")
  )

;; (defun cf-setup-helm-ag ()
;;   )

(defun cf-setup-projectile ()
  (projectile-global-mode)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-completion-system 'helm)
  (setq projectile-file-exists-remote-cache-expire nil)
  ;; (setq helm-projectile-fuzzy-match nil)
  (setq projectile-switch-project-action 'helm-projectile)
  (setq projectile-enable-caching t)
  (setq helm-buffers-truncate-lines nil)
  ;; (require 'helm-projectile)
  (condition-case nil
      (helm-projectile-on)
    (error nil))
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (cf-set-key-bindings
   'define-key
   '(
     ("C-f" projectile-find-file)
     ("C-h" helm-projectile)
     ("C-p" helm-projectile-switch-project)
     ("C-g" helm-projectile-find-file-dwim))
   projectile-command-map))

(if (and (package-installed-p 'helm-core)
         (package-installed-p 'helm)
         (package-installed-p 'async))
    (cf-setup-helm)
  (message "helm-core, helm or async not installed"))
;; (cf-setup-helm-ag)
(if (and (package-installed-p 'projectile)
         (package-installed-p 'helm-projectile))
    (cf-setup-projectile)
  (message "projectile or helm-projectile not installed"))
