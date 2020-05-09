;; pkg-janet.el -- janet language configuration -*- lexical-binding: t; -*-

(straight-use-package
 '(janet-mode
   :type git
   :host github
   :repo "ALSchwalm/janet-mode"
   ))
(require 'janet-mode)
(straight-use-package
 '(ijanet
   :type git
   :host github
   :repo "serialdev/ijanet-mode"
))
(straight-use-package 'paredit)
(require 'paredit)


(provide 'pkg-janet)

;; C-c C-p [Start repl] (ijanet)
;; C-c C-b [Eval buffer] (ijanet-eval-buffer)
;; C-c C-l [Eval line] (ijanet-eval-line)
;; C-c C-r [eval region] (ijanet-eval-region)
