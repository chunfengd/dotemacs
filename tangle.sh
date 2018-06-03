#!/bin/bash

emacs --batch \
      --eval "(require 'ob-tangle)" \
      --eval "(org-babel-tangle-file \"./init.org\")"
