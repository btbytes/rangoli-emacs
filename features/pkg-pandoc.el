;; pkg-pandoc.el --- pandoc language configuration -*- lexical-binding: t; -*-
(straight-use-package 'pandoc-mode)
(require 'pandoc-mode)

(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
(provide 'pkg-pandoc)
