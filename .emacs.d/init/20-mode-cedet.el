;; cedet

;(cf-install-packages '(cedet))
;(require 'cedet)

(setq byte-compile-warnings nil)
(defconst cf-user-include-dirs
  (list ".." "../frame" "../src" "../include"
	"../.." "../../frame" "../../src" "../../include"
	"../../.." "../../../frame" "../../../src" "../../../include"))
(defun cf-semantic-folding-key-binding ()
  (cf-set-key-bindings
   'define-key
   '(
     ("C-c C-," semantic-tag-folding-fold-block)
     ("C-c C-." semantic-tag-folding-show-block)
     ("C-c C--" semantic-tag-folding-fold-all)
     ("C-c C-=" semantic-tag-folding-show-all)
     )
   semantic-tag-folding-mode-map))
(defun cf-semantic-tag-key-binding ()
  (cf-set-key-bindings
   'define-key
   '(
     ("f" semantic-ia-fast-jump)
     ("b" cf-semantic-ia-fast-jump-back)
     )
   senator-prefix-map))
(defun cf-load-cedet ()
  ""
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/site-byte/cedet/common")
  (require 'cedet)
  (require 'semantic-ia)
  (require 'semantic-gcc)
  ;;(load-file "~/.emacs.d/site-byte/cedet/common/cedet.el")
  (semantic-load-enable-code-helpers)
  (semantic-load-enable-minimum-features)
  ;;(semantic-load-enable-guady-code-helpers)
  ;;(semantic-load-enable-excessive-code-helpers)
  (semantic-load-enable-semantic-debugging-helpers)
  (require 'semanticdb)
  (global-semanticdb-minor-mode 1)
  ;;(require 'semanticdb-global)
  ;;(semanticdb-enable-gnu-global-databases 'c-mode)
  ;;(semanticdb-enable-gnu-global-databases 'c++-mode)
  (global-ede-mode 1)
  (let ((include-dirs cf-user-include-dirs))
    (if (string-equal system-type "windows-nt")
	(setq include-dirs
	      (append include-dirs cf-system-include-dirs)))
    (mapc (lambda (dir)
	    (semantic-add-system-include dir 'c++-mode)
	    (semantic-add-system-include dir 'c-mode))
	  include-dirs))
  (require 'semantic-tag-folding nil 'noerror)
  (global-semantic-tag-folding-mode 1)
  (cf-semantic-folding-key-binding)
  (cf-semantic-tag-key-binding)
  (mapc 'load (directory-files "~/.emacs.d/cedet-pro" t
			     "^[a-zA-Z0-9].*.el$"))
  )
(cf-load-cedet)
