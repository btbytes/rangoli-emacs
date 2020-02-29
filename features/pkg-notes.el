;; pkg-notes.el -- note taking -*- lexical-binding: t; -*-

;;; Packages

;; deft
(straight-use-package 'deft)
(require 'deft)
(setq deft-recursive t)
(setq deft-extensions '("md" "txt" "org"))
(setq deft-directory "~/btbytes/notes/")
(global-set-key [f8] 'deft)
;; zetteldeft
(straight-use-package 'zetteldeft)
(require 'zetteldeft)
(provide 'pkg-notes)
;; pkg-notes.el ends here
