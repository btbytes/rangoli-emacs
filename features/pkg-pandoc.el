;; pkg-pandoc.el --- pandoc language configuration -*- lexical-binding: t; -*-
(straight-use-package 'pandoc-mode)
(require 'pandoc-mode)

(straight-use-package 'ox-pandoc)
(require 'ox-pandoc)

(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
(provide 'pkg-pandoc)
