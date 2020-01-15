;; pkg-crystal.el --- crystal language configuration  -*- lexical-binding: t; -*-

;; https://melpa.org/#/crystal-mode
(straight-use-package 'crystal-mode)
(require 'crystal-mode)
(autoload 'crystal-mode "crystal-mode" "Major mode for crystal files" t)
(add-to-list 'auto-mode-alist '("\\.cr$" . crystal-mode))
(add-to-list 'interpreter-mode-alist '("crystal" . crystal-mode))
(provide 'pkg-crystal)
