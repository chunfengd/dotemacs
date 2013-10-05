
;; org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-files
      (directory-files "~/Dropbox/org" nil "^.*.org$"))
;;(setq org-mobile-files '("emacs-note.org" "machine-learning.org"))

(defun cf-org-beginning-of-line ()
  (interactive)
  (setq pos-temp (point))
  (back-to-indentation)
  (if (= (point) pos-temp)
      (org-beginning-of-line 1)))

(defun cf-org-mode-hook-func ()
  (cf-set-key-bindings
   'define-key
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

     ("<C-tab>" nil)
     ("C-a" cf-org-beginning-of-line)
     ("C-c RET" nil)

     ("C-S-i" org-table-previous-field)
     ("M-S-RET" org-table-wrap-region)
     )
   org-mode-map)
  (linum-mode 0)
  (org-indent-mode t)
  (flyspell-mode-off))
(add-hook 'org-mode-hook 'cf-org-mode-hook-func)

(cf-set-key-bindings
 'global-set-key
 '(
   ("C-c c" org-capture)
   ("C-c a" org-agenda)
   ("C-c b" org-iswitchb)
   ))

;; org-mobile-push
;; org-mobile-pull
;; MobileOrg-staging
