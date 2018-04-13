
# tangle command line

emacs --batch \
      --load "/Applications/Emacs.app/Contents/Resources/lisp/org/ob-tangle.elc" \
      --eval "(org-babel-tangle-file \"~/dev/dotemacs/init.org\")"
