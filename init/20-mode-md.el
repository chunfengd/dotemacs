

(defun cf-setup-md ()
  (cf-install-package-file 'markdown-mode "lib/md/")
  (defun cf-md-mode-hook ()
    (cf-set-key-bindings
     'define-key
     '(
       ("C-c C-j" markdown-next-visible-heading)
       ("C-c C-k" markdown-previous-visible-heading)
       ("C-c C-l" markdown-forward-same-level)
       ("C-c C-h" markdown-backward-same-level)
       ("C-c C-u" markdown-up-heading)

       ("C-c C-c m" nil) ;; 'markdown-other-window
       ("C-c C-c p" nil) ;; 'markdown-preview
       ("C-c C-c e" nil) ;; 'markdown-export
       ("C-c C-c v" nil) ;; 'markdown-export-and-preview
       ("C-c C-c o" nil) ;; 'markdown-open
       ("C-c C-c l" nil) ;; 'markdown-live-preview-mode
       ("C-c C-c w" nil) ;; 'markdown-kill-ring-save
       ("C-c C-c c" nil) ;; 'markdown-check-refs
       ("C-c C-c n" nil) ;; 'markdown-cleanup-list-numbers
       ("C-c C-c ]" nil) ;; 'markdown-complete-buffer
       ("C-c C-c" ace-jump-mode)
       )
     markdown-mode-map))
  (add-hook 'markdown-mode-hook 'cf-md-mode-hook))

(cf-setup-md)
