#!/bin/bash

/Applications/Emacs.app/Contents/MacOS/Emacs --batch \
      --eval "(require 'ob-tangle)" \
      --eval "(org-babel-tangle-file \"./init.org\")"
