
;; org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(defconst org-dir-home "~/org")
(if (file-exists-p org-dir-home)
    (setq org-directory org-dir-home))

(defun cf-org-beginning-of-line ()
  (interactive)
  (setq pos-temp (point))
  (back-to-indentation)
  (if (= (point) pos-temp)
      (org-beginning-of-line 1)))

(defun cf-org-mode-hook-func ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-j" next-line)
     ("C-k" previous-line)
     ("C-f" org-kill-line)
     ("C-n" org-return-indent)

     ("C-c C-h" org-backward-heading-same-level)
     ("C-c C-j" outline-next-visible-heading)
     ("C-c C-k" outline-previous-visible-heading)
     ("C-c C-l" org-forward-heading-same-level)

     ("C-c C-b" nil)
     ("C-c C-n" org-goto)
     ("C-c C-p" nil)
     ("C-c C-f" nil)

     ("C-c C-v C-h" org-metaleft)
     ("C-c C-v C-l" org-metaright)
     ("C-c C-v C-k" org-metaup)
     ("C-c C-v C-j" org-metadown)

     ("C-c C-x C-h" org-shiftmetaleft)
     ("C-c C-x C-l" org-shiftmetaright)
     ("C-c C-x C-k" org-shiftmetaup)
     ("C-c C-x C-j" org-shiftmetadown)

     ("M-h" backward-word)
     ("M-b" org-mark-element)

     ("C-c C-f" org-kill-note-or-show-branches) ;; used to be 'C-c C-k'

     ("C-<tab>" org-cycle)
     ("C-S-<tab>" org-shifttab)
     ("C-a" cf-org-beginning-of-line)
     ("C-c RET" nil)

     ("C-S-i" org-table-previous-field)
     ("M-S-RET" org-table-wrap-region)

     ("C-c C-x C-p" org-preview-latex-fragment)

     ("C-c [" nil) ;; org-agenda-file-to-front
     ("C-c ]" nil) ;; org-remove-file
     ))
  (cf-set-key-bindings
   'define-key
   '(
     ("C-M-h" (lambda () (interactive)
                (org-eval-in-calendar '(calendar-backward-day 1))))
     ("C-M-l" (lambda () (interactive)
                (org-eval-in-calendar '(calendar-forward-day 1))))
     ("C-M-k" (lambda () (interactive)
                (org-eval-in-calendar '(calendar-backward-week 1))))
     ("C-M-j" (lambda () (interactive)
                (org-eval-in-calendar '(calendar-forward-week 1))))
     ("C-M-S-h" (lambda () (interactive)
                (org-eval-in-calendar '(calendar-backward-month 1))))
     ("C-M-S-l" (lambda () (interactive)
                (org-eval-in-calendar '(calendar-forward-month 1))))
     )
   org-read-date-minibuffer-local-map)
  (linum-mode 0)
  (org-indent-mode t)
  (flyspell-mode-off)
  (setq org-src-fontify-natively t)
  (setq org-edit-src-content-indentation 0)
  ;; (setq org-infojs-options cf-default-org-infojs-options)
  (setq org-export-html-use-infojs t) ; alternative: when-configured, nil
  (setq org-latex-preview-ltxpng-directory "/tmp/ltxpng/")
  )
(add-hook 'org-mode-hook 'cf-org-mode-hook-func)

(cf-set-key-bindings
 'global-set-key
 '(
   ("C-c c" org-capture)
   ("C-c a" org-agenda)
   ("C-c b" org-iswitchb)
   ))

(setq org-agenda-files
      '("~/org/todo.org"))
;; org-mobile-push
;; org-mobile-pull
;; MobileOrg-staging
