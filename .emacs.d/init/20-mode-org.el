
;; org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(defconst org-dir-home "~/Dropbox/org")
(if (file-exists-p org-dir-home)
    (setq org-directory org-dir-home))
;; (setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-mobile-files
;;       (directory-files "~/Dropbox/org" nil "^.*.org$"))
;;(setq org-mobile-files '("emacs-note.org" "machine-learning.org"))

;; default org-infojs-options:
;; ((path . "http://orgmode.org/org-info.js")
;;  (view . "info")
;;  (toc . :table-of-contents)
;;  (ftoc . "0")
;;  (tdepth . "max")
;;  (sdepth . "max")
;;  (mouse . "underline")
;;  (buttons . "0")
;;  (ltoc . "1")
;;  (up . :link-up)
;;  (home . :link-home))
(setq cf-default-org-infojs-options
      '((path . "js/org-info.js")
        (author . nil)
        (email . nil)
        (creator . nil)
        (view . overview)
        (toc . t)
        (tdepth . "max")
        (sdepth . "max")
        (mouse . "underline")
        (buttons . "0")
        (ltoc . "1")
        (up . :line-up)
        (home . :link-home)))

(when (file-exists-p org-dir-home)
  (require 'org-publish)
  (setq org-publish-project-alist
        '(("org-notes"
           :base-directory "~/Dropbox/org/"
           :base-extension "org"
           :publishing-directory "~/Dropbox/org-html/"
           :recursive t
           :publishing-function org-publish-org-to-html
           :headline-levels 4
           :auto-preamble t)
          ("org-static"
           :base-directory "~/Dropbox/org/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/Dropbox/org-html/"
           :recursive t
           :publishing-function org-publish-attachment)
          ("org" :components ("org-notes" "org-static")))))

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

     ("C-c C-x C-p" org-preview-latex-fragment)
     )
   org-mode-map)
  (linum-mode 0)
  (org-indent-mode t)
  (flyspell-mode-off)
  (setq org-src-fontify-natively t)
  (setq org-infojs-options cf-default-org-infojs-options)
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

;; org-mobile-push
;; org-mobile-pull
;; MobileOrg-staging
