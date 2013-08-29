
;; cc mode
(defun cf-kill-cc (beg end)
  "If the mark is active, kill region will be used; otherwise, delete
char will be used."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-region beg end)
    (c-electric-delete-forward nil)))

(add-to-list 'auto-mode-alist '("\\.vs$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.fs$" . c++-mode))
(defun cf-semantic-ia-fast-jump-back ()
  "zz from: http://emacser.com/cedet.htm"
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
	 (alist (semantic-mrub-ring-to-assoc-list ring))
	 (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag)
				   (semantic-current-tag))
	(setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))
(c-add-style
 "chunfeng-c-style"
 '("gnu"
   (c-offsets-alist
    .
    ((innamespace . 0)
     (arglist-intro . 4)
     (arglist-cont-nonempty . 4)
     (arglist-close . 4)
     ))))
(setq c-default-style "chunfeng-c-style")
(defun cf-init-c ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("M-l" c-forward-into-nomenclature)
     ("M-h" c-backward-into-nomenclature)
     ("C-M-h" backward-sexp)
     ("C-M-b" c-mark-function)
     ("C-c C-j" senator-next-tag)
     ("C-c C-k" senator-previous-tag)
     ("C-c C-t" semantic-analyze-proto-impl-toggle)
     ("C-c C-f" semantic-ia-fast-jump)
     ("C-c C-b" cf-semantic-ia-fast-jump-back)
     ("C-d" cf-kill-cc)
     ("C-c C-c" comment-or-uncomment-region)))
  ;; (c-toggle-auto-state)
  (c-toggle-hungry-state 1))
(add-hook 'c-mode-hook 'cf-init-c)
(add-hook 'c++-mode-hook 'cf-init-c)
