;; pkg-java.el --- java programming functionality -*- lexical-binding: t; -*-

;;; Packages

(straight-use-package 'eclim)
(add-hook 'java-mode-hook 'eclim-mode)
(require 'eclimd)

(custom-set-variables
  '(eclim-eclipse-dirs '("/Applications/Eclipse Java.app/"))
  '(eclim-executable "/Applications/Eclipse Java.app/Contents/Eclipse/eclimd"))

(provide 'pkg-java)
;; pkg-java.el ends here
