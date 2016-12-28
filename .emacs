
;;(add-to-list 'load-path "~/.emacs.d/site")
(mapc 'load (directory-files "~/.emacs.d/init" t
			     "^[a-zA-Z0-9].*.el$"))

(mapc 'load (directory-files "~/.emacs.d/post-init" t
			     "^e_[a-zA-Z0-9].*.el$"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((org-todo-keyword-faces
      ("TODO" . org-warning)
      ("NEXT" . "yellow")
      ("PROJ" . "forest green")
      ("DONE" . "green")
      ("WAIT" . "red")
      ("HOLD" . "red")
      ("CANCELLED" . "purple1"))
     (org-enforce-todo-dependencies . t)
     (org-todo-keyword-faces
      ("TODO" . org-warning)
      ("NEXT" . "yellow")
      ("DONE" . "green")
      ("WAIT" . "red")
      ("HOLD" . "red")
      ("CANCELLED" . "purple1"))
     (org-todo-keyword-faces
      ("TODO" . "red")
      ("NEXT" . "yellow")
      ("DONE" . "green")
      ("WAIT" . org-warn)
      ("HOLD" . org-warn)
      ("CANCELLED" . "brown1"))
     (org-todo-state-tags-triggers
      ("CANCELLED"
       ("CANCELLED" . t))
      ("WAIT"
       ("WAIT" . t))
      ("HOLD"
       ("WAIT")
       ("HOLD" . t))
      (done
       ("WAIT")
       ("HOLD"))
      ("TODO"
       ("WAIT")
       ("CANCELLED")
       ("HOLD"))
      ("NEXT"
       ("WAIT")
       ("CANCELLED")
       ("HOLD"))
      ("DONE"
       ("WAIT")
       ("CANCELLED")
       ("HOLD")))
     (org-todo-state-tags-triggers
      ("CANCELLED"
       ("CANCELLED" . t))
      ("WAITING"
       ("WAITING" . t)))
     (org-treat-S-cursor-todo-selection-as-state-change)
     (org-todo-keyword-faces
      ("TODO" . org-warning)
      ("NEXT" . "yellow")
      ("DONE" . "green"))
     (org-todo-keyword-faces
      ("TODO" . org-warning)
      ("NEXT" . "yellow")
      ("DONE" . "forest green"))
     (org-todo-keyword-faces
      ("TODO" . org-warning)
      ("NEXT" . "blue")
      ("DONE" . "forest green"))
     (js2-additional-externs "module" "require" "exports" "describe" "it")
     (js2-additional-externs "module" "require" "exports" "define")
     (grep-find-ignored-files "src/main/java/*" "src/main/ext/*" ".sass-cache/*" "node_modules/*" "target/*" ".git/*")
     (js2-additional-externs "module" "require" "exports" "__dirname")
     (js2-additional-externs "module" "require" "exports")
     (nxml-child-indent . 4)
     (sgml-basic-offset . 4)
     (js2-basic-offset . 4)
     (js2-global-externs list "process" "require" "__dirname")
     (js-indent-level . 4))))
 '(tool-bar-mode nil nil (tool-bar)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'set-goal-column 'disabled nil)
