
(cf-install-packages '(helm))

(require 'helm)
(require 'helm-config)

(defun cf-setup-helm ()
  ;; keys
  (cf-set-key-bindings
   'define-key
   '(
     ("C-j" helm-next-line)
     ("C-k" helm-previous-line)
     ("C-n" helm-execute-persistent-action)
     ("C-M-w" helm-scroll-other-window-down)
     ("C-w" helm-previous-page)
     ("C-t" helm-toggle-visible-mark)
     ;; ("M-a" helm-mark-all)
     ;; ("M-U" helm-unmark-all)
     ;; ("C-f" helm-delete-minibuffer-contents)
     )
   helm-map)
  (cf-set-key-bindings
   'global-set-key
   '(("M-x" helm-M-x)
     ("M-y" helm-show-kill-ring)
     ("C-x C-b" helm-mini)
     ("C-x C-f" helm-find-files)
     ("C-x C-h C-o" helm-occur)
     ))

  ;; general
  (setq helm-split-window-in-side-p t)
  (setq helm-move-to-line-cycle-in-source t)
  ;; M-x
  (setq helm-M-x-fuzzy-match t)
  ;; Mini
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)
  ;; open helm buffer inside current window

  (setq helm-ff-file-name-history-use-recentf t)
  ;; (helm-autoresize-mode t)
  ;; ;; 40% of current frame height
  ;; (setq helm-autoresize-max-height 40)
  ;; (setq helm-ff-search-library-in-sexp t)
  ;; (setq helm-scroll-amount 8)

  (helm-mode 1)

  (cf-set-key-bindings
   'define-key
   '(
     ("C-p" helm-find-files-up-one-level)
     )
   helm-find-files-map)
  )
(cf-setup-helm)


(defun cf-setup-projectile ()
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (setq projectile-file-exists-remote-cache-expire nil)
  (require 'helm-projectile)
  (helm-projectile-on)
  (cf-set-key-bindings
   'define-key
   '(
     ("C-f" projectile-find-file)
     ("C-h" helm-projectile))
   projectile-command-map))
(cf-setup-projectile)
