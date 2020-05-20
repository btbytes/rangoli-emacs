;; pkg-lisp.el --- lisp language configuration -*- lexical-binding: t; -*-
;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq inferior-lisp-program "/usr/local/bin/ccl64")
(load (expand-file-name "~/quicklisp/slime-helper.el")
)      
;; (straight-use-package 'sly)
;; (straight-use-package 'sly-quicklisp)
;; (require 'sly)
;; (require 'sly-autoloads)



(provide 'pkg-lisp)
